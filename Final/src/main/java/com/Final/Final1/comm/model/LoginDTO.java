package com.Final.Final1.comm.model;

public class LoginDTO {
	//22-09-20 HIKARI
	//로그인 진행시 User_id와 User_pw 정보만 들어가면됨
	
	private String User_id;
	private String User_pw;
	private int Pw_Mistake_cnt;
	
	public String getUser_id() {
		return User_id;
	}
	public void setUser_id(String user_id) {
		User_id = user_id;
	}
	public String getUser_pw() {
		return User_pw;
	}
	public void setUser_pw(String user_pw) {
		User_pw = user_pw;
	}
	public int getPw_Mistake_cnt() {
		return Pw_Mistake_cnt;
	}
	public void setPw_Mistake_cnt(int pw_Mistake_cnt) {
		Pw_Mistake_cnt = pw_Mistake_cnt;
	}
	@Override
	public String toString() {
		return "LoginDTO [User_id=" + User_id + ", User_pw=" + User_pw + ","
				+ " Pw_Mistake_cnt=" + Pw_Mistake_cnt + "]";
	}
	
	
	
	
}
