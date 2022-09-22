package com.Final.Final1.comm.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.comm.model.LoginDAO;
import com.Final.Final1.comm.model.LoginDTO;
import com.Final.Final1.comm.service.LoginService;


@Controller
public class LoginController {
	
	@Inject
	LoginDAO loginDao;


	
	@Autowired
	LoginService loginService;
	
	//로그인페이지
	@RequestMapping("/login")
	public String main() {
		return "/login_etc/login";
	}
	
	//로그아웃페이지
	@RequestMapping("/logout")
	public String logout() {
		
		return "/login_etc/login";
	}
	
	//회원가입페이지
	@RequestMapping("/join")
	public String join() {
		
		return "/login_etc/join";
	}
	
	//로그인 체크 
	@RequestMapping("/loginChk")
	public ModelAndView loginChk(LoginDTO dto, HttpSession session, 
			@RequestParam Map<String, Object> map) {
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println(dto.toString());
		
		
		String UserInfo_Chk = loginService.UserInfo_Chk(map);
		String UserOnlyId_Chk = loginService.UserOnlyId_Chk(map);
		
//		user ID PW 둘다 일치시 정상 로그인
		if(UserInfo_Chk != null) {
			mv.setViewName("/login_etc/login");
			System.out.println("환영합니다");
		}else if(UserOnlyId_Chk != null) {
			int Pw_Mistake_cnt = dto.getPw_Mistake_cnt();
			loginService.Mistake_cnt_Up(map); // pw 불일치시 mistake_cnt가 1씩 증가
			
			if(Pw_Mistake_cnt>=0) {
				loginService.Change_User_pw(map);
				session.setAttribute("admin", "니 비번 틀려서 이제 안댐");
			}
			mv.setViewName("/login_etc/login");
			
		}else if(UserOnlyId_Chk == null) {
			mv.setViewName("/login_etc/login");
			mv.addObject("notid", dto.getUser_id()); //해당 아이디 없습니다 jsp설정
			
			System.out.println("아이디 혹은 비번이 불일치");
			System.out.println(dto.getUser_id());
		}
		return mv;
		
	}
	
	
	
	
//
//	// 로그인 체크 
//	@RequestMapping("/loginChk")
//	public ModelAndView loginChk(UserDTO dto, HttpSession session) {
//			
//		ModelAndView mv = new ModelAndView();
////		System.out.println(dto.toString());
//
//		String loginChk = userDao.loginChk(dto); // (id,pw) 정보 부름
//		String loginChk_id = userDao.loginChk_onlyId(dto); // id 정보만
//			
//		
//			
//		// user ID PW 둘다 일치시 정상 로그인
//		if(loginChk != null) {
//			mv.setViewName("/hotmain");
//			System.out.println("환영합니다");
//			// user ID는 존재하나 PW 불 일치시
//			}else if(loginChk_id != null) {
//				// mistake_cnt 컬럼 불러옴
//				int mistake_cnt = userDao.mistake_cnt(dto);
//				userDao.up_cnt(dto); // pw 불일치시 mistake_cnt가 1씩 증가
//				System.out.println("아이디는 있는데 비번 틀림 ㅄ ㅋ");
//				System.out.println(mistake_cnt);
//				
//				// mistake_cnt(비밀번호) 5회 오류시 if문 실행
//				if(mistake_cnt>=5) {
//					System.out.println("5회 틀려서 관리자 문의바람");
//					userDao.changeUserPw(dto);
//					session.setAttribute("admin", "니 비번 틀려서 이제 안댐");
//
//				}
//				mv.setViewName("/login");
//				
//			}else if(loginChk_id==null){
//				mv.setViewName("/login");
//				mv.addObject("notid", dto.getUserId()); //해당 아이디 없습니다 jsp설정
//				
//				System.out.println("아이디 혹은 비번이 불일치");
//				System.out.println(dto.getUserId());
//				
//			}
//			return mv;
//		}
//	
//	// 회원가입 인설트 
//	@RequestMapping("/newuser")
//	public ModelAndView join(JoinDTO dto, HttpSession session) {
//		
//		ModelAndView mv = new ModelAndView();
//		System.out.println(dto.toString());
//		joinDao.join(dto);
//		session.setAttribute("userId", dto.getName());
//		
//		mv.setViewName("/welcome");
//
//		return mv;
//	}
	
	
	
}
