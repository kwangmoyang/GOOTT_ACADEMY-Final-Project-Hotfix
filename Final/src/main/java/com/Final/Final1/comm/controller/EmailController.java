package com.Final.Final1.comm.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Final.Final1.comm.model.EmailDTO;
import com.Final.Final1.comm.service.EmailService;



@Controller
@RequestMapping("/email/*")
public class EmailController {
	@Inject
	EmailService emailService;
	
	@RequestMapping("write")
	public String write() {
		return "/email/write";
	}
	
	@RequestMapping("send")
	public String send(EmailDTO dto, Model model) {
		try {
			emailService.sendMail(dto);
			model.addAttribute("message", "?대찓?쇱씠 諛쒖넚?섏뿀?듬땲??");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "?대찓??諛쒖넚 ?ㅽ뙣...");
		}
		return "/email/write";
	}
}

