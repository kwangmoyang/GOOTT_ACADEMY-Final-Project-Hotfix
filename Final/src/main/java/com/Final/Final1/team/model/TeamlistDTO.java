package com.Final.Final1.team.model;

public class TeamlistDTO {
	
	private int Team_code;
	private String Team_name;
	private String Team_notice;
	private int Team_avgScore;
	private int Team_sol_count;
	private String Team_leader;
	private String Team_member;
	
	
	
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


	public String getTeam_leader() {
		return Team_leader;
	}


	public void setTeam_leader(String Team_leader) {
		this.Team_leader = Team_leader;
	}


	public String getTeam_member() {
		return Team_member;
	}


	public void setTeam_member(String Team_member) {
		this.Team_member = Team_member;
	}
	
	@Override
	public String toString() {
		return "TeamlistDTO [Team_code=" +Team_code+ ", Team_name="+Team_name+",Team_notice="+Team_notice+
				",Team_avgScore="+Team_avgScore+",Team_sol_count="+Team_sol_count+",Team_leader="+Team_leader+
				",Team_member="+Team_member+
				"]";
	}
}

