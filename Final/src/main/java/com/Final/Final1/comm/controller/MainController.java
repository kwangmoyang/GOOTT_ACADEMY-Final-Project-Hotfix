package com.Final.Final1.comm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.admin.model.AdminDTO;
import com.Final.Final1.admin.service.AdminService;
import com.Final.Final1.comm.model.MainDTO;
import com.Final.Final1.comm.service.MainService;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/MainPage" , method = RequestMethod.GET)
	public ModelAndView list(HttpSession session) {
		//조건문 추가
//		session.invalidate();

		List<MainDTO> list = mainService.list();
		List<MainDTO> listTeam = mainService.listTeam();
		List<MainDTO> listBoard = mainService.listBoard();
		ModelAndView mav = new ModelAndView();
		mav.addObject("Request",list);
		mav.addObject("Teamlist",listTeam);
		mav.addObject("Boardlist",listBoard);
		mav.setViewName("MainPage");

		return mav;
	}


	@RequestMapping("/hotfix/index")
	public String hotfixIndex() {
		return "resolveMain";
	}

	//팀페이지
//	@RequestMapping("/team/index")
//	public String teamIndex() {
//		return "/team/teamlist";
//	}
	//랭킹
	@RequestMapping("/ranking/index")
	public String rankingIndex() {
		return "/ranking/ranking";
	}

	//커뮤니티
	@RequestMapping("/community/index")
	public String communityIndex() {
		return "/board/lifeBoard";
	}



	// 마이 페이지
	@RequestMapping("/mypage/index")
	public String mypageIndex() {
		return "/mypage/mypage";
	}

	//충전하기
	@RequestMapping("/charge/index")
	public String chargeIndex() {
		return "/mypage/mypage_pay";
	}

	//로그아웃
	@RequestMapping("/logout/index")
	public ModelAndView logoutIndex(HttpSession session) {
		session.invalidate();
		
		List<MainDTO> list = mainService.list();
		ModelAndView mv = new ModelAndView();
		mv.addObject("MainPage",list);
		mv.setViewName("redirect:/MainPage");
		
		return mv;
	}

	//=====================================
	//=========유저 권한 분류에 따라 아래의 페이지가 표시됨========

	//관리자 페이지
//	@RequestMapping("/admin/index")
//	public String adminIndex() {
//		return "/admin/admin";
//	}
	
	@RequestMapping(value = "/admin/index", method = RequestMethod.GET)
	public ModelAndView adminMemList(AdminDTO dto, HttpSession session, Map<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("map", adminService.adminMemList(map));
		mv.setViewName("/admin/admin"); // JSP파일명
		return mv;
	}
	
	
}








