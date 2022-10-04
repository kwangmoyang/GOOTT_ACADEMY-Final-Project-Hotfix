package com.Final.Final1.mypage.service;

import java.util.List;
import java.util.Map;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.MyCommentListDTO;
import com.Final.Final1.board.model.MyWriterListDTO;
import com.Final.Final1.comm.model.LoginDTO;
import com.Final.Final1.mypage.model.MypageDTO;

public interface MypageService {
	
	public int UserPoint(MypageDTO dto);
	
	public void UserSetNickname(MypageDTO dto);
	
	
	public void UserSetPhone_num(MypageDTO dto);
	public void UserSetEmail_address(MypageDTO dto);
	public void UserSetUser_pw(MypageDTO dto);
	public void UserSetUser_introduce(MypageDTO dto);


	public void UserDelete(String userid);

	public List<BoardDTO> myRequestlist(MyWriterListDTO dto, int start, int end);

	public List<BoardDTO> myCommentlist(MyCommentListDTO dto, int start, int end);

	public int count(MyWriterListDTO dto);

	public int commentCount(MyCommentListDTO dto);

//	void insert(MypageDTO dto);
	
	
	void updateUserPhoto(MypageDTO dto);
	
	public String UserPhotoView(MypageDTO dto);
	
	public void UserContactSet(MypageDTO dto);

	public void myBoardDelete(int boardDeleteMsg);

	public void myCommentDelete(int boardDeleteMsg);


	
	
	
}
