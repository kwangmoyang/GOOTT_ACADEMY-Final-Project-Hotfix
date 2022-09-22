package com.Final.Final1.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
}




