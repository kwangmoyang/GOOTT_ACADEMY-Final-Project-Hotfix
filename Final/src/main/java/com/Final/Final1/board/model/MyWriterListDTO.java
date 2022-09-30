package com.Final.Final1.board.model;

import java.util.Date;

public class MyWriterListDTO {

	private int Post_num;
	private String Board_code;
	private String Post_writer;
	private String Post_title;
	private String Post_contents;
	private int Post_view;
	private int Post_like;
	private Date Post_cr_date;
	private Date Post_up_date;
	private Date Post_de_date;
	private int Post_status;
	
	
	//검색키워드
	private String keyword;
	//최신순, 커미션순
	private String select;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public int getPost_num() {
		return Post_num;
	}
	public void setPost_num(int post_num) {
		Post_num = post_num;
	}
	public String getBoard_code() {
		return Board_code;
	}
	public void setBoard_code(String board_code) {
		Board_code = board_code;
	}
	public String getPost_writer() {
		return Post_writer;
	}
	public void setPost_writer(String post_writer) {
		Post_writer = post_writer;
	}
	public String getPost_title() {
		return Post_title;
	}
	public void setPost_title(String post_title) {
		Post_title = post_title;
	}
	public String getPost_contents() {
		return Post_contents;
	}
	public void setPost_contents(String post_contents) {
		Post_contents = post_contents;
	}
	public int getPost_view() {
		return Post_view;
	}
	public void setPost_view(int post_view) {
		Post_view = post_view;
	}
	public int getPost_like() {
		return Post_like;
	}
	public void setPost_like(int post_like) {
		Post_like = post_like;
	}
	public Date getPost_cr_date() {
		return Post_cr_date;
	}
	public void setPost_cr_date(Date post_cr_date) {
		Post_cr_date = post_cr_date;
	}
	public Date getPost_up_date() {
		return Post_up_date;
	}
	public void setPost_up_date(Date post_up_date) {
		Post_up_date = post_up_date;
	}
	public Date getPost_de_date() {
		return Post_de_date;
	}
	public void setPost_de_date(Date post_de_date) {
		Post_de_date = post_de_date;
	}
	public int getPost_status() {
		return Post_status;
	}
	public void setPost_status(int post_status) {
		Post_status = post_status;
	}
	@Override
	public String toString() {
		return "MyWriterListDTO [Post_num=" + Post_num + ", Board_code=" + Board_code + ", Post_writer=" + Post_writer
				+ ", Post_title=" + Post_title + ", Post_contents=" + Post_contents + ", Post_view=" + Post_view
				+ ", Post_like=" + Post_like + ", Post_cr_date=" + Post_cr_date + ", Post_up_date=" + Post_up_date
				+ ", Post_de_date=" + Post_de_date + ", Post_status=" + Post_status + "]";
	}
	
	
	
}
