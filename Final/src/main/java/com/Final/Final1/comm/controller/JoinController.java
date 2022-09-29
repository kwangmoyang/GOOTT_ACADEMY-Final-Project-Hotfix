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
import com.Final.Final1.comm.service.LoginService;


@Controller
public class JoinController {
	// ModelAndView를 사용하기 위해 mv 객체 생성
	
	@Autowired
	JoinService joinsvc;
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	private String join() {
		return "login_etc/join";

	}
	
	// 회원가입 컨트롤러
	@RequestMapping(value = "/join", method = RequestMethod.POST)
		public ModelAndView join(@RequestParam Map<String, Object> map) {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> UserOnlyId_Chk = loginService.UserOnlyId_Chk(map);
		Map<String, Object> User_nickname_Chk = loginService.User_nickname_Chk(map);
		
		if(UserOnlyId_Chk==null && User_nickname_Chk==null) {

			Map<String, Object> map2 = new HashMap<>();
			map.put("Email_address", map.get("Email_address")+"@"+map.get("hotEmail_Add"));
			map.put("Phone_num", map.get("phone1")+""+map.get("phone2"));
			System.out.println(map.toString());
			joinsvc.join(map); // 서비스에 조인이라는 함수에 있는 파라미터로 전달
			mv.setViewName("login_etc/login");
			return mv;
			//return "join";
		} else {
			mv.setViewName("login_etc/join");
			mv.addObject("idfalse","중복된 아이디가 존재합니다.");
			mv.addObject("nickfalse","중복된 닉네임이 존재합니다.");
			return mv;
		}
		
		
	}
	
}
