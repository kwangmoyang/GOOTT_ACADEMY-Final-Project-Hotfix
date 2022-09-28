package com.Final.Final1.mypage.model;

import java.util.Map;

import com.Final.Final1.comm.model.LoginDTO;

public interface MypageDAO {
	
	public int UserPoint(MypageDTO dto);
	
	public void UserSetNickname(MypageDTO dto);
	
	public void UserSetPhone_num(MypageDTO dto);
	public void UserSetEmail_address(MypageDTO dto);
	public void UserSetUser_pw(MypageDTO dto);
	public void UserSetUser_introduce(MypageDTO dto);

	public void UserDelete(String userid);
	
	
	
}
