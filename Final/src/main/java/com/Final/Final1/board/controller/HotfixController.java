package com.Final.Final1.board.controller;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.HotfixDTO;
import com.Final.Final1.board.model.PageUtil;
import com.Final.Final1.board.service.HotfixService;
import com.Final.Final1.mypage.model.MypageDTO;
import com.Final.Final1.mypage.service.MypageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.UUID;


@Controller
public class HotfixController {

	@Autowired
	HotfixService hotfixService;
	
	@Autowired
	MypageService mypageService;
	
	
	//10 04 HIKARI 채팅프로그램
	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv, HttpSession session) {
		mv.setViewName("chattingview");
		//사용자 정보 출력(세션)//
		//User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//세션 값 따오기 수정
		System.out.println("유저 닉네임 :" + session.getAttribute("User_nickname"));
		
		System.out.println("normal chat page");
		
		mv.addObject("User_nickname", session.getAttribute("User_nickname"));
		
		return mv;
	}
	
	//09.30 수근 작업 HOTFIX 
	@RequestMapping(value = "/resolveMain", method = RequestMethod.GET)
	public ModelAndView resolveMain(HttpServletRequest req, @RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue ="new")String search_option, HttpSession session) {
		
		String userid = (String)session.getAttribute("User_id");
			
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
			@RequestParam(defaultValue="1")int curPage,MypageDTO dto2) {
		
		session.getId();
		
		String nickToResolve = (String) session.getAttribute("User_nickname");
		dto.setSolver(nickToResolve);
		int count = hotfixService.resultCount(dto);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		//게시판 리스트 (다른 컨트롤러 주소로 뺴셈)
		List<HotfixDTO> resolver2 = hotfixService.resolveZone(dto, start, end);
		
		ModelAndView mv = new ModelAndView();
		
		// 사진 업로드후 바로 프로필 적용
		String name2 = (String)session.getAttribute("User_id");
		dto2.setUser_id(name2);
		String photo = "/"+mypageService.UserPhotoView(dto2);
					        
		File file2 = new File(photo);
									
		mv.addObject("photo", file2);
		
		
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
	public ModelAndView solutionRequest(HotfixDTO dto, HttpSession session,
			@RequestParam("User_nickname") String User_nickname,
			@RequestParam("Request_code") int Request_code){
		ModelAndView mv = new ModelAndView();

		//로그인된 사람의 닉네임을 불러와 신청자 리스트에 담아준다
		//String name = (String) session.getAttribute("User_nickname");
		dto.setSolver_member(User_nickname);
		//dto.setRequest_code(Request_code);
		
		System.out.println(dto.getRequest_code());
		System.out.println(User_nickname);
		System.out.println(Request_code);
		
		
		List<HotfixDTO> resolveChk = hotfixService.resolveChk(dto);
		System.out.println(resolveChk);
		//셀렉트 먼저 불러오기 
		//만약 불러온값이 있다면 

		if(resolveChk.isEmpty()) {
			System.out.println("신청하셨음");
			hotfixService.resolveMember(dto); //인설트문 실행
		}else {
			System.out.println("이미 신청하셨음");
		}
		
		mv.setViewName("redirect:/resolveMain");
		return mv;
	}
	
	

	// 해결요청 글 리스트 목록
	@ResponseBody
	@RequestMapping("/mypage/writer_request")
	public ModelAndView mypageWriter(HotfixDTO dto, HttpSession session, 
			@RequestParam(defaultValue="1")int curPage, MypageDTO dto2 ){
		

		// 세션 값 불러옴
		String name = (String) session.getAttribute("User_nickname");
		dto.setRequester(name); // 불러온 세션값을 dto에 설정
		
		int count = hotfixService.count(dto);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		
		// 로그인한 유저가 해결요청한 게시글을 뽑아옴
		List<BoardDTO> list = hotfixService.myRequestlist(dto,start,end);
		ModelAndView mv = new ModelAndView();
		
		// 사진 업로드후 바로 프로필 적용
		String name2 = (String)session.getAttribute("User_id");
		dto2.setUser_id(name2);
		String photo = "/"+mypageService.UserPhotoView(dto2);
					        
		File file2 = new File(photo);
								
		mv.addObject("photo", file2);
		
		
		
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
		System.out.println(dto.getRequest_code());
		List<HotfixDTO> resolver = hotfixService.resolveMemberlist(dto.getRequest_code());
		//신청자 목록 리스트 리턴
		return resolver;
	}
	
	//해결자 선택하기
	@RequestMapping("/choiceResolve")
	public ModelAndView choiceResolve(HotfixDTO dto,HttpSession session,
			@RequestParam(defaultValue="1")int curPage,MypageDTO dto2) {
		ModelAndView mv = new ModelAndView();
		//ajax로 통해 전달받은 값을 쿼리에 넣어줌
		
		int count = hotfixService.count(dto);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		
				
		// 세션 값 불러옴
		String name = (String) session.getAttribute("User_nickname");
		dto.setRequester(name); // 불러온 세션값을 dto에 설정
		
		//업데이트
		hotfixService.choiceResolve(dto, start, end);
		
		
		// 로그인한 유저가 해결요청한 게시글을 뽑아옴
		List<BoardDTO> list = hotfixService.myRequestlist(dto,start,end);

		// 사진 업로드후 바로 프로필 적용
		String name2 = (String)session.getAttribute("User_id");
		dto2.setUser_id(name2);
		String photo = "/"+mypageService.UserPhotoView(dto2);
							        
		File file2 = new File(photo);
										
		mv.addObject("photo", file2);
		
		
		
		mv.addObject("list", list);
		mv.addObject("count", count);
		mv.addObject("page_info", page_info);
		mv.setViewName("/mypage/mypage_writer_request");
		return mv;
	}


	/**
	 * @param multiFile
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="hotfix/imgUpload.do", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request,
							HttpServletResponse response, MultipartHttpServletRequest multiFile
			, @RequestParam MultipartFile upload) throws Exception{
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		//인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try{

			//파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			//이미지 경로 생성
			String path = "C:\\clientImg" + "ckImage/";
			String ckUploadPath = path + uid + "_" + fileName;
			File folder = new File(path);

			//해당 디렉토리 확인
			if(!folder.exists()){
				try{
					folder.mkdirs(); // 폴더 생성
				}catch(Exception e){
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "/hotfix/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			printWriter.flush();

		}catch(IOException e){
			e.printStackTrace();
		} finally {
			try {
				if(out != null) { out.close(); }
				if(printWriter != null) { printWriter.close(); }
			} catch(IOException e) { e.printStackTrace(); }
		}

		return;
	}

	/**
	 * cKeditor 서버로 전송된 이미지 뿌려주기
	 * @param uid
	 * @param fileName
	 * @param request
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	//
	@RequestMapping(value="/hotfix/ckImgSubmit.do")
	public void ckSubmit(@RequestParam(value="uid") String uid
			, @RequestParam(value="fileName") String fileName
			, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{

		//서버에 저장된 이미지 경로
		
		String path = "C:\\clientImg" + "ckImage/";
//				"/Users/seoair/Goott/Project/FinalProjectSpring/untitled/Final/src/main/webapp/resources/img/clientImg" + "ckImage/";
		String sDirPath = path + uid + "_" + fileName;

		File imgFile = new File(sDirPath);

		//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
		if(imgFile.isFile()){
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try{
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();

				while((readByte = fileInputStream.read(buf)) != -1){
					outputStream.write(buf, 0, readByte);
				}

				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();

			}catch(IOException e){
				e.printStackTrace();
			}finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}

	//포기하기 버튼 클릭시
	@RequestMapping({"/giveUpSolver","/giveUpSolver2"})
	public ModelAndView giveUpSolver(HotfixDTO dto,MypageDTO dto2,@RequestParam("Request_code") int Request_code,
			HttpSession session,@RequestParam(defaultValue="1")int curPage,HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		
		int count = hotfixService.count(dto);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		// 세션 값 불러옴
		String name = (String) session.getAttribute("User_nickname");
		
		dto.setRequest_code(Request_code);
		dto.setRequester(name); // 불러온 세션값을 dto에 설정
		hotfixService.giveUpResolve(dto); // 게시판 테이블의 Solver가 null로 변경
		
		dto.setUser_nickname(name);
		if(request.getServletPath().equals("/giveUpSolver")) {
			hotfixService.Drop_Req_cnt(dto);//해결요청가 포기 했을경우 카운트 UP
		}else if(request.getServletPath().equals("/giveUpSolver2")) {
			hotfixService.Drop_Sol_cnt(dto);//해결자가 포기 했을경우 카운트 UP
		}
		// 사진 업로드후 바로 프로필 적용
		String name2 = (String)session.getAttribute("User_id");
		dto2.setUser_id(name2);
		String photo = "/"+mypageService.UserPhotoView(dto2);
									        
		File file2 = new File(photo);
												
		mv.addObject("photo", file2);
		// 로그인한 유저가 해결요청한 게시글을 뽑아옴
		List<BoardDTO> list = hotfixService.myRequestlist(dto,start,end);
		mv.addObject("list", list);
		mv.addObject("count", count);
		mv.addObject("page_info", page_info);
		
		
		mv.setViewName("/mypage/mypage_writer_request");
		return mv;
	}
	
		//해결완료 버튼 클릭시
		@RequestMapping("/CompletionResolve")
		public ModelAndView CompletionResolve(HotfixDTO dto,MypageDTO dto2,@RequestParam("Requester") String Requester,
				@RequestParam("Solver") String Solver,@RequestParam("Commission") int Commission,
				@RequestParam("Request_code") int Request_code, HttpSession session,
				@RequestParam(defaultValue="1")int curPage) {
			
			ModelAndView mv = new ModelAndView();
			
			int count = hotfixService.count(dto);
			PageUtil page_info = new PageUtil(count, curPage);
			int start = page_info.getPageBegin();
			int end = page_info.getPageEnd();
			
			
			dto.setCommission(Commission);
			//요청자의 커미션의 차감
			dto.setUser_nickname(Requester);
			hotfixService.requesterCommissionDown(dto);
			
			//해결자의 커미션이 증가
			dto.setUser_nickname(Solver);
			hotfixService.resolverCommissionUp(dto);
			
			//해당 게시물이 완료됨으로 변경 (result)
			dto.setRequest_code(Request_code);
			hotfixService.Completion(dto);
			
			
			// 세션 값 불러옴
			String name = (String) session.getAttribute("User_nickname");
			dto.setRequester(name); // 불러온 세션값을 dto에 설정
			// 로그인한 유저가 해결요청한 게시글을 뽑아옴
			List<BoardDTO> list = hotfixService.myRequestlist(dto,start,end);
			System.out.println(list);
			
			// 사진 업로드후 바로 프로필 적용
			String name2 = (String)session.getAttribute("User_id");
			dto2.setUser_id(name2);
			String photo = "/"+mypageService.UserPhotoView(dto2);
										        
			File file2 = new File(photo);
													
			mv.addObject("photo", file2);
			
			mv.addObject("list", list);
			mv.addObject("count", count);
			mv.addObject("page_info", page_info);
			//전적 떨어지는거 추가해야함 (테이블 문의)
			
			mv.setViewName("/mypage/mypage_writer_request");
			return mv;
		}	



}
