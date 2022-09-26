package com.Final.Final1.board.model;

public class HotfixDTO {
//	(Requester,Request_title, Request_contents, 
//			ReadySolver_cnt, Commission, Recruiting_time)
	private String Requester;
	private String Request_title;
	private String Request_contents;
	private int ReadySolver_cnt;
	private int Commission;
	private int Recruiting_time;
	
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
	public int getReadySolver_cnt() {
		return ReadySolver_cnt;
	}
	public void setReadySolver_cnt(int readySolver_cnt) {
		ReadySolver_cnt = readySolver_cnt;
	}
	public int getCommission() {
		return Commission;
	}
	public void setCommission(int commission) {
		Commission = commission;
	}
	public int getRecruiting_time() {
		return Recruiting_time;
	}
	public void setRecruiting_time(int recruiting_time) {
		Recruiting_time = recruiting_time;
	}
	@Override
	public String toString() {
		return "HotfixDTO [Requester=" + Requester + ", Request_title=" + Request_title + ", Request_contents="
				+ Request_contents + ", ReadySolver_cnt=" + ReadySolver_cnt + ", Commission=" + Commission
				+ ", Recruiting_time=" + Recruiting_time + "]";
	}
	
	
	
	
}
