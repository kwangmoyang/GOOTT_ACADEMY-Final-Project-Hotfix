package com.Final.Final1.comm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainPageController {
	
	
	//�빂�뵿�뒪 硫붿씤�럹�씠吏�(濡쒓퀬 �겢由��떆)
	@RequestMapping("/main/index")
	public String mainIndex() {
		return "MainPage";
	}
	
	//�빐寃� �럹�씠吏�(hotfix)
	@RequestMapping("/hotfix/index")
	public String hotfixIndex() {
		return "resolveMain";
	}
	
	//���럹�씠吏�
	@RequestMapping("/team/index")
	public String teamIndex() {
		return "/teamlist";
	}
	//�옲�궧
	@RequestMapping("/ranking/index")
	public String rankingIndex() {
		return "/ranking/ranking";
	}
	
	//而ㅻ�ㅻ땲�떚
	@RequestMapping("/community/index")
	public String communityIndex() {
		return "/board/lifeBoard";
	}
	
	
	
	// 留덉씠 �럹�씠吏�
	@RequestMapping("/mypage/index")
	public String mypageIndex() {
		return "/mypage/mypage";
	}
	
	//異⑹쟾�븯湲�
	@RequestMapping("/charge/index")
	public String chargeIndex() {
		return "/mypage/mypage_pay";
	}
	
	//濡쒓렇�븘�썐
	@RequestMapping("/logout/index")
	public String logoutIndex(HttpSession session) {
		session.invalidate();
		return "MainPage";
	}
	
	//=====================================
	//=========�쑀�� 沅뚰븳 遺꾨쪟�뿉 �뵲�씪 �븘�옒�쓽 �럹�씠吏�媛� �몴�떆�맖========
	
	//愿�由ъ옄 �럹�씠吏�
	@RequestMapping("/admin/index")
	public String adminIndex() {
		return "/mypage/mypage";
	}
	
	//���옣 �럹�씠吏�
	@RequestMapping("/teamLeader/index")
	public String teamLeaderIndex() {
		return "/mypage/mypage";
	}
	
}



