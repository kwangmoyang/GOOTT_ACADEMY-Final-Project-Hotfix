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

	// 로그인페이지
	@RequestMapping("/login")
	public String login() {

		return "/login_etc/login";
	}

//	//로그아웃페이지
//	@RequestMapping("/logout")
//	public String logout() {
//
//		return "/login_etc/login";
//	}

	// 회원가입페이지
	@RequestMapping("/join_test")
	public String join_test() {

		return "/login_etc/join";
	}

	// 아이디 비밀번호 찾기
	@RequestMapping("/find_user_idpw")
	public String find_user_idpw() {

		return "/login_etc/find_id";
	}

	@RequestMapping("/loginChk")
	public ModelAndView loginChk2(LoginDTO dto, HttpSession session, @RequestParam Map<String, Object> map) {

		ModelAndView mv = new ModelAndView();

		// 유저 ID, PW 일치여부 확인
		Map<String, Object> UserInfo_Chk = loginService.UserInfo_Chk(map);
		// 유저 ID 가입여부 확인
		Map<String, Object> UserOnlyId_Chk = loginService.UserOnlyId_Chk(map);

		
		
		// 유저 ID PW 둘다 일치시 정상 로그인
		if (UserInfo_Chk != null) {
			mv.setViewName("/MainPage");
			// 로그인 완료시 세션 생성
			session.setAttribute("User_id", UserOnlyId_Chk.get("User_id"));
			
			UserOnlyId_Chk.forEach((strKey, strValue)->{
				System.out.println("되냐?"+ strKey +":"+ strValue );
				session.setAttribute(strKey, strValue);
			});

			
			
			
			// 유저 PW 오류시
		} else if (UserOnlyId_Chk != null) {
			// 유저 PW 오류 카운트 +
			int Pw_Mistake_cnt = loginService.Pw_Mistake_cnt(dto);
			loginService.Mistake_cnt_Up(dto); // 유저 PW 오류시 mistake_cnt 1 증가
			// 사용자 입장 오류 카운트 - (~번 남았습니다.)
			int Pw_Mistake_cnt2 = loginService.Pw_Mistake_cnt2(dto)-1;
			loginService.Mistake_cnt_Up2(dto); // 사용자 입장 ~번 남았습니다 cnt

			// 유저 PW 오류시 view단 메세지표시
			if (Pw_Mistake_cnt2 > 0) {
				mv.addObject("forgotPw", "비밀번호를 잊으셨나요?");
				mv.addObject("chk", "앞으로 " + Pw_Mistake_cnt2);
				mv.addObject("guide", "번 더 틀리면 비밀번호 변경이 필요합니다.");
				// Pw_Mistake_cnt2 카운트 0 변경시 오류시 메세지 사라지고 계정정지 메세지 출력(다음 if문)
			} else {
				mv.addObject("forgotPw", "");
				mv.addObject("chk", "");
				mv.addObject("guide", "");
			}

			// 유저 PW 5회 오류시 비밀번호 변경 메세지 표시
			if (Pw_Mistake_cnt >= 5) {
				loginService.Change_User_pw(map); // 유저 PW 변경 (암호화 예정)
				mv.addObject("forgotff", "5회 이상 틀려서 계정이 정지되었습니다. 관리자에게 문의하세요");
				System.out.println("비번틀려서 관리자 문의");
			}
			mv.setViewName("/login_etc/login");

			// 사이트에 등록되지않은 ID일 경우
		} else if (UserOnlyId_Chk == null) {
			mv.setViewName("/login_etc/login");
			// 등록되지 않은 메세지 표시
			mv.addObject("notid", dto.getUser_id() + "는 존재하지 않는 아이디입니다.");

		}
		return mv;
	}
}

