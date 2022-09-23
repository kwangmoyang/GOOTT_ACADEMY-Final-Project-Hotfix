package com.Final.Final1.comm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.comm.model.MainDTO;
import com.Final.Final1.comm.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping(value = "/MainPage", method = RequestMethod.GET)
//	public String main() {
//		return "MainPage";
//	}
	public ModelAndView list() {
		List<MainDTO> list = mainService.list();
		ModelAndView mav = new ModelAndView();

		mav.addObject("MainPage",list);
		mav.setViewName("MainPage");

		return mav;
	}
}







