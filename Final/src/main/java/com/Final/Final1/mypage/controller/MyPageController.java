package com.Final.Final1.mypage.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.comm.model.LoginDTO;
import com.Final.Final1.comm.service.LoginService;
import com.Final.Final1.mypage.model.MypageDAO;
import com.Final.Final1.mypage.model.MypageDTO;
import com.Final.Final1.mypage.service.MypageService;

//마이 페이지 컨트롤러
@Controller
public class MyPageController {

	@Inject
	MypageDAO mypageDao;
	@Autowired
	MypageService mypageService;

	// 마이페이지 정보 수정
	@RequestMapping("/mypage/setUserInfo")
	public String mypageSet() {
		return "/mypage/mypage_Set";
	}

	// 마이페이지 작성한글
	@RequestMapping("/mypage/writer")
	public String mypageWriter() {
		return "/mypage/mypage_writer";
	}

	// 마이페이지 작성한 댓글
	@RequestMapping("/mypage/comments")
	public String mypagecomments() {
		return "/mypage/mypage_comments";
	}

	// 마이페이지 해결 요청내역
	@RequestMapping("/mypage/request")
	public String mypagerequest() {
		return "/mypage/mypage_writer_request";
	}

	// 마이페이지 해결중인 내역
	@RequestMapping("/mypage/result")
	public String mypageresult() {
		return "/mypage/mypage_writer_result";
	}
	

	// 마이페이지 결제및정산
	@RequestMapping(value = "/mypage/pay", method = RequestMethod.GET)
	public ModelAndView mainIndex(MypageDTO dto, HttpSession session) {
		ModelAndView mv = new ModelAndView();

//		session.setAttribute("User_point", dto.getUser_point());

		mv.setViewName("/mypage/mypage_pay");

		return mv;
	}

	// 마이페이지 정보 수정
	@RequestMapping(value = "/mypage/setok", method = RequestMethod.POST)
	public ModelAndView mypagesetok(MypageDTO dto, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		mypageService.UserSetNickname(dto);
		session.setAttribute("User_nickname", dto.getUser_nickname());

		mv.setViewName("redirect:/mypage/setUserInfo");

		return mv;
	}

	@RequestMapping(value = "/mypage/UserSetPhone_num", method = RequestMethod.POST)
	public ModelAndView UserSetPhone_num(MypageDTO dto, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		mypageService.UserSetPhone_num(dto);
		session.setAttribute("Phone_num", dto.getPhone_num());

		mv.setViewName("redirect:/mypage/setUserInfo");

		return mv;
	}

	@RequestMapping(value = "/mypage/UserSetEmail_address", method = RequestMethod.POST)
	public ModelAndView UserSetEmail_address(MypageDTO dto, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		mypageService.UserSetEmail_address(dto);
		session.setAttribute("Email_address", dto.getEmail_address());
		mv.setViewName("redirect:/mypage/setUserInfo");

		return mv;
	}

	@RequestMapping(value = "/mypage/UserSetUser_introduce", method = RequestMethod.POST)
	public ModelAndView UserSetUser_introduce(MypageDTO dto, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		mypageService.UserSetUser_introduce(dto);
		session.setAttribute("User_introduce", dto.getUser_introduce());

		mv.setViewName("redirect:/mypage/setUserInfo");

		return mv;
	}

}
