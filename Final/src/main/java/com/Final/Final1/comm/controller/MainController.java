package com.Final.Final1.comm.controller;

import com.Final.Final1.admin.model.AdminDTO;
import com.Final.Final1.admin.service.AdminService;
import com.Final.Final1.comm.model.MainDTO;
import com.Final.Final1.comm.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

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
		List<MainDTO> listNotice = mainService.listNotice();
		ModelAndView mav = new ModelAndView();
		mav.addObject("Request",list);
		mav.addObject("Teamlist",listTeam);
		mav.addObject("Boardlist",listBoard);
		mav.addObject("Notice",listNotice);
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
	@RequestMapping(value = "/admin/index", method = RequestMethod.GET)
	public ModelAndView adminMemList(AdminDTO dto, HttpSession session, Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		
//		Enumeration<String> attributes = request.getSession().getAttributeNames();
//	      while (attributes.hasMoreElements()) {
//	          String attribute = (String) attributes.nextElement();
//	          System.out.println(attribute+" : "+request.getSession().getAttribute(attribute));
//	      }  admin_auth 값 확인하기 위한것. 
	    
	    Integer admin_auth = (Integer)session.getAttribute("admin_auth");  
	    System.out.println(admin_auth);
	    if(!admin_auth.equals(1)) {
	    	response.setContentType("text/html; charset=UTF-8");
	    	PrintWriter out = response.getWriter();
	    	out.println("<script>alert('잘못된 접근입니다.');location.href='/MainPage'</script>");
	    	out.flush();
	    } 
		int userCount = adminService.userCount(dto);
		System.out.println(dto.getUserCount());
		mv.addObject("count", userCount);
		mv.addObject("map", adminService.adminMemList(map));
		mv.setViewName("/admin/admin"); // JSP파일명
		return mv;
	}



}








