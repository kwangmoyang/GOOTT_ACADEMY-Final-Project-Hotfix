package com.Final.Final1.board.model;

import java.util.Date;

public class HotfixDTO {

	
	private int Request_code;
	private String Requester;
	private String Request_title;
	private String Request_contents;
	private int SolverReady_cnt;
	private int Commission;
	private String User_nickname;
	
	private String Solver_member;
	private int Solver_appli_code;
	
	public int getSolver_appli_code() {
		return Solver_appli_code;
	}
	public void setSolver_appli_code(int solver_appli_code) {
		Solver_appli_code = solver_appli_code;
	}
	public String getSolver_member() {
		return Solver_member;
	}
	public void setSolver_member(String solver_member) {
		Solver_member = solver_member;
	}
	public String getUser_nickname() {
		return User_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		User_nickname = user_nickname;
	}
	public int getRequest_code() {
		return Request_code;
	}
	public void setRequest_code(int request_code) {
		Request_code = request_code;
	}
	private Date Recruiting_time;
	
	public String getRequester() {
		return Requester;
	}
	public void setRequester(String requester) {
		Requester = requester;
	}
	public String getRequest_title() {
		return Request_title;
	}
	public void setRequest_title(String request_title) {
		Request_title = request_title;
	}
	public String getRequest_contents() {
		return Request_contents;
	}
	public void setRequest_contents(String request_contents) {
		Request_contents = request_contents;
	}
	public int getSolverReady_cnt() {
		return SolverReady_cnt;
	}
	public void setSolverReady_cnt(int solverReady_cnt) {
		SolverReady_cnt = solverReady_cnt;
	}
	public int getCommission() {
		return Commission;
	}
	public void setCommission(int commission) {
		Commission = commission;
	}
	public Date getRecruiting_time() {
		return Recruiting_time;
	}
	public void setRecruiting_time(Date recruiting_time) {
		Recruiting_time = recruiting_time;
	}
	@Override
	public String toString() {
		return "HotfixDTO [Requester=" + Requester + ", Request_title=" + Request_title + ", Request_contents="
				+ Request_contents + ", SolverReady_cnt=" + SolverReady_cnt + ", Commission=" + Commission
				+ ", Recruiting_time=" + Recruiting_time + "]";
	}
	
	
	
	
}
