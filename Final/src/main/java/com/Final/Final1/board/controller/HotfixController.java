package com.Final.Final1.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.HotfixDTO;
import com.Final.Final1.board.service.HotfixService;

@Controller
public class HotfixController {

	@Autowired
	HotfixService hotfixService;

	//09.30 수근 작업
	
	@RequestMapping("/resolveMain")
	public ModelAndView resolveMain(HotfixDTO dto) {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> list = hotfixService.list(dto);
		mv.setViewName("/resolveMain");
		mv.addObject("list", list);

		return mv;
	}
	
	
	
	
	
	
	// 해결요청 글 리스트 목록
	//@RequestMapping("/resolveMain")
	//public ModelAndView resolveMain(HotfixDTO dto) {
	//	ModelAndView mv = new ModelAndView();
	//	List<BoardDTO> list = hotfixService.list(dto);
	//	mv.setViewName("/resolveMain");
	//	mv.addObject("list", list);

	//	return mv;
//	}

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

		mv.setViewName("redirect:/resolveMain");
		return mv;
	}


	//핫픽스 해결자 게시판
	@RequestMapping("/solutionRequest")
	public ModelAndView solutionRequest(HotfixDTO dto, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		//로그인된 사람의 닉네임을 불러와 신청자 리스트에 담아준다
		String name = (String) session.getAttribute("User_nickname");
		dto.setSolver_member(name);
		hotfixService.resolveMember(dto);

		mv.setViewName("redirect:/resolveMain");
		return mv;
	}
	
	

	// 해결요청 글 리스트 목록
	@ResponseBody
	@RequestMapping("/mypage/writer_request")
	public ModelAndView mypageWriter(HotfixDTO dto, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		// 세션 값 불러옴
		String name = (String) session.getAttribute("User_nickname");
		dto.setRequester(name); // 불러온 세션값을 dto에 설정

		// 로그인한 유저가 해결요청한 게시글을 뽑아옴
		List<BoardDTO> list = hotfixService.myRequestlist(dto);
		mv.addObject("list", list);
		mv.setViewName("/mypage/mypage_writer_request");
		
		return mv;
	}
	
	//해결요청 내역 상세 클릭시 ajax 값 받아와서 리턴
	// 해결 신청자 리스트
	@ResponseBody
	@RequestMapping("/mypage/writer_request2")
	public List<HotfixDTO> mypageWriter2(HotfixDTO dto) {
		//ajax로 통해 전달받은 값을 쿼리에 넣어줌
		List<HotfixDTO> resolver = hotfixService.resolveMemberlist(dto.getRequest_code());
		//신청자 목록 리스트 리턴
		return resolver;
	}
	
	@RequestMapping("/testzone")
	public String testzone(HotfixDTO dto) {
		//ajax로 통해 전달받은 값을 쿼리에 넣어줌
		System.out.println("ㅎㅇ");
		return null;
	}
	
	
	
	
	

}
