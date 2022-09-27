package com.Final.Final1.comm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.comm.model.JoinDTO;
import com.Final.Final1.comm.service.JoinService;


@Controller
public class JoinController {
	// ModelAndView를 사용하기 위해 mv 객체 생성
	
	@Autowired
	JoinService joinsvc;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	private String join() {
		return "login_etc/join";

	}
	
	// 회원가입 컨트롤러
	@RequestMapping(value = "/join", method = RequestMethod.POST)
		public String join(@RequestParam Map<String, Object> map) {
		
		Map<String, Object> map2 = new HashMap<>();
		map.put("Email_address", map.get("Email_address")+"@"+map.get("hotEmail_Add"));
		map.put("Phone_num", map.get("phone1")+""+map.get("phone2"));
		System.out.println(map.toString());
		joinsvc.join(map); // 서비스에 조인이라는 함수에 있는 파라미터로 전달
		return "login_etc/login";
		//return "join";
	}
	
}
