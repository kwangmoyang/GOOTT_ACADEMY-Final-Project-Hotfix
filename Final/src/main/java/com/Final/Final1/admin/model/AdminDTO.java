package com.Final.Final1.admin.model;

import java.util.Date;

public class AdminDTO {
	
	private String User_name;
	private String User_id;
	private String User_nickname;
	private String Email_address;
	private String Phone_num;
	private Date SignDate;
	private int User_score;
	
	private int userCount;
	
	
	
	
	public int getUserCount() {
		return userCount;
	}
	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}
	
	
	public String getUser_name() {
		return User_name;
	}
	public void setUser_name(String user_name) {
		User_name = user_name;
	}
	public String getUser_id() {
		return User_id;
	}
	public void setUser_id(String user_id) {
		User_id = user_id;
	}
	public String getUser_nickname() {
		return User_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		User_nickname = user_nickname;
	}
	public String getEmail_address() {
		return Email_address;
	}
	public void setEmail_address(String email_address) {
		Email_address = email_address;
	}
	public String getPhone_num() {
		return Phone_num;
	}
	public void setPhone_num(String phone_num) {
		Phone_num = phone_num;
	}
	public Date getSignDate() {
		return SignDate;
	}
	public void setSignDate(Date signDate) {
		SignDate = signDate;
	}
	public int getUser_score() {
		return User_score;
	}
	public void setUser_score(int user_score) {
		User_score = user_score;
	}
	
	@Override
	public String toString() {
		return "AdminDTO [User_name="+User_name+", User_id="+User_id+", User_nickname="+User_nickname+""
				+ ", Email_address="+Email_address+", Phone_num="+Phone_num+", SignDate="+SignDate+", User_score="+User_score+"]";
	}
	
	

}


