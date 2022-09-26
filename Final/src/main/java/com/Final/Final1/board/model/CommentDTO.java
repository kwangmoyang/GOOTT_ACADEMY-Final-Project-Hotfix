package com.Final.Final1.board.model;

import java.util.Date;

public class CommentDTO {
	int Comment_code;
	int Post_num;
	String Comment_writer;
	String Comment_contents;
	int Comment_like;
	Date Comment_cr_date;
	Date Comment_up_date;
	Date Comment_de_date;
	int Comment_status;
	int Att_Comment;
	public int getComment_code() {
		return Comment_code;
	}
	public void setComment_code(int comment_code) {
		this.Comment_code = comment_code;
	}
	public int getPost_num() {
		return Post_num;
	}
	public void setPost_num(int Post_num) {
		this.Post_num = Post_num;
	}
	public String getComment_writer() {
		return Comment_writer;
	}
	public void setComment_writer(String comment_writer) {
		this.Comment_writer = comment_writer;
	}
	public String getComment_contents() {
		return Comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		this.Comment_contents = comment_contents;
	}
	public int getComment_like() {
		return Comment_like;
	}
	public void setComment_like(int comment_like) {
		this.Comment_like = comment_like;
	}
	public Date getComment_cr_date() {
		return Comment_cr_date;
	}
	public void setComment_cr_date(Date comment_cr_date) {
		this.Comment_cr_date = comment_cr_date;
	}
	public Date getComment_up_date() {
		return Comment_up_date;
	}
	public void setComment_up_date(Date comment_up_date) {
		this.Comment_up_date = comment_up_date;
	}
	public Date getComment_de_date() {
		return Comment_de_date;
	}
	public void setComment_de_date(Date comment_de_date) {
		this.Comment_de_date = comment_de_date;
	}
	public int getComment_status() {
		return Comment_status;
	}
	public void setComment_status(int comment_status) {
		this.Comment_status = comment_status;
	}
	public int getAtt_Comment() {
		return Att_Comment;
	}
	public void setAtt_Comment(int att_Comment) {
		this.Att_Comment = att_Comment;
	}
	
	
	@Override
	public String toString() {
		return "CommentDTO [Comment_code=" + Comment_code + ", Post_num=" + Post_num + ", Comment_writer="
				+ Comment_writer + ", Comment_contents=" + Comment_contents + ", Comment_like=" + Comment_like
				+ ", Comment_cr_date=" + Comment_cr_date + ", Comment_up_date=" + Comment_up_date + ", Comment_de_date="
				+ Comment_de_date + ", Comment_status=" + Comment_status + ", Att_Comment=" + Att_Comment + "]";
	}
	
	
}




