package com.Final.Final1.board.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.board.model.HotfixDAO;
import com.Final.Final1.board.model.HotfixDTO;
import com.Final.Final1.board.service.HotfixService;



@Controller
public class HotfixController {
	
	@Inject
	HotfixDAO hofixDao;
	@Autowired
	HotfixService hotfixService;
	
	// 마이페이지 작성한글
	@RequestMapping(value = "/resolveMain", method = RequestMethod.GET)
	public String resolveMain() {
		return "/resolveMain";
	}

	// 해결 요청 게시글 리스트
	@RequestMapping(value = "/resolveWriteForm", method = RequestMethod.GET)
	public String resolveWriteForm() {
		return "/resolveWriteForm";
	}

	// 해결 요청 게시글 등록할때
	@RequestMapping(value = "/resolveMain2", method = RequestMethod.POST)
	public ModelAndView resolveMainPost(HotfixDTO dto) {
		
		hotfixService.insert(dto);
		
		
		return null;
	}

}
