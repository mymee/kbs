package org.kbs.playto.books.controller;

import org.kbs.playto.books.common.ValueObject;
import org.kbs.playto.books.dao.TeamInfoDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value="/manager")
public class ManagerController {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TeamInfoDAO teamInfoDAO;

    @RequestMapping(value="/status",method = RequestMethod.GET)
    public String teamStatusList(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        model.addAttribute("TEAM_INFO_LIST",teamInfoDAO.selectTeamInfoList(teamInfoVO));
        return "manager/teamStatus";
    }

    @RequestMapping(value="/team/info",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamInfo(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        model.addAttribute("TEAM_INFO",teamInfoDAO.selectTeamInfoList(teamInfoVO));
        return "manager/teamModify";
    }

    @RequestMapping(value="/team/list",method = RequestMethod.GET)
    public String teamList(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        model.addAttribute("TEAM_INFO_LIST",teamInfoDAO.selectTeamInfoList(teamInfoVO));
        return "manager/teamList";
    }

    @RequestMapping(value="/team/create",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamCreateView(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        return "manager/teamCreate";
    }

    @RequestMapping(value="/team/insert",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamCreate(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        teamInfoVO.setString("team_seq", request.getParameter("team_seq"));
        teamInfoVO.setString("team_name", request.getParameter("team_name"));
        teamInfoVO.setString("team_school_name", request.getParameter("team_school_name"));
        teamInfoVO.setString("team_score", request.getParameter("team_score"));
        teamInfoVO.setString("team_chance_1", request.getParameter("team_chance_1"));
        teamInfoVO.setString("team_chance_2", request.getParameter("team_chance_2"));
        teamInfoVO.setString("team_chance_3", request.getParameter("team_chance_3"));
        teamInfoVO.setString("team_chance_4", request.getParameter("team_chance_4"));
        teamInfoVO.setString("team_chance_5", request.getParameter("team_chance_5"));
        teamInfoVO.setString("team_chance_6", request.getParameter("team_chance_6"));

        teamInfoDAO.insertTeamInfo(teamInfoVO);

        model.addAttribute("TEAM_INFO",teamInfoVO);
        return "manager/teamList";
    }

    @RequestMapping(value="/team/modify",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamModify(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        teamInfoVO.setString("team_seq", request.getParameter("team_seq"));
        teamInfoVO.setString("team_name", request.getParameter("team_name"));
        teamInfoVO.setString("team_school_name", request.getParameter("team_school_name"));
        teamInfoVO.setString("team_score", request.getParameter("team_score"));
        teamInfoVO.setString("team_chance_1", request.getParameter("team_chance_1"));
        teamInfoVO.setString("team_chance_2", request.getParameter("team_chance_2"));
        teamInfoVO.setString("team_chance_3", request.getParameter("team_chance_3"));
        teamInfoVO.setString("team_chance_4", request.getParameter("team_chance_4"));
        teamInfoVO.setString("team_chance_5", request.getParameter("team_chance_5"));
        teamInfoVO.setString("team_chance_6", request.getParameter("team_chance_6"));

        teamInfoDAO.updateTeamInfo(teamInfoVO);

        return "manager/teamModify";
    }

    @RequestMapping(value="/team/remove",method = {RequestMethod.GET, RequestMethod.POST})
    public String teamRemove(HttpServletRequest request, HttpServletResponse response, Model model){
        ValueObject teamInfoVO = new ValueObject();

        teamInfoVO.setString("team_seq", request.getParameter("team_seq"));

        teamInfoDAO.deleteTeamInfo(teamInfoVO);

        return "manager/teamList";
    }


}
