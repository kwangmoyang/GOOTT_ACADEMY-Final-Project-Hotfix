package com.Final.Final1.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.HotfixDTO;
import com.Final.Final1.board.service.HotfixService;



@Controller
public class HotfixController {
	

	@Autowired
	HotfixService hotfixService;
	
	// 해결요청 글 리스트 목록
	@RequestMapping("/resolveMain")
	public ModelAndView resolveMain(HotfixDTO dto) {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> list = hotfixService.list(dto);
		System.out.println(dto.toString());

		mv.setViewName("/resolveMain");
		mv.addObject("list",list);
		
		return mv;
	}
	

	// 해결 요청 게시글 리스트
	@RequestMapping("/resolveWriteForm")
	public String resolveWriteForm() {
		return "/resolveWriteForm";
	}
	// 해결 요청 게시글 등록할때
	@RequestMapping("/resolveMainSubmit")
	public ModelAndView resolveMainPost(HotfixDTO dto) {
		
		ModelAndView mv = new ModelAndView();
		hotfixService.insert(dto);
		System.out.println(dto.getCommission());
		mv.setViewName("redirect:/resolveMain");
		return mv;
	}

}
