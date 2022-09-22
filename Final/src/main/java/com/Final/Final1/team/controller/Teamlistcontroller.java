package com.Final.Final1.team.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.team.model.TeamlistDTO;
import com.Final.Final1.team.service.Teamlistservice;

@Controller
public class Teamlistcontroller {
	
	@Autowired
	Teamlistservice teamlistservice;
	
	@RequestMapping(value="/teamlist", method = RequestMethod.GET)
	public ModelAndView teamlist(@RequestParam Map<String, Object> map) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/team/teamlist");
		mv.addObject("list", teamlistservice.list(map));
		mv.addObject("taglist", teamlistservice.taglist(map));
		
		return mv;
	}
	
	@RequestMapping(value="/teamlist", method = RequestMethod.POST)
	public ModelAndView teamlist2(@RequestParam Map<String, Object> map) {
	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/team/teamlist");
		mv.addObject("list", teamlistservice.list(map));
		mv.addObject("taglist", teamlistservice.taglist(map));
		
		//검색기능
		if (map.containsKey("keyword")) {
			mv.addObject("keyword", map.get("keyword"));
		}
		
		return mv;
	}
	
}
