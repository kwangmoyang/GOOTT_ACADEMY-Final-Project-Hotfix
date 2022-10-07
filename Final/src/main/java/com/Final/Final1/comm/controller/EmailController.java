package com.Final.Final1.comm.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.comm.model.EmailDTO;
import com.Final.Final1.comm.service.EmailService;



@Controller
public class EmailController {
	@Inject
	EmailService emailService;
		
	@RequestMapping("/email/send")
	public ModelAndView send(EmailDTO dto, Model model,
			HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView();
		
		try {
			emailService.sendMail(dto);
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('메일전송에 성공했어요');</script>");
	        out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		mv.setViewName("mypage/mypage");
		return mv;
	}
}

