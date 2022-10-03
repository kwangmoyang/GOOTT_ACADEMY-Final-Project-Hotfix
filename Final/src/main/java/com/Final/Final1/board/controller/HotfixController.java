package com.Final.Final1.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.HotfixDTO;
import com.Final.Final1.board.model.PageUtil;
import com.Final.Final1.board.service.HotfixService;


@Controller
public class HotfixController {

	@Autowired
	HotfixService hotfixService;

	//09.30 수근 작업 HOTFIX
	@RequestMapping(value = "/resolveMain", method = RequestMethod.GET)
	public ModelAndView resolveMain(HttpServletRequest req, @RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue ="new")String search_option) {
			
		HotfixDTO dto = new HotfixDTO();
		String keyword = req.getParameter("keyword");
		dto.setKeyword(keyword);
		String select = req.getParameter("select");
		dto.setSelect(select);
		
		int count = hotfixService.count(req.getParameter("keyword"));
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		

		List<HotfixDTO> list = hotfixService.list(keyword, start, end, select);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/resolveMain");
		mv.addObject("list", list);
		mv.addObject("count", count);
		mv.addObject("keyword", dto.getKeyword());
		mv.addObject("page_info", page_info);
		mv.addObject("search_option", dto.getSelect()); 
		
		return mv;
	}


	
	// 해결 요청 게시글 리스트
	@RequestMapping("/resolveWriteForm")
	public ModelAndView resolveWriteForm() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/resolveWriteForm");
		return mv;

	}
	
	// 마이페이지 해결 내역 
	@RequestMapping("/mypage/result")
	public ModelAndView mypageresult(HotfixDTO dto,HttpSession session,
			@RequestParam(defaultValue="1")int curPage) {
		
		
		String nickToResolve = (String) session.getAttribute("User_nickname");
		dto.setSolver(nickToResolve);
		int count = hotfixService.resultCount(dto);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		//게시판 리스트 (다른 컨트롤러 주소로 뺴셈)
		List<HotfixDTO> resolver2 = hotfixService.resolveZone(dto, start, end);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("count", count);
		mv.addObject("page_info", page_info);
		mv.addObject("resolver2", resolver2);
		mv.setViewName("/mypage/mypage_writer_result");
		
		return mv;
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
		System.out.println("gd");
		String name = (String) session.getAttribute("User_nickname");
		dto.setSolver_member(name);
		hotfixService.resolveMember(dto);

		mv.setViewName("redirect:/resolveMain");
		return mv;
	}
	
	

	// 해결요청 글 리스트 목록
	@ResponseBody
	@RequestMapping("/mypage/writer_request")
	public ModelAndView mypageWriter(HotfixDTO dto, HttpSession session, 
			@RequestParam(defaultValue="1")int curPage) {
		

		// 세션 값 불러옴
		String name = (String) session.getAttribute("User_nickname");
		dto.setRequester(name); // 불러온 세션값을 dto에 설정
		
		int count = hotfixService.count(dto);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();

		// 로그인한 유저가 해결요청한 게시글을 뽑아옴
		List<BoardDTO> list = hotfixService.myRequestlist(dto, start, end);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		mv.addObject("count", count);
		mv.addObject("page_info", page_info);
		
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
	//해결자 선택하기
	@RequestMapping("/choiceResolve")
	public ModelAndView choiceResolve(HotfixDTO dto) {
		ModelAndView mv = new ModelAndView();
		//ajax로 통해 전달받은 값을 쿼리에 넣어줌
		System.out.println("ㅎㅇ");
		
		//업데이트
		hotfixService.choiceResolve(dto);
		
		
		mv.setViewName("/mypage/mypage_writer_request");
		return mv;
	}


	
	


}
