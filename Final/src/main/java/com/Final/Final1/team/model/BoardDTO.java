package com.Final.Final1.team.model;

import java.util.Date;

public class BoardDTO {
	private int Board_code;
	private String Board_name;
	private String Post_writer;
	private int Post_num;
	private String Post_content;
	private int Post_like;
	private Date Post_cr_date;
	private Date Post_up_date;
	private Date Post_de_date;
	private int User_code;
	private int Post_hit;
	private String Post_tag;
	
	
	public int getBoard_code() {
		return Board_code;
	}
	public void setBoard_code(int board_code) {
		Board_code = board_code;
	}
	public String getBoard_name() {
		return Board_name;
	}
	public void setBoard_name(String board_name) {
		Board_name = board_name;
	}
	public String getPost_writer() {
		return Post_writer;
	}
	public void setPost_writer(String post_writer) {
		Post_writer = post_writer;
	}
	public int getPost_num() {
		return Post_num;
	}
	public void setPost_num(int post_num) {
		Post_num = post_num;
	}
	public String getPost_content() {
		return Post_content;
	}
	public void setPost_content(String post_content) {
		Post_content = post_content;
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
	public int getUser_code() {
		return User_code;
	}
	public void setUser_code(int user_code) {
		User_code = user_code;
	}
	public int getPost_hit() {
		return Post_hit;
	}
	public void setPost_hit(int post_hit) {
		Post_hit = post_hit;
	}
	public String getPost_tag() {
		return Post_tag;
	}
	public void setPost_tag(String post_tag) {
		Post_tag = post_tag;
	}
	
}

