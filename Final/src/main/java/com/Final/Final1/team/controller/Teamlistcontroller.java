package com.Final.Final1.team.controller;

import java.util.HashMap;
import java.util.List;
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
	
	@RequestMapping(value="/teamlist")
	public ModelAndView teamlist(@RequestParam Map<String, Object> map,@RequestParam(defaultValue = "all") String search_option, 
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "") String tagname) {
		
		System.out.println("tt");
		System.out.println("tagname ="+ tagname);
	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/team/teamlist");
		
		if(tagname == "") {			
			List<Map<String, Object>> click_taglist = teamlistservice.click_taglist(map, tagname);
			mv.addObject("clcik_taglist", click_taglist); //클릭했을 때
			
			System.out.println("click_taglist"+click_taglist.toString());
			
			return mv;
		}
		else if(tagname != "") {
			List<TeamlistDTO> teamlist = teamlistservice.list(map, search_option, keyword); //팀목록 전체
			List<Map<String, Object>> taglist = teamlistservice.taglist(map, search_option, keyword); //태그
			
			//select box + 검색 추가
			Map<String, Object> map2 = new HashMap<>();
			
			
			map2.put("teamlist", teamlist); //팀목록 전체
			map2.put("taglist", taglist); //태그
			
			System.out.println("map2"+map2.toString());
			
			mv.addObject("map",map2);

			
			return mv;
		}
		else {
			return mv;
		}
	}
	
}
