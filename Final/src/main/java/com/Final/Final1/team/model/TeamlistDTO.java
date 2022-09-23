package com.Final.Final1.team.model;

import java.util.Date;

public class TeamlistDTO {
	
	private int Team_code;
	private String Team_name;
	private String Team_notice;
	private int Team_avgScore;
	private int Team_sol_count;
	private int Team_agreeChk;
	private String Team_intro;
	private Date Team_cr_date;
	private String Att_Team;
	

	public int getTeam_code() {
		return Team_code;
	}




	public void setTeam_code(int Team_code) {
		this.Team_code = Team_code;
	}




	public String getTeam_name() {
		return Team_name;
	}




	public void setTeam_name(String Team_name) {
		this.Team_name = Team_name;
	}




	public String getTeam_notice() {
		return Team_notice;
	}




	public void setTeam_notice(String Team_notice) {
		this.Team_notice = Team_notice;
	}




	public int getTeam_avgScore() {
		return Team_avgScore;
	}




	public void setTeam_avgScore(int Team_avgScore) {
		this.Team_avgScore = Team_avgScore;
	}




	public int getTeam_sol_count() {
		return Team_sol_count;
	}




	public void setTeam_sol_count(int Team_sol_count) {
		this.Team_sol_count = Team_sol_count;
	}




	public int getTeam_agreeChk() {
		return Team_agreeChk;
	}




	public void setTeam_agreeChk(int Team_agreeChk) {
		this.Team_agreeChk = Team_agreeChk;
	}




	public String getTeam_intro() {
		return Team_intro;
	}




	public void setTeam_intro(String Team_intro) {
		this.Team_intro = Team_intro;
	}




	public Date getTeam_cr_date() {
		return Team_cr_date;
	}




	public void setTeam_cr_date(Date Team_cr_date) {
		this.Team_cr_date = Team_cr_date;
	}




	public String getAtt_Team() {
		return Att_Team;
	}



	public void setAtt_Team(String Att_Team) {
		this.Att_Team = Att_Team;
	}
	
	
	@Override
	public String toString() {
		return "TeamlistDTO [Team_code=" +Team_code+ ", Team_name="+Team_name+",Team_notice="+Team_notice+
				",Team_avgScore="+Team_avgScore+",Team_sol_count="+Team_sol_count+",Team_agreeChk="+Team_agreeChk+
				",Team_intro="+Team_intro+",Team_cr_date="+Team_cr_date+",Att_Team="+Att_Team+
				"]";
	}
}

