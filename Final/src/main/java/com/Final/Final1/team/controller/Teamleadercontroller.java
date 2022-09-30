package com.Final.Final1.team.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import com.Final.Final1.team.model.TeamMemberDTO;
import com.Final.Final1.team.model.TeamlistDTO;
import com.Final.Final1.team.service.Teamleaderservice;


@Controller
public class Teamleadercontroller {
	
	@Autowired
	Teamleaderservice teamleaderservice;
	
	//팀관리자페이지 불러오기
	@RequestMapping(value="/teamleader", method= RequestMethod.GET)
	public ModelAndView teamleader(ModelAndView mv, TeamlistDTO dto, TeamMemberDTO dto2, HttpSession session
			,HttpServletResponse response) throws IOException {
		
		String teamname = (String) session.getAttribute("Team_name");
		Integer leader = (Integer)session.getAttribute("Leader_auth");
		
		
		System.out.println(leader);
		
		
		if(leader.equals(1)) {

			//공지사항
			Map<String, Object> teaminfo = teamleaderservice.team_list(dto, teamname);
			
			System.out.println(teaminfo);
			//팀 활동점수 & 커미션
			Map<String, Object> teaminfo2 = teamleaderservice.team_info(dto2, teamname);
			
			System.out.println(teaminfo2);
			//팀멤버들
			List<Map<String, Object>> team_members = teamleaderservice.team_members(dto2, teamname);
			
			System.out.println(team_members);
			
			Map<String, Object> map2 = new HashMap<>();
			
			map2.put("teaminfo", teaminfo);
			map2.put("teaminfo2", teaminfo2);
			map2.put("team_members", team_members);
			
			mv.addObject("map", map2);
			
			mv.setViewName("/team/teamleader");
			return mv;
		}
		//안됨
		else if(!leader.equals(1)) {
			
			 System.out.println("dd");
			 response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('팀장만 접근 가능한 페이지입니다.'); location.href = /MainPage</script>");
	         out.flush();

	         mv.setViewName("redirect:/teamleader");
	         return mv;
			
			
		}
		else {
			mv.setViewName("redirect:/MainPage");
			return mv;
		}
		
		
	
	}
	
	
	//팀공지사항수정
	@RequestMapping(value="/teamnotice", method= RequestMethod.POST)
	public ModelAndView teamnotice_correction(ModelAndView mv, HttpSession session, TeamlistDTO dto
			,@RequestParam("teamnotice_correction") String teamnotice_correction) {
		
		
		//세션팀이름
		String teamname = (String) session.getAttribute("Team_name");
		
		
		
		//공지사항수정
		List<TeamlistDTO> teamnotice_cor = teamleaderservice.teamnotice_correction(dto, teamname, teamnotice_correction);

		
		mv.addObject("teamnotice", teamnotice_cor);
		mv.setViewName("redirect:/teamleader");
		
		return mv;
	}
	
	
	//팀이름수정
	@RequestMapping(value="/teamnamecor", method= RequestMethod.POST)
	public ModelAndView teamname_correction(ModelAndView mv, HttpSession session, TeamlistDTO dto
			,@RequestParam("Team_name") String Team_name) {
		
		//세션팀이름
		String teamname = (String) session.getAttribute("Team_name");
		
		System.out.println(dto.toString());

		//팀이름수정
		Map<String, Object> teamname_cor = teamleaderservice.teamname_correction(dto, teamname, Team_name);
		
		session.setAttribute("Team_name", Team_name);
		
		
		mv.addObject("teamname_cor", teamname_cor);
		
		mv.setViewName("redirect:/teamleader");
		
		
		return mv;
	}
	
	
	//팀원추방하기
	@RequestMapping(value="/teammemberdel", method= RequestMethod.POST)
	//TeamMemberDTO가 아니라 T_MemberDTO따로 만들어줄것
	public ModelAndView teammember_delete(ModelAndView mv, HttpSession session, TeamMemberDTO dto
			,@RequestParam("User_nickname") String User_nickname) {
	
		//팀원추방하기
		int teammember_delete = teamleaderservice.teammember_delete(dto, User_nickname);
		int teammember_delete2 = teamleaderservice.teammember_delete2(dto, User_nickname);
		
		
		Map<String, Object> map2 = new HashMap<>();
		
		map2.put("teammember_delete", teammember_delete);
		map2.put("teammember_delete2", teammember_delete2);
		
		mv.addObject("map2", map2);
		
		mv.setViewName("redirect:/teamleader");
		
		
		return mv;
	}
	
	
	
}
