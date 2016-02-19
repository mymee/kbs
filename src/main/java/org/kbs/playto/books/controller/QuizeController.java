package org.kbs.playto.books.controller;

import org.kbs.playto.books.common.ValueObject;
import org.kbs.playto.books.dao.QuizeDAO;
import org.kbs.playto.books.dao.TeamInfoDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value="/quize")
public class QuizeController {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TeamInfoDAO teamInfoDAO;

    @Autowired
    private QuizeDAO quizeDAO;

    @RequestMapping(value="/view",method = {RequestMethod.GET, RequestMethod.POST})
    public String quizeView(HttpServletRequest request, HttpServletResponse response, Model model){

        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizeVO = new ValueObject();
        quizeVO.setString("teamSeq", teamSeq);


        model.addAttribute("QUIZE_INFO",quizeDAO.selectQuizeInfo(quizeVO));
        model.addAttribute("TEAM_INFO",teamInfoDAO.selectTeamInfo(quizeVO));

        return "quize/view";
    }

    @RequestMapping(value="/info",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizeInfo(HttpServletRequest request){

        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizeVO = new ValueObject();
        quizeVO.setString("teamSeq", teamSeq);

        return quizeDAO.selectQuizeInfo(quizeVO);
    }

    @RequestMapping(value="/submit",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizeSubmit(HttpServletRequest request){

        String teamSeq = request.getParameter("teamSeq");
        String quizeAnswer = request.getParameter("quizeAnswer");
        String quizeNum = request.getParameter("quizeNum");
        String quizeChance1 = request.getParameter("quizeChance1");
        String quizeChance2 = request.getParameter("quizeChance2");
        String quizeChance3 = request.getParameter("quizeChance3");
        String quizeChance4 = request.getParameter("quizeChance4");
        String quizeChance5 = request.getParameter("quizeChance5");
        String quizeChance6 = request.getParameter("quizeChance6");


        ValueObject quizeVO = new ValueObject();
        quizeVO.setString("teamSeq", teamSeq);
        quizeVO.setString("quizeAnswer", quizeAnswer);
        quizeVO.setString("quizeNum", quizeNum);
        quizeVO.setString("quizeChance1", quizeChance1);
        quizeVO.setString("quizeChance2", quizeChance2);
        quizeVO.setString("quizeChance3", quizeChance3);
        quizeVO.setString("quizeChance4", quizeChance4);
        quizeVO.setString("quizeChance5", quizeChance5);
        quizeVO.setString("quizeChance6", quizeChance6);

        quizeDAO.insertQuizeAnswer(quizeVO);
        return quizeDAO.selectQuizeInfo(quizeVO);
    }

    @RequestMapping(value="/start",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizeStart(HttpServletRequest request){

        String quizeNum = request.getParameter("quizeNum");
        ValueObject quizeVO = new ValueObject();
        quizeVO.setString("quizeNum", quizeNum);

        quizeDAO.updateQuizeStart(quizeVO);
        return quizeDAO.selectQuizeInfo(quizeVO);
    }

    @RequestMapping(value="/end",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizeEnd(HttpServletRequest request){

        String quizeNum = request.getParameter("quizeNum");
        ValueObject quizeVO = new ValueObject();
        quizeVO.setString("quizeNum", quizeNum);

        quizeDAO.updateQuizeEnd(quizeVO);
        return quizeDAO.selectQuizeInfo(quizeVO);
    }

    @RequestMapping(value="/priority",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizePriority(HttpServletRequest request){

        String quizeNum = request.getParameter("quizeNum");
        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizeVO = new ValueObject();
        quizeVO.setString("quizeNum", quizeNum);
        quizeVO.setString("teamSeq", teamSeq);

        quizeDAO.updateQuizePriority(quizeVO);
        return quizeDAO.selectQuizeInfo(quizeVO);
    }

    @RequestMapping(value="/double",method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ValueObject quizeDouble(HttpServletRequest request){

        String quizeNum = request.getParameter("quizeNum");
        String teamSeq = request.getParameter("teamSeq");
        ValueObject quizeVO = new ValueObject();
        quizeVO.setString("quizeNum", quizeNum);
        quizeVO.setString("teamSeq", teamSeq);

        quizeDAO.updateQuizeDouble(quizeVO);
        return quizeDAO.selectQuizeInfo(quizeVO);
    }
}
