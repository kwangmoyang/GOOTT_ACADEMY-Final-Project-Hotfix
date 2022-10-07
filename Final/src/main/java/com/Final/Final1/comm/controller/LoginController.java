package com.Final.Final1.comm.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.comm.model.EmailDTO;
import com.Final.Final1.comm.model.LoginDAO;
import com.Final.Final1.comm.model.LoginDTO;
import com.Final.Final1.comm.model.MainDTO;
import com.Final.Final1.comm.service.EmailService;
import com.Final.Final1.comm.service.LoginService;
import com.Final.Final1.comm.service.MainService;
import com.Final.Final1.mypage.model.MypageDTO;
import com.Final.Final1.mypage.service.MypageService;

@Controller
public class LoginController {

	@Inject
	LoginDAO loginDao;
	@Inject
	EmailService emailService; // 이메일 기능을 사용하기 위함
	@Autowired
	LoginService loginService;
	@Autowired
	MainService mainService;
	@Autowired
	MypageService mypageService;
	// 로그인페이지
	@RequestMapping("/login")
	public String login() {
		return "/login_etc/login";
	}

	// 아이디 찾기 링크 이동
	@RequestMapping("/find_user_id")
	public String find_user_id() {
		return "/login_etc/find_id";
	}

	// 아이디 찾기 메일입력후 확인 누를시
	@RequestMapping("/find_user_idChk")
	public ModelAndView find_user_idChk(MypageDTO dto, EmailDTO Edto, HttpServletResponse response) throws IOException {

		ModelAndView mv = new ModelAndView();
		String UserIdinfo = loginService.UserEmailinfo(dto); // 유저 닉네임

		// 입력한 메일로 가입된 회원정보가 없을시
		if (UserIdinfo != null) {
			try {
				Edto.setReceiveMail(dto.getEmail_address()); // 받는 사람
				Edto.setSenderMail("zjqtm96@gmail.com"); // 보내는 메일
				Edto.setSenderName("[HOTFIX]"); // 보내는 사람
				Edto.setSubject("<HOTFIX> 회원님의 아이디 정보(보안)"); // 제목
				Edto.setMessage("회원님이 가입하셨던 아이디는 " + UserIdinfo + " 입니다."); // 내용

				emailService.sendMail(Edto);// 이메일 서비스 (실제 구현부)
				// 전송 성공시 alert창
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('메일을 확인하고 로그인을 진행해주세요!');</script>");
				out.flush();
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("/login_etc/login"); // 성공시 로그인 페이지 이동
		} else {
			mv.addObject("noJoinUser", "가입되어있지 않은 계정입니다.");
			mv.setViewName("/login_etc/find_id");
		}
		return mv;
	}

	// 비밀번호 찾기
	@RequestMapping("/find_user_pw")
	public String find_user_pw() {
		return "/login_etc/find_pw";
	}

	// 아이디 찾기 메일입력후 확인 누를시
	@RequestMapping("/find_user_pwChk")
	public ModelAndView find_user_pwChk(MypageDTO dto, EmailDTO Edto, HttpServletResponse response) throws IOException {

		ModelAndView mv = new ModelAndView();
		String UserEmailAndIDinfo = loginService.UserEmailAndIDinfo(dto); // 유저 닉네임
		
		
		// 입력한 메일로 가입된 회원정보가 없을시
		if (UserEmailAndIDinfo != null) {
			try {
				Edto.setReceiveMail(dto.getEmail_address()); // 받는 사람
				Edto.setSenderMail("zjqtm96@gmail.com"); // 보내는 메일
				Edto.setSenderName("[HOTFIX]"); // 보내는 사람
				Edto.setSubject("<HOTFIX> 회원님의 비밀번호 정보(보안)"); // 제목
				Edto.setMessage("회원님의 비밀번호는 " + UserEmailAndIDinfo + " 입니다."); // 내용

				emailService.sendMail(Edto);// 이메일 서비스 (실제 구현부)
				// 전송 성공시 alert창
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('메일을 확인하고 로그인을 진행해주세요!');</script>");
				out.flush();
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("/login_etc/login"); // 성공시 로그인 페이지 이동
		} else {
			mv.addObject("noJoinUser", "가입되어있지 않은 회원정보 입니다.");
			mv.setViewName("/login_etc/find_pw");
		}
		return mv;
	}
	
	
	

	@RequestMapping("/loginChk")
	public ModelAndView loginChk(LoginDTO dto,MypageDTO dto2, HttpSession session, @RequestParam Map<String, Object> map, MypageDTO mydto) {

		ModelAndView mv = new ModelAndView();

		// 유저 ID, PW 일치여부 확인
		Map<String, Object> UserInfo_Chk = loginService.UserInfo_Chk(map);
		// 유저 ID 가입여부 확인
		Map<String, Object> UserOnlyId_Chk = loginService.UserOnlyId_Chk(map);

		
		
		// 유저 ID PW 둘다 일치시 정상 로그인
		if (UserInfo_Chk != null) {

			List<MainDTO> list = mainService.list();
			mv.addObject("MainPage", list);
			mv.setViewName("redirect:/MainPage");
			// 로그인 완료시 세션 생성
			session.setAttribute("User_id", UserOnlyId_Chk.get("User_id"));
			session.setAttribute("admin_auth", UserOnlyId_Chk.get("admin_auth"));
			
			String photo = "/"+mypageService.UserPhotoView(dto2);
			File file2 = new File(photo);
			session.setAttribute("photo2", file2);
			
			mv.addObject("compare", "\\");
			UserOnlyId_Chk.forEach((strKey, strValue) -> {
				session.setAttribute(strKey, strValue);
			});

			// 유저 PW 오류시
		} else if (UserOnlyId_Chk != null) {
			// 유저 PW 오류 카운트 +
			int Pw_Mistake_cnt = loginService.Pw_Mistake_cnt(dto);
			loginService.Mistake_cnt_Up(dto); // 유저 PW 오류시 mistake_cnt 1 증가
			// 사용자 입장 오류 카운트 - (~번 남았습니다.)
			int Pw_Mistake_cnt2 = loginService.Pw_Mistake_cnt2(dto) - 1;
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
			}
			mv.setViewName("/login_etc/login");

			// 사이트에 등록되지않은 ID일 경우
		} else if (UserOnlyId_Chk == null) {
			mv.setViewName("/login_etc/login");
			// 등록되지 않은 메세지 표시
			mv.addObject("notid", dto.getUser_id() + "는 존재하지 않는 아이디입니다.");
			
		}
			// 활동점수
			//세션 값 불러옴
			String name = (String)session.getAttribute("User_nickname");
			mydto.setUser_nickname(name);
			loginService.activeInsert(mydto);
				
		return mv;
	}
}
