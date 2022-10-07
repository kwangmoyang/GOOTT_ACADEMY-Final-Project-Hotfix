package com.Final.Final1.comm.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 회원가입 이동
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
			joinsvc.join(map); // 서비스에 조인이라는 함수에 있는 파라미터로 전달
			mv.setViewName("login_etc/login");
			return mv;
		} else {
			
			mv.setViewName("login_etc/join");
			return mv;
		}
		
		
	}
	
	//아이디 입력하는 동시에 경고글 뜨게하기 위해 추가한 아이디 중복 체크 controller
	@RequestMapping(value="/joinid", method= RequestMethod.POST)
	public @ResponseBody int idcheck(@RequestParam("hotID") String hotID) {
		int result = loginService.idcheck(hotID);
		
		return result;
	}
	
	//닉네임 중복체크
	@RequestMapping(value="/joinnick", method= RequestMethod.POST)
	public @ResponseBody int joinnick(@RequestParam("hotNick") String hotNick) {
		int result = loginService.nicknamecheck(hotNick);
		
		return result;
	}
	
}
