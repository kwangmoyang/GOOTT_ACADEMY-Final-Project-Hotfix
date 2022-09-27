package com.Final.Final1.comm.model;

public class JoinDTO {
	
	private String User_id;
	private String User_pw;
	private String Email_address; 
	private String User_name; 
	private String User_nickname;
	private String Phone_num;
	
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
	public String getEmail_address() {
		return Email_address;
	}
	public void setEmail_address(String email_address) {
		Email_address = email_address;
	}
	public String getUser_name() {
		return User_name;
	}
	public void setUser_name(String user_name) {
		User_name = user_name;
	}
	public String getUser_nickname() {
		return User_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		User_nickname = user_nickname;
	}
	public String getPhone_num() {
		return Phone_num;
	}
	public void setPhone_num(String phone_num) {
		Phone_num = phone_num;
	}
	
	@Override
	public String toString() {
		return "JoinDTO [User_id="+User_id+", User_pw="+User_pw+", Email_address="+Email_address+""
				+ ",User_name="+User_name+", User_nickname="+User_nickname+", Phone_num="+Phone_num+"]";
	}

}
