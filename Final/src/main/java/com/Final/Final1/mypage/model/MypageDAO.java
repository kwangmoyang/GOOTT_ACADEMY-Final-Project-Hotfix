package com.Final.Final1.mypage.model;

import java.util.List;
import java.util.Map;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.MyCommentListDTO;
import com.Final.Final1.board.model.MyWriterListDTO;
import com.Final.Final1.comm.model.LoginDTO;

public interface MypageDAO {
	
	public int UserPoint(MypageDTO dto);
	
	public void UserSetNickname(MypageDTO dto);
	
	public void UserSetPhone_num(MypageDTO dto);
	public void UserSetEmail_address(MypageDTO dto);
	public void UserSetUser_pw(MypageDTO dto);
	public void UserSetUser_introduce(MypageDTO dto);


	public void UserDelete(String userid);

	public List<BoardDTO> myRequestlist(MyWriterListDTO dto);

	public List<BoardDTO> myCommentlist(MyCommentListDTO dto);

	public int count(String keyword);

//	void insert(MypageDTO dto);
	
	void updateUserPhoto(MypageDTO dto);
	
	public String UserPhotoView(MypageDTO dto);
	
	public void UserContactSet(MypageDTO dto);

	
}
