package com.Final.Final1.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//마이 페이지 컨트롤러
@Controller
public class MyPageController {

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

	// 마이페이지 결제및정산
	@RequestMapping("/mypage/pay")
	public String mainIndex() {
		return "/mypage/mypage_pay";
	}

}
