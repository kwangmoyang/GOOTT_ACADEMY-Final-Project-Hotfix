package com.Final.Final1.admin.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.admin.model.AdminDAO;
import com.Final.Final1.admin.service.AdminService;
import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.PageUtil;
import com.Final.Final1.admin.model.AdminDTO;


@Controller
public class AdminController {

	
	@Autowired
	AdminService adminService;
	
	// 회원관리페이지는 메인컨트롤에 있음

		
	// 게시판관리페이지
	@RequestMapping("/admin/board_mng")
	public String adminBoard(AdminDTO dto) {
		return "/admin/admin_BoardMng";
	}
	
	// 게시판관리에 공지사항 작성페이지
	@RequestMapping("/admin/write")
	public String adminBoardWrite() {
		return "/admin/admin_WriteForm";
	}
	
	// 게시판관리에 공지사항 작성했을때
	@RequestMapping(value = "/adminBoard", method = RequestMethod.POST)
	public ModelAndView adminBoardinsert(AdminDTO dto) {
		adminService.adminBoardinsert(dto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/admin/board_mng");
		return mv;
	}
	
	// 게시판관리에 공지사항 작성했을때 관리자 공지사항 테이블에 표시
	@RequestMapping(value="/admin/board_mng", method =RequestMethod.GET)
	  public ModelAndView adminBoardlist() {
		  ModelAndView mv = new ModelAndView();
		  List<Map<String, Object>> list = adminService.adminBoardlist();
		  mv.setViewName("admin/admin_BoardMng");
		  mv.addObject("data", list);
		  return mv;
	  }

	// 게시판관리 공지사항 선택삭제
		@ResponseBody
		@RequestMapping(value = "/NoticeDelete", method = RequestMethod.POST)
			//public String boardDelete(HttpServletRequest request) {
			public String NoticeDelete(int[] VALUEArr) {
			int[] NoticeDeleteMsg = VALUEArr;
			int size = NoticeDeleteMsg.length;
			for(int i=0; i<size; i++) {
				adminService.NoticeDelete(NoticeDeleteMsg[i]);
			}
			return "redirect:/admin/admin_BoardMng";
		}
	
	
	// 게시판관리에 회원게시글페이지
	@RequestMapping(value = "/admin/board_mem", method = RequestMethod.GET)
	public ModelAndView adminBoardMem(HttpServletRequest req, @RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue ="all")String search_option) {
		AdminDTO dto = new AdminDTO();
		String select = req.getParameter("select");
		dto.setSelect(select);
		
		ModelAndView mv = new ModelAndView();
		
		int userBoardCount = adminService.userBoardCount();
		PageUtil page_info = new PageUtil(userBoardCount, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		List<AdminDTO> list = adminService.userBoard(start, end, select );
		mv.setViewName("/admin/admin_BoardMem");
		
		mv.addObject("count", userBoardCount);
		mv.addObject("map",list);
		mv.addObject("page_info", page_info);
		mv.addObject("search_option", dto.getSelect());
		
		return mv;
	}	
		
	// 게시판관리 게시글 선택삭제
	@ResponseBody
	@RequestMapping(value = "/boardMemDelete", method = RequestMethod.POST)
		//public String boardDelete(HttpServletRequest request) {
		public String boardDelete(int[] valueArr) {
		int[] boardDeleteMsg = valueArr;
		int size = boardDeleteMsg.length;
		for(int i=0; i<size; i++) {
			adminService.boardMemDelete(boardDeleteMsg[i]);
		}
		return "redirect:/admin/admin_BoardMem";
	}
	
}
