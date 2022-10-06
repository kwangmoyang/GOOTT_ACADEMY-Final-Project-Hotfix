package com.Final.Final1.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Final.Final1.mypage.model.KakaoPay;


@Controller
public class PayController {
	
	@Autowired
	KakaoPay kakaopay;
	
	@RequestMapping(value="/kakaoPay", method=RequestMethod.GET)
	public String payTest1() {
		return "/pay/mypage_pay";
	}
	
	@RequestMapping(value="/kakaoPay", method=RequestMethod.POST)
	public String payTest2() {
		
		System.out.println("kakaoPay post............................................");
	        
	     return "redirect:" + kakaopay.kakaoPayReady();
	}
	
	@RequestMapping("/kakaoPaySuccess")
	public String payTest3(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("kakaoPaySuccess get............................................");
        System.out.println("kakaoPaySuccess pg_token : " + pg_token);
        
		return "/pay/kakaoPaySuccess";
	}

	
}
