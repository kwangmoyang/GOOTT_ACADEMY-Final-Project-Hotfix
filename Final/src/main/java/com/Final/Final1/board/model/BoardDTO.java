package com.Final.Final1.board.model;

import java.util.Date;

import javax.swing.text.StyledEditorKit.BoldAction;

public class BoardDTO {
	
	
	private String Board_code;
	private int Post_num;
	private String Post_writer;
	private String Post_title;
	private String Post_contents;
	private int Post_view;
	private Date Post_cr_date;
	private Date Post_up_date;
	private Date Post_de_date;
	private int Post_status;
	private int Att_Board;
	private String Tags_Board;
	
	public String getBoard_code() {
		return Board_code;
	}
	public void setBoard_code(String board_code) {
		Board_code = board_code;
	}
	public int getPost_num() {
		return Post_num;
	}
	public void setPost_num(int post_num) {
		Post_num = post_num;
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
	public int getAtt_Board() {
		return Att_Board;
	}
	public void setAtt_Board(int att_Board) {
		Att_Board = att_Board;
	}
	public String getTags_Board() {
		return Tags_Board;
	}
	public void setTags_Board(String tags_Board) {
		Tags_Board = tags_Board;
	}
	
	
	
}
	
