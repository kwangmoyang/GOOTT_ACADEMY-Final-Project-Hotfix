package com.Final.Final1.mypage.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.MyCommentListDTO;
import com.Final.Final1.board.model.MyWriterListDTO;
import com.Final.Final1.mypage.model.MypageDAO;
import com.Final.Final1.mypage.model.MypageDTO;
import com.Final.Final1.mypage.service.MypageService;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageDAO mypageDao;
	
	
	
	@Override
	public void UserSetNickname(MypageDTO dto) {
		mypageDao.UserSetNickname(dto);
		
	}


	@Override
	public void UserSetPhone_num(MypageDTO dto) {
		mypageDao.UserSetPhone_num(dto);
	}



	@Override
	public void UserSetEmail_address(MypageDTO dto) {
		mypageDao.UserSetEmail_address(dto);
	}



	@Override
	public void UserSetUser_pw(MypageDTO dto) {
		mypageDao.UserSetUser_pw(dto);
	}



	@Override
	public void UserSetUser_introduce(MypageDTO dto) {
		mypageDao.UserSetUser_introduce(dto);
	}


	@Override
	public int UserPoint(MypageDTO dto) {
		// TODO Auto-generated method stub
		return mypageDao.UserPoint(dto);
	}


	@Override
	public void UserDelete(String userid) {
		// TODO Auto-generated method stub
		mypageDao.UserDelete(userid);
	}
	@Override
	public List<BoardDTO> myRequestlist(MyWriterListDTO dto) {
		return mypageDao.myRequestlist(dto);
	}


	@Override
	public List<BoardDTO> myCommentlist(MyCommentListDTO dto) {
		return mypageDao.myCommentlist(dto);
	}




	
}
