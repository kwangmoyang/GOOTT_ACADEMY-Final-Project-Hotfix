package com.Final.Final1.team.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.Final.Final1.team.model.TeamMemberdelDTO;
import com.Final.Final1.team.model.TeamlistDTO;
import com.Final.Final1.team.model.TeamnotMemberDTO;
import com.Final.Final1.team.service.Teamleaderservice;
import com.Final.Final1.team.service.Teamlistservice;


@Controller
public class Teamleadercontroller {
	
	@Autowired
	Teamleaderservice teamleaderservice;
	
	
	//팀관리자페이지 불러오기
	@RequestMapping(value="/teamleader", method= RequestMethod.GET)
	public ModelAndView teamleader(ModelAndView mv, TeamlistDTO dto, TeamMemberDTO dto2,TeamnotMemberDTO dto3, HttpSession session
			, HttpServletRequest request, HttpServletResponse response) throws IOException {

			try {
				String teamname = (String) session.getAttribute("Team_name");
				String User_id = (String) session.getAttribute("User_id");
				Integer leader = (Integer)session.getAttribute("Leader_auth");
				
				HashMap<String, Object> map3 = new HashMap<>();
				map3.put("User_id", User_id);
				map3.put("leader", leader);
				
				
				//로그인 안한 상태에서 팀리더 페이지에 들어가려하면
				if(map3.equals(null)) {
				
					throw new NullPointerException();
					
				}
				//로그인 한 상태에서 팀리더가 아닌 유저가 팀리더 페이지에 들어가려하면
				if(!leader.equals(1)) {
					
					throw new NullPointerException();
				}
				
				//공지사항
				Map<String, Object> teaminfo = teamleaderservice.team_list(dto, teamname);
				
				//팀 활동점수 & 커미션
				Map<String, Object> teaminfo2 = teamleaderservice.team_info(dto2, teamname);
				
				//팀멤버들
				List<Map<String, Object>> team_members = teamleaderservice.team_members(dto2, teamname);
				
				//팀가입신청목록
				List<Map<String, Object>> teamnotmember = teamleaderservice.team_notmembers(dto3, teamname);
				
				System.out.println("teamnotmember"+ dto3.toString());

				
				Map<String, Object> map2 = new HashMap<>();
				
				map2.put("teaminfo", teaminfo);
				map2.put("teaminfo2", teaminfo2);
				map2.put("team_members", team_members);
				map2.put("teamnotmerber", teamnotmember);
				
				mv.addObject("map", map2);
				
				mv.setViewName("/team/teamleader");
				
				return mv;
				
			} catch (NullPointerException e) {
				
				mv.setViewName("/team/teamleadererror");
				
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

		//팀이름수정
		Map<String, Object> teamname_cor = teamleaderservice.teamname_correction(dto, teamname, Team_name);
		
		session.setAttribute("Team_name", Team_name);
		
		
		mv.addObject("teamname_cor", teamname_cor);
		
		mv.setViewName("redirect:/teamleader");
		
		
		return mv;
	}
	
	//팀가입신청목록 - 수락
	@RequestMapping(value="/teamjoinaccept" , method= RequestMethod.POST)
	public ModelAndView teamjoin(@RequestParam Map<String, Object> map, HttpSession session) {
			ModelAndView mv = new ModelAndView();
			
		
			//유저한테 팀이 없으면 가능하게
			String teamjoin_team = teamleaderservice.teamjoin_team(map);
			//세션팀이름
			String teamname = (String) session.getAttribute("Team_name");
			
			
			if(teamjoin_team == null) {
				
				//나중에 그냥 팀관리페이지로 보내고 거기서 가입가능하게
				
				//user 팀이름 update
				teamleaderservice.teamjoin_accept(map);
				//teammember테이블에 insert
				teamleaderservice.teamjoininsert(map);
				//teamnotmember테이블 delete
				teamleaderservice.teamnotmember_del(map);
				session.setAttribute("Team_name", teamname);
				
				mv.setViewName("redirect:/teamleader");
				mv.addObject("teamjoin", "성공");
								
				return mv;
			}
			else {
				mv.addObject("teamjoin", "실패");
				return mv;
			}		

	}
	
	
	
	//팀가입신청목록 - 거절
	@RequestMapping(value="/teamjoinrefuse" , method= RequestMethod.POST)
	public ModelAndView teamjoinrefuse(@RequestParam Map<String, Object> map, HttpSession session) {
			ModelAndView mv = new ModelAndView();
					
			//teamnotteam에서 삭제 이름가져와야댐
			teamleaderservice.teamjoinrefuse(map);
			
			mv.setViewName("redirect:/teamleader");
			
			return mv;
	}
		
		
		
	
	//팀원추방하기
	@RequestMapping(value="/teammemberdel", method= RequestMethod.POST)
	public ModelAndView teammember_delete(ModelAndView mv, HttpSession session, TeamMemberdelDTO dto) {
		//팀원추방하기
		
		int teammember_delete = teamleaderservice.teammember_delete(dto);
		int teammember_delete2 = teamleaderservice.teammember_delete2(dto);
		
		
		Map<String, Object> map2 = new HashMap<>();
		
		map2.put("teammember_delete", teammember_delete);
		map2.put("teammember_delete2", teammember_delete2);
		
		mv.addObject("map2", map2);
		
		mv.setViewName("redirect:/teamleader");
		
		
		return mv;
	}
	
	
	
}
