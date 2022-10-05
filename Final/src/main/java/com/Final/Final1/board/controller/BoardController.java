package com.Final.Final1.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.PageUtil;
import com.Final.Final1.board.service.BoardService;
import com.Final.Final1.mypage.model.MypageDTO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	//게시판 리스트  카테고리별 검색, select_option
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest req,@RequestParam(defaultValue="1")int curPage,
		@RequestParam(defaultValue ="new")String search_option) {
		BoardDTO dto = new BoardDTO();
		String boardCode = req.getParameter("boardCode");
		dto.setBoardCode(boardCode);
		String keyword = req.getParameter("keyword");
		dto.setKeyword(keyword);
		String select = req.getParameter("select");
		dto.setSelect(select);
		
		int count = boardService.count(req.getParameter("keyword"),dto.getBoardCode());
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
						
		List<BoardDTO> list = boardService.list(boardCode, keyword, select, start, end);
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("board/board");
		Map<String, Object> map = new HashMap<>();

		map.put("list", list);
		map.put("count", count);
		map.put("boardCode", dto.getBoardCode());
		map.put("keyword", dto.getKeyword());
		map.put("search_option", dto.getSelect());
		map.put("page_info", page_info);

		
		mv.addObject("map", map);
				
		return mv;
		
		
	}
	// 게시판 작성
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {	
		return "board/boardWriteForm";
	}
	// 게시판 작성
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insertPost(BoardDTO dto, HttpSession session, MypageDTO mydto) {
		
		
		//세션 값 불러옴
		String name = (String)session.getAttribute("User_nickname");
		mydto.setUser_nickname(name);
		
		boardService.activeInsert(mydto);
		
		boardService.insert(dto);
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("redirect:/list");
		
		return mv;
	}
	// 게시판 상세보기
	@RequestMapping(value= "/detail", method = RequestMethod.GET)
	public ModelAndView detail(BoardDTO dto) {
		boardService.viewCount(dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", boardService.detail(dto));
		
		mv.setViewName("board/detailBoard");
			
		return mv;	
	}
	// 게시판 업데이트 이전 내용 불러오기
	@RequestMapping(value= "/update", method = RequestMethod.GET)
	public ModelAndView update(BoardDTO dto) {
		Map<String, Object> PostInfo = boardService.detail(dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", PostInfo);
		mv.setViewName("board/update");
				
		return mv;
		
		
	}
	// 게시판 업데이트 하기
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public ModelAndView updatePost(BoardDTO dto) {
		ModelAndView mv = new ModelAndView();
		int test = boardService.update(dto);
		System.out.println("test = "+ test);
		mv.setViewName("redirect:/list");
		return mv;
				
	}
	//게시판 내용 삭제
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public ModelAndView deletePost(BoardDTO dto) {
		// 鈺곌퀬�돳占쎈땾 筌앹빓占�
		
		ModelAndView mv = new ModelAndView();
		
		boolean isDeleteSuc = boardService.remove(dto);
		
		if(isDeleteSuc) {
			mv.setViewName("redirect:/list");
		} else {
			int Post_num = dto.getPost_num();
			mv.setViewName("redirect:/detail?Post_num" + Post_num);
		}
			
		return mv;
	}
	//게시판 추천수 올리기
	@ResponseBody
	@RequestMapping(value = "/board/Likeup" , method = RequestMethod.POST)
	public int Likeup(int Post_num)throws Exception{
			int Likeup = boardService.Likeup(Post_num);
			
			return Likeup;
	}
	//게시판 추천수 내리기
	@ResponseBody
	@RequestMapping(value = "/board/Likedown" , method = RequestMethod.POST)
	public int Likedown(int Post_num)throws Exception{
			int Likedown = boardService.Likedown(Post_num);
			
			return Likedown;
	}
	
}

