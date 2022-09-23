package com.Final.Final1.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		List<BoardDTO> list = boardService.list();
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/board");
		mv.addObject("list",list);
		
		
		return mv;
	}
	@RequestMapping(value = "/TopicList", method = RequestMethod.POST)
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		System.out.println(map.toString());
		List<BoardDTO> list = boardService.list(map);	
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/board");
		mv.addObject("list",list);
		mv.addObject("tag",map);
		
		
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
	System.out.println(dto);
		
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
		// 조회수 증가
		
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
	
}

