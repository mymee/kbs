package org.kbs.playto.books.controller;

import com.sun.org.apache.bcel.internal.generic.RET;
import org.kbs.playto.books.common.ValueObject;
import org.kbs.playto.books.dao.QuizDAO;
import org.kbs.playto.books.dao.TeamInfoDAO;
import org.kbs.playto.books.entity.BooksQuizAnswer;
import org.kbs.playto.books.entity.ReturnMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping(value = "/books")
public class BooksQuizController {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TeamInfoDAO teamInfoDAO;

    @Autowired
    private QuizDAO quizDAO;

    @RequestMapping(value = "/quiz", method = {RequestMethod.GET, RequestMethod.POST})
    public String quizView(HttpServletRequest request, HttpServletResponse response, Model model) {

        String teamSeq = request.getParameter("teamSeq");
        // 쿠키값 가져오기
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {

            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];

                if (c.getName().equals("SEQ")) {
                    teamSeq = c.getValue();
                }
            }
        }

        ValueObject quizVO = new ValueObject();
        quizVO.setString("teamSeq", teamSeq);

        model.addAttribute("TEAM_QUIZ_PROCESS", teamInfoDAO.selectTeamQuizProcessInfo(quizVO));
//        model.addAttribute("QUIZ_PROCESS", quizDAO.selectQuizProcessNumber());
//        model.addAttribute("QUIZ_INFO", quizDAO.selectQuizInfoProcess());
//        model.addAttribute("TEAM_INFO",teamInfoDAO.selectTeamInfo(quizVO));

        return "books/quiz";
    }

    @RequestMapping(value = "/quiz/process", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizInfoProcess(HttpServletRequest request) {

        return quizDAO.selectQuizProcessNumber();
    }

    @RequestMapping(value = "/info", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizInfo(HttpServletRequest request) {

        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizVO = new ValueObject();
        quizVO.setString("teamSeq", teamSeq);

        return quizDAO.selectQuizInfo(quizVO);
    }

    @RequestMapping(value = "/quiz/submit", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ReturnMessage quizSubmit(@RequestBody BooksQuizAnswer booksQuizAnswer) {

        int messageCode = 0;
        String messageText = "";

        ValueObject quizVO = new ValueObject();
        quizVO.setString("teamSeq", booksQuizAnswer.getTeamSeq());
        quizVO.setString("quizAnswer", booksQuizAnswer.getQuizAnswer());
        quizVO.setString("quizNum", booksQuizAnswer.getQuizNum());
        quizVO.setString("quizChance", booksQuizAnswer.getQuizChance());
        int quizAnswerScore = 0;
        ValueObject quizScore = quizDAO.selectQuizScore(quizVO);

        if (quizScore == null) {
            List<ValueObject> quizNumFirstChance = quizDAO.selectQuizNumFirstChance(quizVO);
            boolean firstChance = false;
            if (quizNumFirstChance.size() > 0) {
                for (ValueObject teamChance : quizNumFirstChance) {
                    if (teamChance.containsKey("TEAM_SEQ")) {
                        if (teamChance.getString("TEAM_SEQ").equals(booksQuizAnswer.getTeamSeq())) {
                            firstChance = true;
                        }
                    }
                }
            } else {
                firstChance = true;
            }
            if (firstChance) {
                quizVO.setNumber("quizAnswerScore", quizAnswerScore);
                quizDAO.insertQuizAnswer(quizVO);
                messageText = "답안을 제출하였습니다.";
            } else {
                messageText = "다른팀에서 우선권을 제출하여 답안을 제출할 수 없습니다.";
            }

        } else {
            messageText = "이미 답안을 제출하였습니다.\n다음 문제풀이를 기다려주세요";
        }

        ReturnMessage returnMessage = new ReturnMessage();
        returnMessage.setReturnCode(messageCode);
        returnMessage.setReturnMessage(messageText);

        //return teamInfoDAO.selectTeamQuizProcessInfo(quizVO);
        return returnMessage;
    }

    @RequestMapping(value = "/quiz/next/{quizNum}", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizStart(@PathVariable int quizNum) {

        ValueObject quizVO = new ValueObject();
        quizVO.setNumber("quizNum", quizNum);
        quizVO.setNumber("quizEnd", 0);
        quizDAO.updateQuizProcessNumber(quizVO);
        quizDAO.updateQuizStart(quizVO);
        return quizDAO.selectQuizInfoProcess();
    }

    @RequestMapping(value = "/quiz/end/{quizNum}", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizEnd(@PathVariable int quizNum) {


        ValueObject quizVO = new ValueObject();
        quizVO.setNumber("quizNum", quizNum);
        quizVO.setNumber("quizEnd", 1);
        quizDAO.updateQuizProcessNumber(quizVO);
        quizDAO.updateQuizEnd(quizVO);

        ValueObject quizInfo = quizDAO.selectQuizInfo(quizVO);
        String quizInfoAnswer = quizInfo.getString("ANSWER");
        int quizInfoScore = quizInfo.getNumber("SCORE").intValue();
        int teamSeq = 0;
        int teamScore = 0;
        int targetTeam = 0;
        int chanceType = 0;
        String answer = "";
        List<ValueObject> quizScoreChance = quizDAO.selectQuizScoreChance(quizVO);

        for (ValueObject quizScore : quizScoreChance) {
            teamScore = 0;
            if (quizScore.containsKey("TEAM_SEQ")) {
                teamSeq = quizScore.getNumber("TEAM_SEQ").intValue();
            } else {
                teamSeq = 0;
            }
            if (quizScore.containsKey("CHANCE_TYPE")) {
                chanceType = quizScore.getNumber("CHANCE_TYPE").intValue();
            } else {
                chanceType = 0;
            }
            if (quizScore.containsKey("QUIZ_ANSWER")) {
                answer = quizScore.getString("QUIZ_ANSWER");
            } else {
                answer = "";
            }

            switch (chanceType) {
                case 1:
                    if (quizInfoAnswer.toString().equals(answer.toString())) {
                        teamScore = quizInfoScore;
                        quizVO.setNumber("teamSeq", teamSeq);
                        quizVO.setNumber("teamScore", teamScore);
                    }
                    break;
                case 2:
                    break;
                case 3:
                    if (quizInfoAnswer.toString().equals(answer.toString())) {
                        teamScore = quizInfoScore * 2;
                        quizVO.setNumber("teamSeq", teamSeq);
                        quizVO.setNumber("teamScore", teamScore);
                    }
                    break;
                case 4:
                    if (quizInfoAnswer.toString().equals(answer.toString())) {
                        teamScore = quizInfoScore * 2;
                        if (quizScore.containsKey("TARGET_TEAM")) {
                            targetTeam = quizScore.getNumber("TARGET_TEAM").intValue();
                        } else {
                            targetTeam = 0;
                        }
                        quizVO.setNumber("teamSeq", targetTeam);
                        quizVO.setNumber("quizInfoScore", quizInfoScore);
                        teamInfoDAO.updateTeamChanceTargetMinus(quizVO);
                        quizVO.setNumber("teamSeq", teamSeq);
                        quizVO.setNumber("teamScore", teamScore);
                    }
                    break;
                case 5:
                    break;
                case 6:
                    break;
                default:
                    break;
            }
            quizDAO.updateQuizScore(quizVO);
        }

        return quizDAO.selectQuizInfoProcess();
    }

    //찬스사용
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
    @RequestMapping(value = "/quiz/{quizChance}/{teamSeq}", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
    @ResponseBody
    public ReturnMessage quizEnd(@PathVariable int quizChance, @PathVariable int teamSeq) {

        String messageText = "";
        int messageCode = 0;
        ValueObject quizVO = new ValueObject();
        quizVO.setNumber("quizChance", quizChance);
        quizVO.setNumber("teamSeq", teamSeq);

        //ValueObject quizInfo = quizDAO.selectQuizInfo(quizVO);
        ValueObject quizChanceInfo = quizDAO.selectQuizChance(quizVO);
        if (quizChanceInfo == null) {
            quizDAO.insertQuizChanceInfo(quizVO);
            messageCode = 1;
            messageText = "정상적으로 신청되었습니다.\n다음 문제에 적용됩니다.";
        } else {
            messageCode = 0;
            int chanceType = Integer.parseInt(quizChanceInfo.getString("CHANCE_TYPE"));
            switch (chanceType) {
                case 1:
                    messageText = "우선권 카드를 ";
                    break;
                case 2:
                    messageText = "";
                    break;
                case 3:
                    messageText = "더블점수 카드를 ";
                    break;
                case 4:
                    messageText = "더블찬스 카드를 ";
                    break;
                case 5:
                    messageText = "";
                    break;
                case 6:
                    messageText = "";
                    break;
            }
            messageText = messageText + "이미 신청한 상태입니다.\n다음에 사용해 주세요.";
        }

        ReturnMessage returnMessage = new ReturnMessage();
        returnMessage.setReturnCode(messageCode);
        returnMessage.setReturnMessage(messageText);
        return returnMessage;
    }

    @RequestMapping(value = "/priority", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizPriority(HttpServletRequest request) {

        String quizNum = request.getParameter("quizNum");
        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizVO = new ValueObject();
        quizVO.setString("quizNum", quizNum);
        quizVO.setString("teamSeq", teamSeq);

        quizDAO.updateQuizPriority(quizVO);
        return quizDAO.selectQuizInfo(quizVO);
    }

    @RequestMapping(value = "/double", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizDouble(HttpServletRequest request) {

        String quizNum = request.getParameter("quizNum");
        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizVO = new ValueObject();
        quizVO.setString("quizNum", quizNum);
        quizVO.setString("teamSeq", teamSeq);

        quizDAO.updateQuizDouble(quizVO);
        return quizDAO.selectQuizInfo(quizVO);
    }


}
