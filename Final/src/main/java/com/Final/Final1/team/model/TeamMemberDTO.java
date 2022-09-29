package com.Final.Final1.team.model;

public class TeamMemberDTO {
	
	private String User_nickname;
	private int User_score;
	private int commission;
	private String Email_address;
	
	
	
	public String getUser_nickname() {
		return User_nickname;
	}
	public void setUser_nickname(String User_nickname) {
		this.User_nickname = User_nickname;
	}
	public int getUser_score() {
		return User_score;
	}
	public void setUser_score(int User_score) {
		this.User_score = User_score;
	}
	public int getCommission() {
		return commission;
	}
	public void setCommission(int commission) {
		this.commission = commission;
	}
	public String getEmail_address() {
		return Email_address;
	}
	public void setEmail_address(String Email_address) {
		this.Email_address = Email_address;
	}
	
	
	
	@Override
	public String toString() {
		return "MypageDTO [User_nickname=" + User_nickname + ", User_score=" + User_score + ", commission=" + commission + ", Email_address="
				+Email_address + "]";
	}
	
}
