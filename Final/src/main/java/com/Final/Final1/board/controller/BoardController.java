package com.Final.Final1.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest req,@RequestParam(defaultValue="1")int curPage ) {
		BoardDTO dto = new BoardDTO();
		String boardCode = req.getParameter("boardCode");
		dto.setBoardCode(boardCode);
		String keyword = req.getParameter("keyword");
		dto.setKeyword(keyword);
		
		int count = boardService.count(req.getParameter("keyword"),dto.getBoardCode());
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
						
		List<BoardDTO> list = boardService.list(boardCode, keyword, start, end);
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("board/board");
		Map<String, Object> map = new HashMap<>();
		

		map.put("list", list);
		map.put("count", count);
		map.put("boardCode", dto.getBoardCode());
		map.put("keyword", dto.getKeyword());
		map.put("page_info", page_info);

		
		mv.addObject("map", map);
				
		return mv;
		
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {	
		return "board/boardWriteForm";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insertPost(BoardDTO dto) {
		boardService.insert(dto);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/list");
		
		return mv;
	}
	@RequestMapping(value= "/detail", method = RequestMethod.GET)
	public ModelAndView detail(BoardDTO dto) {
		boardService.viewCount(dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", boardService.detail(dto));
		
		mv.setViewName("board/detailBoard");
			
		return mv;	
	}
	@RequestMapping(value= "/update", method = RequestMethod.GET)
	public ModelAndView update(BoardDTO dto) {
		Map<String, Object> PostInfo = boardService.detail(dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", PostInfo);
		mv.setViewName("board/update");
				
		return mv;
		
		
	}
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public ModelAndView updatePost(BoardDTO dto) {
		ModelAndView mv = new ModelAndView();
		int test = boardService.update(dto);
		System.out.println("test = "+ test);
		mv.setViewName("redirect:/list");
		return mv;
				
	}
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
	
	@ResponseBody
	@RequestMapping(value = "/board/Likeup" , method = RequestMethod.POST)
	public int Likeup(int Post_num)throws Exception{
			int Likeup = boardService.Likeup(Post_num);
			
			return Likeup;
	}
	
	@ResponseBody
	@RequestMapping(value = "/board/Likedown" , method = RequestMethod.POST)
	public int Likedown(int Post_num)throws Exception{
			int Likedown = boardService.Likedown(Post_num);
			
			return Likedown;
	}
	
}

