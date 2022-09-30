package com.Final.Final1.comm.controller;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import com.Final.Final1.admin.model.AdminDTO;
import com.Final.Final1.admin.service.AdminService;
import com.Final.Final1.comm.model.MainDTO;
import com.Final.Final1.comm.service.MainService;
import com.google.gson.JsonObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;




import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/MainPage" , method = RequestMethod.GET)
	public ModelAndView list(HttpSession session) {
		//조건문 추가
//		session.invalidate();

		List<MainDTO> list = mainService.list();
		List<MainDTO> listTeam = mainService.listTeam();
		List<MainDTO> listBoard = mainService.listBoard();
		ModelAndView mav = new ModelAndView();
		mav.addObject("Request",list);
		mav.addObject("Teamlist",listTeam);
		mav.addObject("Boardlist",listBoard);
		mav.setViewName("MainPage");

		return mav;
	}


	@RequestMapping("/hotfix/index")
	public String hotfixIndex() {
		return "resolveMain";
	}

	//팀페이지
//	@RequestMapping("/team/index")
//	public String teamIndex() {
//		return "/team/teamlist";
//	}
	//랭킹
	@RequestMapping("/ranking/index")
	public String rankingIndex() {
		return "/ranking/ranking";
	}

	//커뮤니티
	@RequestMapping("/community/index")
	public String communityIndex() {
		return "/board/lifeBoard";
	}



	// 마이 페이지
	@RequestMapping("/mypage/index")
	public String mypageIndex() {
		return "/mypage/mypage";
	}

	//충전하기
	@RequestMapping("/charge/index")
	public String chargeIndex() {
		return "/mypage/mypage_pay";
	}

	//로그아웃
	@RequestMapping("/logout/index")
	public ModelAndView logoutIndex(HttpSession session) {
		session.invalidate();
		
		List<MainDTO> list = mainService.list();
		ModelAndView mv = new ModelAndView();
		mv.addObject("MainPage",list);
		mv.setViewName("redirect:/MainPage");
		
		return mv;
	}

	//=====================================
	//=========유저 권한 분류에 따라 아래의 페이지가 표시됨========

	//관리자 페이지
//	@RequestMapping("/admin/index")
//	public String adminIndex() {
//		return "/admin/admin";
//	}
	

	
	@RequestMapping(value = "/admin/index", method = RequestMethod.GET)
	public ModelAndView adminMemList(AdminDTO dto, HttpSession session, Map<String, Object> map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		Enumeration<String> attributes = request.getSession().getAttributeNames();
	      while (attributes.hasMoreElements()) {
	          String attribute = (String) attributes.nextElement();
	          System.out.println(attribute+" : "+request.getSession().getAttribute(attribute));
	      }
	    
	    Integer admin_auth = (Integer)session.getAttribute("admin_auth");  
	    System.out.println(admin_auth);
	    if(!admin_auth.equals(1)) {
	    	mv.setViewName("redirect:/MainPage");
	    	return mv;
	    }
		
		int userCount = adminService.userCount(dto);
		System.out.println(dto.getUserCount());
		mv.addObject("count", userCount);
		mv.addObject("map", adminService.adminMemList(map));
		mv.setViewName("/admin/admin"); // JSP파일명
		return mv;
	}

	//팀장 페이지
	@RequestMapping("/teamLeader/index")
	public String teamLeaderIndex() {
		return "/mypage/mypage";
	}

	@ResponseBody
	@RequestMapping(value = "fileupload.do")
	public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");

		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
					try{

						String fileName = file.getOriginalFilename();
						byte[] bytes = file.getBytes();

						String uploadPath = req.getSession().getServletContext().getRealPath("/resources/img/clientImg"); //저장경로
						System.out.println("uploadPath:"+uploadPath);

						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()) {
							uploadFile.mkdir();
						}
						String fileName2 = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName2 +fileName;

						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = resp.getWriter();
						String fileUrl = req.getContextPath() + "/resources/img/clientImg/" +fileName2 +fileName; //url경로
						System.out.println("fileUrl :" + fileUrl);
						JsonObject json = new JsonObject();
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.print(json);
						System.out.println(json);

					}catch(IOException e){
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
	}

}








