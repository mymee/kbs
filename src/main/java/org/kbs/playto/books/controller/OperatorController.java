package org.kbs.playto.books.controller;

import org.kbs.playto.books.common.ValueObject;
import org.kbs.playto.books.dao.KoreanBattleDAO;
import org.kbs.playto.books.dao.QuizDAO;
import org.kbs.playto.books.dao.TeamInfoDAO;
import org.kbs.playto.books.dao.WorkingMemoryDAO;
import org.kbs.playto.books.entity.ReturnMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value="/operator")
public class OperatorController {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TeamInfoDAO teamInfoDAO;

    @Autowired
    private KoreanBattleDAO koreanBattleDAO;

    @Autowired
    private WorkingMemoryDAO workingMemoryDAO;

    @Autowired
    private QuizDAO quizDAO;

    @RequestMapping(value="/status",method = RequestMethod.GET)
    public String teamStatusList(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        model.addAttribute("TEAM_INFO_LIST",teamInfoDAO.selectTeamInfoList(teamInfoVO));

        return "operator/teamStatus";
    }

    @RequestMapping(value="/team/info",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamInfo(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        model.addAttribute("TEAM_INFO",teamInfoDAO.selectTeamInfoList(teamInfoVO));
        return "operator/teamModify";
    }
    @RequestMapping(value="/team/info/json",method = RequestMethod.GET)
    @ResponseBody
    public ValueObject teamInfoJson(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();
        teamInfoVO.setNumber("teamSeq",request.getParameter("teamSeq"));
        //return teamInfoDAO.selectTeamInfo(teamInfoVO);
        return teamInfoDAO.selectTeamQuizProcessInfo(teamInfoVO);
    }

    @RequestMapping(value="/team/list",method = RequestMethod.GET)
    public String teamList(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        model.addAttribute("TEAM_INFO_LIST",teamInfoDAO.selectTeamInfoList(teamInfoVO));
        return "operator/teamList";
    }
    @RequestMapping(value="/team/list/json",method = RequestMethod.GET)
    @ResponseBody
    public List<ValueObject> teamListJson(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();
        teamInfoVO.setNumber("teamSeq",request.getParameter("teamSeq"));
        return teamInfoDAO.selectTeamInfoList(teamInfoVO);
    }

    @RequestMapping(value="/team/list/process",method = RequestMethod.GET)
    @ResponseBody
    public List<ValueObject> teamListProcess(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        return teamInfoDAO.selectTeamListQuizProcessInfo();
    }

    @RequestMapping(value="/team/create",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamCreateView(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        return "operator/teamCreate";
    }

    @RequestMapping(value="/team/insert",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamCreate(HttpServletRequest request, HttpServletResponse response, Model model){
        logger.debug(request.getParameterMap().toString());
        logger.debug(request.getParameter("chance1"));
        ValueObject teamInfoVO = new ValueObject();

        teamInfoVO.setString("schoolName", request.getParameter("schoolName"));
        teamInfoVO.setString("teamName", request.getParameter("teamName"));
        teamInfoVO.setString("teamBaseScore", request.getParameter("teamBaseScore"));
        teamInfoVO.setString("teamRankScore", "0");
        teamInfoVO.setString("chance1", request.getParameter("chance1"));
        teamInfoVO.setString("chance2", request.getParameter("chance2"));
        teamInfoVO.setString("chance3", request.getParameter("chance3"));
        teamInfoVO.setString("chance4", request.getParameter("chance4"));
        teamInfoVO.setString("chance5", request.getParameter("chance5"));
        teamInfoVO.setString("chance6", request.getParameter("chance6"));
        teamInfoVO.setString("teamCode", request.getParameter("teamCode"));

        teamInfoDAO.insertTeamInfo(teamInfoVO);

        model.addAttribute("TEAM_INFO",teamInfoVO);
        return "redirect:/operator/team/list";

    }

    @RequestMapping(value="/team/modify",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamModify(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        teamInfoVO.setString("teamSeq", request.getParameter("teamSeq"));

        model.addAttribute("TEAM_INFO",teamInfoDAO.selectTeamInfo(teamInfoVO));

        return "operator/teamModify";
    }

    @RequestMapping(value="/team/update",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamUpdate(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        teamInfoVO.setString("teamSeq", request.getParameter("teamSeq"));
        teamInfoVO.setString("schoolName", request.getParameter("schoolName"));
        teamInfoVO.setString("teamName", request.getParameter("teamName"));
        teamInfoVO.setString("teamBaseScore", request.getParameter("teamBaseScore"));
        teamInfoVO.setString("teamRankScore", request.getParameter("teamRankScore"));
        teamInfoVO.setString("chance1", request.getParameter("chance1"));
        teamInfoVO.setString("chance2", request.getParameter("chance2"));
        teamInfoVO.setString("chance3", request.getParameter("chance3"));
        teamInfoVO.setString("chance4", request.getParameter("chance4"));
        teamInfoVO.setString("chance5", request.getParameter("chance5"));
        teamInfoVO.setString("chance6", request.getParameter("chance6"));
        teamInfoVO.setString("teamCode", request.getParameter("teamCode"));

        teamInfoDAO.updateTeamInfo(teamInfoVO);

        return "redirect:/operator/team/modify?teamSeq=" + request.getParameter("teamSeq");
    }

    @RequestMapping(value="/team/delete",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamDelete(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        teamInfoVO.setString("teamSeq", request.getParameter("teamSeq"));

        teamInfoDAO.deleteTeamInfo(teamInfoVO);

        return "redirect:/operator/team/list";
    }

    @RequestMapping(value="/battle/result",method = RequestMethod.GET)
    public String teamBattleResult(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject battleVO = new ValueObject();
        battleVO.setString("teamCode", "A");
        model.addAttribute("A_TEAM_RESULT",koreanBattleDAO.selectKoreanBattleResult(battleVO));
        battleVO.setString("teamCode", "B");
        model.addAttribute("B_TEAM_RESULT",koreanBattleDAO.selectKoreanBattleResult(battleVO));
        battleVO.setString("teamCode", "C");
        model.addAttribute("C_TEAM_RESULT",koreanBattleDAO.selectKoreanBattleResult(battleVO));
        battleVO.setString("teamCode", "D");
        model.addAttribute("D_TEAM_RESULT",koreanBattleDAO.selectKoreanBattleResult(battleVO));
        return "operator/teamBattleResult";
    }

    @RequestMapping(value="/working/result",method = RequestMethod.GET)
    public String teamWorkingResult(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject battleVO = new ValueObject();
        battleVO.setString("teamCode", "A");
        model.addAttribute("A_TEAM_RESULT",workingMemoryDAO.selectWorkingMemoryResult(battleVO));
        battleVO.setString("teamCode", "B");
        model.addAttribute("B_TEAM_RESULT",workingMemoryDAO.selectWorkingMemoryResult(battleVO));
        battleVO.setString("teamCode", "C");
        model.addAttribute("C_TEAM_RESULT",workingMemoryDAO.selectWorkingMemoryResult(battleVO));
        battleVO.setString("teamCode", "D");
        model.addAttribute("D_TEAM_RESULT",workingMemoryDAO.selectWorkingMemoryResult(battleVO));
        return "operator/teamWorkingResult";
    }

    @RequestMapping(value="/chance/{quizChance}/{teamSeq}",method = {RequestMethod.GET, RequestMethod.POST},produces = "application/json; charset=utf8")
    @ResponseBody
    public ReturnMessage quizChanceAgree(@PathVariable int quizChance, @PathVariable int teamSeq){

        int messageCode = 0;
        String messageText ="";
        boolean processYN = true;
        ValueObject paramVO = new ValueObject();
        paramVO.setNumber("teamSeq", teamSeq);

        ValueObject quizProcess = quizDAO.selectQuizProcessNumber();
        paramVO.setNumber("quizNum", quizProcess.getNumber("QUIZ_NUM").intValue() + 1);

        ValueObject teamInfo = teamInfoDAO.selectTeamInfo(paramVO);
        ValueObject quizInfo = quizDAO.selectQuizInfo(paramVO);

        if(teamInfo == null){
            messageCode = 1;
            messageText = "팀정보를 확인할 수 없습니다.";
            processYN = false;
        }
        if(quizInfo == null){
            messageCode = 1;
            messageText = "적용 할 퀴즈 정보가 없습니다.";
            processYN = false;
        }
        if(processYN && quizChance == 1){
            logger.debug("{},{}",teamInfo.getString("CHANCE_1"),quizInfo.getString("PRIORITY_TEAM_SEQ"));
            if(teamInfo.getString("CHANCE_1").equals("1") && quizInfo.getString("PRIORITY_TEAM_SEQ") == null){
                logger.debug("=======================111111111111111111111111");
                paramVO.setNumber("quizChance",quizChance);
                paramVO.setNumber("chanceValue",0);
                teamInfoDAO.updateTeamChance(paramVO);
                paramVO.setNumber("priorityYN",1);
                quizDAO.updateQuizPriority(paramVO);

                paramVO.setNumber("agreeChance",1);
                quizDAO.updateQuizChanceAgree(paramVO);
            }else{
                messageCode = 1;
                messageText = "우선권 적용을 할 수 없습니다.";
            }
        }
        if(processYN && quizChance == 4){
            if(teamInfo.getString("CHANCE_4").equals("1") && quizInfo.getString("DOUBLE_TEAM_SEQ") == null){
                logger.debug("=======================444444444444444444444444");
                paramVO.setNumber("quizChance",quizChance);
                paramVO.setNumber("chanceValue",0);
                teamInfoDAO.updateTeamChance(paramVO);
                paramVO.setNumber("doubleYN",1);
                quizDAO.updateQuizDouble(paramVO);

                paramVO.setNumber("agreeChance",1);
                quizDAO.updateQuizChanceAgree(paramVO);
            }else{
                messageCode = 1;
                messageText = "더블찬스 적용을 할 수 없습니다.";
            }
        }

        ReturnMessage returnMessage = new ReturnMessage();
        returnMessage.setReturnCode(messageCode);
        returnMessage.setReturnMessage(messageText);
        return returnMessage;
    }
}