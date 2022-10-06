package com.Final.Final1.team.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.board.model.PageUtil;
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
			@RequestParam(defaultValue = "all") String search_option,
			@RequestParam(defaultValue="1")int curPage) {

			int count = teamlistservice.count(search_option, keyword);
			PageUtil page_info = new PageUtil(count, curPage);
			int start = page_info.getPageBegin();
			int end = page_info.getPageEnd();
				
		
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/team/teamlist");
			
			List<Map<String, Object>> taglist = teamlistservice.taglist(map); //Team_has_Tags테이블에서 태그 불러오기 -> 팀목록에서 view
			List<TeamlistDTO> teamlist = teamlistservice.list(map,search_option, keyword, start, end); //팀목록 불러오기
			List<Map<String, Object>> tags = teamlistservice.tags(map); //팀만들기 부분에 태그 전체 불러오기
			
			System.out.println(teamlist);
			Map<String, Object> map2 = new HashMap<>();
			
			map2.put("teamlist", teamlist); 
			map2.put("taglist", taglist);
			map2.put("tags", tags);
			map2.put("count", count);
			map2.put("page_info", page_info);
			map2.put("search_option", search_option);
			map2.put("keyword", keyword);
			
			mv.addObject("map",map2);

			return mv;
	}
	

	//팀생성
	@RequestMapping(value="/teammake" , method= RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<String> teammake2(@RequestParam Map<String, Object> map, HttpSession session
			,@RequestParam("maketeamname") String maketeamname
			,@RequestParam("tagarray[]") List<String> tagarray
			,@RequestParam("usernickname") String usernickname
			, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
			
			ResponseEntity<String> entity = null;
		
			try {
				//팀이름 중복된 거 있나
				Map<String, Object> teammakecheck = teamlistservice.teammakecheck(map);
				//유저가 이미 팀에 가입되어 있나 -> js에서 거르지만 혹시 몰라서
				Map<String, Object> teammakecheck2 = teamlistservice.teammakecheck2(map);
				//이미 신청한 팀이 있으면
				Map<String, Object> teammakecheck3 = teamlistservice.teammakecheck3(map);
				
				if(teammakecheck == null && teammakecheck2 == null && teammakecheck3 == null) {
					
					//팀 insert
					teamlistservice.teammake(map);
					//user테이블에서 팀만들기한 유저의 team_name 컬럼에 만든 팀 추가
					teamlistservice.teammakeupdate(map);
					
					
					//내가 만든 팀네임
					session.setAttribute("Team_name", maketeamname);
					//팀리더도 
					session.setAttribute("Leader_auth", 1);

					for(String s :tagarray) {
						teamlistservice.taginsert(maketeamname, s);
					}
				
					entity = new ResponseEntity<String>("팀생성이 완료되었습니다!", HttpStatus.OK);
					
					return entity;
				}
				else if(teammakecheck != null) {
					
					entity = new ResponseEntity<String>("팀이름이 중복되었습니다.",HttpStatus.INTERNAL_SERVER_ERROR);
	
					return entity;

				}
				else if(teammakecheck3 != null) {
					
					entity = new ResponseEntity<String>("유저께서 이미 다른 팀신청을 하셨습니다.",HttpStatus.BAD_REQUEST);

					return entity;
					
				}
			} catch (Exception e) {
				
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
				return entity;
			}
			
			return entity;
			
	}
	
	//팀 가입
	@RequestMapping(value="/teamjoin" , method= RequestMethod.POST)
	public ModelAndView teamjoin(@RequestParam Map<String, Object> map, HttpSession session
			,@RequestParam("jointeamname") String jointeamname) {
			ModelAndView mv = new ModelAndView();
			
		
			//유저한테 팀이 없으면 가능하게
			Map<String, Object> teamjoin_team = teamlistservice.teamjoin_team(map);
			

			if(teamjoin_team == null) {
				
				//그냥 팀관리페이지로 보내고 거기서 가입가능하게 && 여기서 팀가입신청 한번밖에 못하도록 되어있음
				teamlistservice.teamjoinmessage(map);
				
				mv.setViewName("redirect:/teamlist");
								
				return mv;
			}
			else {
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
			
			//유저가 속한 팀네임
			String secession_teamname = (String)session.getAttribute("Team_name");
			String secssion_nickname = (String)session.getAttribute("User_nickname");

			//유저가 속한 팀과 클릭한 팀이 같고 팀리더가 아니면
			if(secession_teamname.equals(secessionteamname) && !teamleader.equals(secssion_nickname)) {
				
				
				//팀멤버테이블에서 멤버컬럼 삭제
				teamlistservice.teamsecessiondelete(map);
				//유저테이블의 팀리더(어차피유저는 0이니까 상관 ㄴ)와 팀네임 제거
				teamlistservice.teamsecession(map);
				

				session.setAttribute("Team_name", null);
				
				
				mv.setViewName("redirect:/teamlist");
				
				mv.addObject("teamsecession", "팀탈퇴성공");
				
				return mv;
				
			}
			//유저가 속한 팀과 클릭한 팀이 같고 팀리더면
			else if(secession_teamname.equals(secessionteamname) && teamleader.equals(secssion_nickname)) {
				
				//만약 팀멤버가 없으면 걍 삭제 -> 팀자체삭제
				List<Map<String, Object>> if_Teammember = teamlistservice.if_Teammember(map);
				
				if(!if_Teammember.isEmpty()) {

					//팀멤버 있으면 팀장 위임 후 탈퇴됨
					
					//원래 팀장 나감 -> 지금유저
					teamlistservice.Teamleader_update(map);
					teamlistservice.teamsecession(map);
					//팀멤버중 1명 불러와서
					String Teamleader_candidate = teamlistservice.Teamleader_candidate(map);
					
					//걔를 team테이블의 팀리더에 박아놓고 update
					teamlistservice.Teamleader_update2(secessionteamname, Teamleader_candidate);
					
					//걔 팀멤버테이블에서 삭제하고
					teamlistservice.Teammember_candidate_delete(Teamleader_candidate);
					
					//유저테이블의 팀리더와 팀네임 update
					teamlistservice.Teamcandidate_teamleader(secessionteamname, Teamleader_candidate);
					
					
					
					session.setAttribute("Leader_auth", 0);
					
					session.setAttribute("Team_name", null);
					
					mv.setViewName("redirect:/teamlist");
					
					mv.addObject("teamsecession", "팀삭제됨");
					
					return mv;
				
				}
				else {
					
					//팀자체 삭제됨
					teamlistservice.teamsecession_teamleaderdelete(map);
					
					//원래 팀리더 유저테이블의 팀리더와 팀네임 제거
					teamlistservice.teamsecession(map);
					
					
					
					session.setAttribute("Leader_auth", 0);
					
					session.setAttribute("Team_name", null);
					
					mv.setViewName("redirect:/teamlist");
					
					mv.addObject("teamsecession", "팀삭제됨");
					
					return mv;
				}
				
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
		//팀의 활동점수와 커미션
		List<Map<String, Object>> teaminfo_int = teamlistservice.teaminfo_int(map);
		//클릭한 팀의 리더
		List<Map<String, Object>> teamleader = teamlistservice.teaminfo_teamleader(map);
		//클릭한 팀의 멤버들
		List<Map<String, Object>> teammembers = teamlistservice.teaminfo_members(map);
		
		Map<String, Object> map2 = new HashMap<>();
		
		map2.put("teaminfo_notice", teaminfo_notice);
		map2.put("teamleader", teamleader);
		map2.put("teammembers", teammembers);
		map2.put("teaminfo_int", teaminfo_int);
		
		mv.addObject("map", map2);

		
		return mv;
	}
	
}
