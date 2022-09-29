package com.Final.Final1.board.controller;

import java.util.HashMap;
import java.util.List;

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

	//09.29 15:50 수근 JS로 주소값 필요
	
	//@RequestMapping(value = "/resolveMain", method = RequestMethod.GET)
//	public ModelAndView list(HttpServletRequest req,@RequestParam(defaultValue="1")int curPage,
	//	@RequestParam(defaultValue ="new")String search_option) {
	//	HotfixDTO dto = new HotfixDTO();
	//	String keyword = req.getParameter("keyword");
	//	dto.setKeyword(keyword);
	//	String select = req.getParameter("select");
	//	dto.setSelect(select);
		
	//	int count = hotfixService.count(req.getParameter("keyword"));
	//	PageUtil page_info = new PageUtil(count, curPage);
	//	int start = page_info.getPageBegin();
	//	int end = page_info.getPageEnd();
						
	//	List<BoardDTO> list = hotfixService.list(keyword, select, start, end);
	//	ModelAndView mv = new ModelAndView();	
	//	mv.setViewName("/resolveMain");
	//	Map<String, Object> map = new HashMap<>();

	//	map.put("list", list);
	//	map.put("count", count);
	//map.put("keyword", dto.getKeyword());
	//map.put("search_option", dto.getSelect());
	//map.put("page_info", page_info);

		
	//mv.addObject("map", map);
			
	//	return mv;
		
		
	//}
	
	
	
	
	
	
	
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
