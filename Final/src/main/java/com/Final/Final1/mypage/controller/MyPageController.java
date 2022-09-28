package com.Final.Final1.mypage.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.MyCommentListDTO;
import com.Final.Final1.board.model.MyWriterListDTO;
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
	public ModelAndView mypageWriter(MyWriterListDTO dto, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//세션 값 불러옴
		String name = (String)session.getAttribute("User_nickname");
		dto.setPost_writer(name); // 불러온 세션값을 dto에 설정
		//로그인한 유저가 해결요청한 게시글을 뽑아옴
		List<BoardDTO> list = mypageService.myRequestlist(dto);
		mv.setViewName("/mypage/mypage_writer");
		mv.addObject("list", list);
		
		return mv;
	}

	// 마이페이지 작성한 댓글
	@RequestMapping("/mypage/comments")
	public ModelAndView mypagecomments(MyCommentListDTO dto, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		//세션 값 불러옴
		String name = (String)session.getAttribute("User_nickname");
		dto.setComment_writer(name); // 불러온 세션값을 dto에 설정
		
		//로그인한 유저가 해결요청한 게시글을 뽑아옴
		List<BoardDTO> list = mypageService.myCommentlist(dto);
		mv.setViewName("/mypage/mypage_comments");
		mv.addObject("list", list);
				
		return mv;
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
