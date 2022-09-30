package com.Final.Final1.admin.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.admin.model.AdminDAO;
import com.Final.Final1.admin.service.AdminService;
import com.Final.Final1.admin.model.AdminDTO;


@Controller
public class AdminController {

	

	@Autowired
	AdminService adminService;
	
	// 회원관리페이지는 메인컨트롤에 있음
	
//	@RequestMapping(value = "/admin/memlist", method = RequestMethod.GET)
//	public ModelAndView adminMemList(AdminDTO dto, HttpSession session, Map<String, Object> map) {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("map", adminService.adminMemList(map));
//		mv.setViewName("/admin/memlist");
//		return mv;
//	}
	
	// 신고관리페이지
	@RequestMapping("/admin/report")
	public String adminReport() {
		return "/admin/admin_Report";
	}
	
	
	// 게시판관리페이지
	@RequestMapping("/admin/board")
	public String adminBoard(AdminDTO dto) {
		return "/admin/admin_Board";
	}
	
	// 게시판관리에 공지사항페이지
	@RequestMapping("/admin/board_mng")
	public String adminBoardMng() {
		return "/admin/admin_BoardMng";
	}
	
	// 게시판관리에 회원게시글페이지
	@RequestMapping(value = "/admin/board_mem", method = RequestMethod.GET)
	public ModelAndView adminBoardMem(AdminDTO dto, HttpSession session, Map<String, Object> map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int userBoardCount = adminService.userBoardCount(dto);
		mv.addObject("count", userBoardCount);
		mv.addObject("map", adminService.userBoard(map));
		mv.setViewName("/admin/admin_BoardMem");
		return mv;
	}
	
	
	// 1:1문의페이지
	@RequestMapping("/admin/ask")
	public String adminAsk() {
		return "/admin/admin_Ask";
	}

}
