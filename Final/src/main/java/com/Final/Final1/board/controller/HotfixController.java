package com.Final.Final1.board.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.HotfixDTO;
import com.Final.Final1.board.service.HotfixService;

@Controller
public class HotfixController {

	@Autowired
	HotfixService hotfixService;

	// 해결요청 글 리스트 목록
	@RequestMapping("/resolveMain")
	public ModelAndView resolveMain(HotfixDTO dto) {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> list = hotfixService.list(dto);
		mv.setViewName("/resolveMain");
		mv.addObject("list", list);

		return mv;
	}

	// 해결 요청 게시글 리스트
	@RequestMapping("/resolveWriteForm")
	public String resolveWriteForm() {
		return "/resolveWriteForm";
	}

	// 해결 요청 게시글 등록할때
	@RequestMapping("/resolveMainSubmit")
	public ModelAndView resolveMainPost(HotfixDTO dto) {

		ModelAndView mv = new ModelAndView();
		hotfixService.insert(dto);
//		System.out.println(dto.getCommission());
		mv.setViewName("redirect:/resolveMain");
		return mv;
	}

	// 요청자의 요청내역리스트에 쏴주기
//	@RequestMapping(value = "/solutionRequest", method = RequestMethod.GET)
//	public String solutionRequest() {
//
//		return "/resolveMain";
//	}
	// 해결자

	@RequestMapping("/solutionRequest")
	public ModelAndView solutionRequest(HotfixDTO dto, HttpSession session, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();

		System.out.println("게시글 코드" + dto.getRequest_code());
		String name = (String) session.getAttribute("User_nickname");
		dto.setSolver_member(name);
		System.out.println("해결 신청자" + name);
		hotfixService.resolveMember(dto);

		
		
		
		mv.setViewName("/resolveMain");
		return mv;
	}
	
	
	

	// 해결요청 글 리스트 목록
	@RequestMapping("/mypage/writer_request")
	public ModelAndView mypageWriter(HotfixDTO dto, HttpSession session,HttpServletRequest request) {
			//,@RequestParam(value="Request_code", required=false) String Request_code) {
		ModelAndView mv = new ModelAndView();

		// 세션 값 불러옴
		String name = (String) session.getAttribute("User_nickname");
		dto.setRequester(name); // 불러온 세션값을 dto에 설정

		// 로그인한 유저가 해결요청한 게시글을 뽑아옴
		List<BoardDTO> list = hotfixService.myRequestlist(dto);
		mv.addObject("list", list);
		
		// 해당 게시글에 대한 신청자 리스트
		System.out.println(dto.getRequest_code());
		dto.setRequest_code(7);
		List<HotfixDTO> resolver = hotfixService.resolveMemberlist(dto);
		mv.addObject("resolver", resolver);
		System.out.println(resolver);

		mv.setViewName("/mypage/mypage_writer_request");
		return mv;
	}
	
//	// 해결요청 글 리스트 목록
//	@ResponseBody
//	@RequestMapping("/mypage/writer_request_Modal")
//	public ModelAndView mypageWriterModal(HotfixDTO dto, HttpSession session) {
//			//,@RequestParam(value="Request_code", required=false) String Request_code) {
//		ModelAndView mv = new ModelAndView();
//		dto.setRequest_code(7);
//		List<HotfixDTO> resolver = hotfixService.resolveMemberlist(dto);
//		mv.addObject("resolver", resolver);
////		System.out.println(resolver);
//		mv.setViewName("/mypage/mypage_writer_request");
//		return mv;
//	}

}
