package com.Final.Final1.ranking.model;

public class RankingDTO {
	
	private int rowNum;
	private String Team_name; //팀이름
	private String User_nickname; //유저이름
	private int User_score; //유저 활동점수
	private int commission; //유저 커미션
	private int Team_AVG; //팀 활동점수
	private int Team_SUM; //팀 커미션
	
	
	
	
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public String getTeam_name() {
		return Team_name;
	}
	public void setTeam_name(String Team_name) {
		this.Team_name = Team_name;
	}
	public String getUser_nickname() {
		return User_nickname;
	}
	public void setUser_nickname(String User_nickname) {
		this.User_nickname = User_nickname;
	}
	public int getTeam_AVG() {
		return Team_AVG;
	}
	public void setTeam_AVG(int Team_AVG) {
		this.Team_AVG = Team_AVG;
	}
	public int getTeam_SUM() {
		return Team_SUM;
	}
	public void setTeam_SUM(int Team_SUM) {
		this.Team_SUM = Team_SUM;
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
	
	
	
	@Override
	public String toString() {
		return "RankingDTO [rowNum=" +rowNum+ ", Team_name="+Team_name+",User_nickname="+User_nickname+
				",User_score="+User_score+",commission="+commission+",Team_AVG="+Team_AVG+
				",Team_SUM="+Team_SUM+"]";
	}
	
	
	
}
