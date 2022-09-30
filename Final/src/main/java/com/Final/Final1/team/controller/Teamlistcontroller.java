package com.Final.Final1.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.team.model.TeamMemberDTO;
import com.Final.Final1.team.model.TeamlistDTO;
import com.Final.Final1.team.service.Teamlistservice;

@Controller
public class Teamlistcontroller {
	
	@Autowired
	Teamlistservice teamlistservice;
	
	//팀목록
	@RequestMapping(value="/teamlist")
	public ModelAndView teamlist(@RequestParam Map<String, Object> map, @RequestParam(defaultValue = "")String keyword, 
			@RequestParam(defaultValue = "all") String search_option) {

			int count = teamlistservice.count(search_option, keyword);
			
		
		
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/team/teamlist");
			
			List<Map<String, Object>> taglist = teamlistservice.taglist(map); //�±� ��ü
			List<TeamlistDTO> teamlist = teamlistservice.list(map); //����� ��ü
			List<Map<String, Object>> tags = teamlistservice.tags(map); //�������
			
			System.out.println("teamlist"+teamlist);
			
			
			Map<String, Object> map2 = new HashMap<>();
			
			map2.put("teamlist", teamlist); //����� ��ü
			map2.put("taglist", taglist); //�±� ��ü
			map2.put("tags", tags);
			map2.put("count", count);
			
			mv.addObject("map",map2);

			return mv;
	}
	

	//팀생성
	@RequestMapping(value="/teammake" , method= RequestMethod.POST)
	public ModelAndView teammake2(@RequestParam Map<String, Object> map, HttpSession session
			,@RequestParam("maketeamname") String maketeamname) {
			
			ModelAndView mv = new ModelAndView();
			
			//팀이름 중복된 거 있나
			Map<String, Object> teammakecheck = teamlistservice.teammakecheck(map);
			//유저가 이미 팀에 가입되어 있나
			Map<String, Object> teammakecheck2 = teamlistservice.teammakecheck2(map);
			
			if(teammakecheck == null && teammakecheck2 == null) {
				
				
				teamlistservice.teammake(map);
				teamlistservice.teammakeupdate(map);
				
				//세션 셋
				//내가 만든 팀네임
				session.setAttribute("Team_name", maketeamname);
				mv.setViewName("redirect:/teamlist");
				mv.addObject("message", "성공");
				
				System.out.println("팀만들기성공");
				
				return mv;
			}
			else if(teammakecheck != null) {
				mv.addObject("message", "팀이름중복");
				
				System.out.println("팀만들기실패1");
					
				return mv;
			}
			else if(teammakecheck2 != null) {
				mv.addObject("message", "유저이미팀있음");
				
				System.out.println("팀만들기실패2");
					
				return mv;
			}
			else {
				
				System.out.println("팀만들기실패3");
				return mv;
			}
			

	}
	
	//팀 가입
	@RequestMapping(value="/teamjoin" , method= RequestMethod.POST)
	public ModelAndView teamjoin(@RequestParam Map<String, Object> map, HttpSession session
			,@RequestParam("jointeamname") String jointeamname) {
			ModelAndView mv = new ModelAndView();
			
		
			//유저한테 팀이 없으면 가능하게
			String teamjoin_team = teamlistservice.teamjoin_team(map);
			
			
			if(teamjoin_team == null) {
				
				//나중에 그냥 팀관리페이지로 보내고 거기서 가입가능하게
				teamlistservice.teamjoin(map);
				teamlistservice.teamjoininsert(map);
				session.setAttribute("Team_name", jointeamname);
				
				mv.setViewName("redirect:/teamlist");
				mv.addObject("teamjoin", "성공");
								
				return mv;
			}
			else {
				mv.addObject("teamjoin", "실패");
				return mv;
			}
			
			

			

	}
	
	//팀 탈퇴
	//클릭한 팀에 그 유저가 속해 있는지 먼저 확인하고
	@RequestMapping(value="/teamsecession" , method= RequestMethod.POST)
	public ModelAndView teamsecession(@RequestParam Map<String, Object> map, HttpSession session
			, @RequestParam("secessionteamname") String secessionteamname
			, @RequestParam("Usernickname") String Usernickname) {
		
		
			ModelAndView mv = new ModelAndView();
			
			//db에 팀리더 조회
			String teamleader = teamlistservice.teamsecession_teamleader(map);
			
			System.out.println(teamleader);
		
			
			//유저가 속한 팀네임
			String secession_teamname = (String)session.getAttribute("Team_name");
			String secssion_nickname = (String)session.getAttribute("User_nickname");
			
			System.out.println(secession_teamname);
			System.out.println(secssion_nickname);
			
			//유저가 속한 팀과 클릭한 팀이 같고 팀리더가 아니면
			if(secession_teamname.equals(secessionteamname) && !teamleader.equals(secssion_nickname)) {
				
				System.out.println("시발");
				
				teamlistservice.teamsecession(map);
				//팀멤버테이블에서 멤버컬럼 삭제
				teamlistservice.teamsecessiondelete(map);
				
				session.setAttribute("Team_name", null);
				
				mv.setViewName("redirect:/teamlist");
				
				mv.addObject("teamsecession", "팀탈퇴성공");
				
				return mv;
				
			}
			//유저가 속한 팀과 클릭한 팀이 같고 팀리더면
			else if(secession_teamname.equals(secessionteamname) && teamleader.equals(secssion_nickname)) {
				
				//팀관리페이지에서 리더위임후 해주세요 경고창띄우기
				
				System.out.println("시발2");
				
				teamlistservice.teamsecession(map);
				
				//그냥 팀 자체 삭제
				teamlistservice.teamsecession_teamleaderdelete(map);

				session.setAttribute("Team_name", null);
				
				mv.setViewName("redirect:/teamlist");
				
				mv.addObject("teamsecession", "팀삭제됨");
				
				return mv;
			}
			else if(!secession_teamname.equals(secessionteamname)) {
				
				System.out.println("팀에 속해있지 않음");
				
				mv.addObject("teamsecession", "팀아님");
				
				return mv;
			}
			else {
				return mv;
			}
			
			
	}
	
	//팀정보
	@RequestMapping("/teaminfo")
	public ModelAndView teaminfo(@RequestParam Map<String, Object> map, ModelAndView mv, TeamlistDTO dto, TeamMemberDTO dto2
			, @RequestParam(value="teaminfo_teamname", required = false) String teaminfo_teamname)
	{
		
		
		mv.setViewName("/team/teaminfo");
		//클릭한 팀의 팀공지사항
		List<Map<String, Object>> teaminfo_notice = teamlistservice.teaminfo_notice(map);
		//클릭한 팀의 리더
		List<Map<String, Object>> teamleader = teamlistservice.teaminfo_teamleader(map);
		//클릭한 팀의 멤버들
		List<Map<String, Object>> teammembers = teamlistservice.teaminfo_members(map);
		
		Map<String, Object> map2 = new HashMap<>();
		
		
		System.out.println("야"+teaminfo_notice);
		System.out.println("왜"+teamleader);
		System.out.println("안돼"+teammembers);
		
		map2.put("teaminfo_notice", teaminfo_notice);
		map2.put("teamleader", teamleader);
		map2.put("teammembers", teammembers);
		
		System.out.println("map2에담는 과정");
		
		mv.addObject("map", map2);
		
		System.out.println("이제 return한다"+map2);
		
		
		
		return mv;
	}
	
}
