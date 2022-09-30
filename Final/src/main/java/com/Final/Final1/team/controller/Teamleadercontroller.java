package com.Final.Final1.team.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.team.model.TeamlistDTO;
import com.Final.Final1.team.service.Teamleaderservice;

@Controller
public class Teamleadercontroller {
	
	@Autowired
	Teamleaderservice teamleaderservice;
	
	@RequestMapping("/teamleader")
	public ModelAndView teamleader(ModelAndView mv, TeamlistDTO dto, HttpSession session) {
		
		
		String teamname = (String) session.getAttribute("Team_name");

		
		System.out.println(teamname);
		
		Map<String, Object> teaminfo = teamleaderservice.team_list(dto, teamname);
		
		
		mv.addObject("teaminfo", teaminfo);
		
		mv.setViewName("/team/teamleader");
		return mv;
	}
	
	
	
	
}
