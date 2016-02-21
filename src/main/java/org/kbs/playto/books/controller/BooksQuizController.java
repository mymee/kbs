package org.kbs.playto.books.controller;

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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;

@Controller
@RequestMapping(value="/books")
public class BooksQuizController {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TeamInfoDAO teamInfoDAO;

    @Autowired
    private QuizDAO quizDAO;

    @RequestMapping(value="/quiz",method = {RequestMethod.GET, RequestMethod.POST})
    public String quizView(HttpServletRequest request, HttpServletResponse response, Model model){

        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizVO = new ValueObject();
        quizVO.setString("teamSeq", teamSeq);

        model.addAttribute("QUIZ_PROCESS", quizDAO.selectQuizProcessNumber());
        model.addAttribute("QUIZ_INFO", quizDAO.selectQuizInfoProcess());
        model.addAttribute("TEAM_INFO",teamInfoDAO.selectTeamInfo(quizVO));

        return "books/quiz";
    }

    @RequestMapping(value="/quiz/process",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizInfoProcess(HttpServletRequest request){

        return quizDAO.selectQuizProcessNumber();
    }

    @RequestMapping(value="/info",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizInfo(HttpServletRequest request){

        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizVO = new ValueObject();
        quizVO.setString("teamSeq", teamSeq);

        return quizDAO.selectQuizInfo(quizVO);
    }

    @RequestMapping(value="/quiz/submit",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizSubmit(@RequestBody BooksQuizAnswer booksQuizAnswer){

        ValueObject quizVO = new ValueObject();
        quizVO.setString("teamSeq", booksQuizAnswer.getTeamSeq());
        quizVO.setString("quizAnswer", booksQuizAnswer.getQuizAnswer());
        quizVO.setString("quizNum", booksQuizAnswer.getQuizNum());
        quizVO.setString("quizChance", booksQuizAnswer.getQuizChance());
        int quizAnswerScore = 0;
        ValueObject quizScore = quizDAO.selectQuizScore(quizVO);

        if(quizScore == null){
            ValueObject quizInfo = quizDAO.selectQuizInfo(quizVO);
            if(quizInfo != null){
                quizAnswerScore = quizInfo.getNumber("SCORE").intValue();
            }
            switch (booksQuizAnswer.getQuizChance()){
                case "1": quizVO.setNumber("quizChance1", 1); break;
                case "2": quizVO.setNumber("quizChance2", 1); break;
                case "3": quizVO.setNumber("quizChance3", 1); quizAnswerScore = quizAnswerScore *2; break;
                case "4": quizVO.setNumber("quizChance4", 1); quizAnswerScore = quizAnswerScore *2; break;
                case "5": quizVO.setNumber("quizChance5", 1); break;
                case "6": quizVO.setNumber("quizChance6", 1); break;
            }
            quizVO.setNumber("quizAnswerScore",quizAnswerScore);
            quizDAO.insertQuizAnswer(quizVO);
        }

        return teamInfoDAO.selectTeamQuizProcessInfo(quizVO);
    }

    @RequestMapping(value="/quiz/next/{quizNum}",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizStart(@PathVariable int quizNum){

        ValueObject quizVO = new ValueObject();
        quizVO.setNumber("quizNum", quizNum);
        quizVO.setNumber("quizEnd", 0);
        quizDAO.updateQuizProcessNumber(quizVO);
        quizDAO.updateQuizStart(quizVO);
        return quizDAO.selectQuizInfoProcess();
    }

    @RequestMapping(value="/quiz/end/{quizNum}",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizEnd(@PathVariable int quizNum){


        ValueObject quizVO = new ValueObject();
        quizVO.setNumber("quizNum", quizNum);
        quizVO.setNumber("quizEnd", 1);
        quizDAO.updateQuizProcessNumber(quizVO);
        quizDAO.updateQuizEnd(quizVO);
        return quizDAO.selectQuizInfoProcess();
    }

    //찬스사용
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor={Exception.class})
    @RequestMapping(value="/quiz/{quizChance}/{teamSeq}",method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
    @ResponseBody
    public ReturnMessage quizEnd(@PathVariable int quizChance, @PathVariable int teamSeq){

        String messageText = "";
        int messageCode = 0;
        ValueObject quizVO = new ValueObject();
        quizVO.setNumber("quizChance", quizChance);
        quizVO.setNumber("teamSeq", teamSeq);

        //ValueObject quizInfo = quizDAO.selectQuizInfo(quizVO);
        ValueObject quizChanceInfo = quizDAO.selectQuizChance(quizVO);
        if(quizChanceInfo == null){
            quizDAO.insertQuizChanceInfo(quizVO);
            messageCode = 1;
            messageText = "정상적으로 신청되었습니다.\n다음 문제에 적용됩니다.";
        }else{
            messageCode = 0;
            int chanceType =  Integer.parseInt(quizChanceInfo.getString("CHANCE_TYPE"));
            switch (chanceType){
                case 1: messageText = "우선권 카드를 "; break;
                case 2: messageText = ""; break;
                case 3: messageText = "더블점수 카드를 "; break;
                case 4: messageText = "더블찬스 카드를 "; break;
                case 5: messageText = ""; break;
                case 6: messageText = ""; break;
            }
            messageText = messageText + "이미 신청한 상태입니다.\n다음에 사용해 주세요.";
        }

        ReturnMessage returnMessage = new ReturnMessage();
        returnMessage.setReturnCode(messageCode);
        returnMessage.setReturnMessage(messageText);
        return returnMessage;
    }

    @RequestMapping(value="/priority",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizPriority(HttpServletRequest request){

        String quizNum = request.getParameter("quizNum");
        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizVO = new ValueObject();
        quizVO.setString("quizNum", quizNum);
        quizVO.setString("teamSeq", teamSeq);

        quizDAO.updateQuizPriority(quizVO);
        return quizDAO.selectQuizInfo(quizVO);
    }

    @RequestMapping(value="/double",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizDouble(HttpServletRequest request){

        String quizNum = request.getParameter("quizNum");
        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizVO = new ValueObject();
        quizVO.setString("quizNum", quizNum);
        quizVO.setString("teamSeq", teamSeq);

        quizDAO.updateQuizDouble(quizVO);
        return quizDAO.selectQuizInfo(quizVO);
    }
}
