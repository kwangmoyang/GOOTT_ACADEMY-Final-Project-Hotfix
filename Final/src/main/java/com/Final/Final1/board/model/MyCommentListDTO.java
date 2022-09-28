package com.Final.Final1.board.model;

import java.util.Date;

public class MyCommentListDTO {
	
	private int Comment_code;
	private int Post_num;
	private String Comment_writer;
	private String Comment_contents;
	private int Comment_like;
	private Date Comment_up_date;
	private Date Comment_cr_date;
	private int Comment_status;
	private int Att_Comment;
	
	
	public int getComment_code() {
		return Comment_code;
	}
	public void setComment_code(int comment_code) {
		Comment_code = comment_code;
	}
	public int getPost_num() {
		return Post_num;
	}
	public void setPost_num(int post_num) {
		Post_num = post_num;
	}
	public String getComment_writer() {
		return Comment_writer;
	}
	public void setComment_writer(String comment_writer) {
		Comment_writer = comment_writer;
	}
	public String getComment_contents() {
		return Comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		Comment_contents = comment_contents;
	}
	public int getComment_like() {
		return Comment_like;
	}
	public void setComment_like(int comment_like) {
		Comment_like = comment_like;
	}
	public Date getComment_up_date() {
		return Comment_up_date;
	}
	public void setComment_up_date(Date comment_up_date) {
		Comment_up_date = comment_up_date;
	}
	public Date getComment_cr_date() {
		return Comment_cr_date;
	}
	public void setComment_cr_date(Date comment_cr_date) {
		Comment_cr_date = comment_cr_date;
	}
	public int getComment_status() {
		return Comment_status;
	}
	public void setComment_status(int comment_status) {
		Comment_status = comment_status;
	}
	public int getAtt_Comment() {
		return Att_Comment;
	}
	public void setAtt_Comment(int att_Comment) {
		Att_Comment = att_Comment;
	}
	@Override
	public String toString() {
		return "MyCommentListDTO [Comment_code=" + Comment_code + ", Post_num=" + Post_num + ", Comment_writer="
				+ Comment_writer + ", Comment_contents=" + Comment_contents + ", Comment_like=" + Comment_like
				+ ", Comment_up_date=" + Comment_up_date + ", Comment_cr_date=" + Comment_cr_date + ", Comment_status="
				+ Comment_status + ", Att_Comment=" + Att_Comment + "]";
	}
	
	
}
