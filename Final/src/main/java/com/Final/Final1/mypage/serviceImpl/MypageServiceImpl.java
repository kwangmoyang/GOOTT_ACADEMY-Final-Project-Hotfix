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
	public List<MypageDTO> Userinfo(MypageDTO dto) {
		return mypageDao.Userinfo(dto);
	}
	
	
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
	public List<BoardDTO> myRequestlist(MyWriterListDTO dto, int start, int end) {
		return mypageDao.myRequestlist(dto, start, end);
	}


	@Override
	public List<BoardDTO> myCommentlist(MyCommentListDTO dto, int start, int end) {
		return mypageDao.myCommentlist(dto, start, end);
	}


	@Override
	public int count(MyWriterListDTO dto) {
		// TODO Auto-generated method stub
		return mypageDao.count(dto);
	}

	// 마이페이지 댓글 
	@Override
	public int commentCount(MyCommentListDTO dto) {
		// TODO Auto-generated method stub
		return mypageDao.commentCount(dto);
	}


//	@Override
//	public void insert(MypageDTO dto) {
//		mypageDao.insert(dto);
//	}


	@Override
	public void updateUserPhoto(MypageDTO dto) {
		mypageDao.updateUserPhoto(dto);
	}


	@Override
	public String UserPhotoView(MypageDTO dto) {
		return mypageDao.UserPhotoView(dto);
	}


	@Override
	public void UserContactSet(MypageDTO dto) {
		mypageDao.UserSetUser_introduce(dto);
	}


	@Override
	public Map<String, Object> mypageUserinfo(String User_nickname) {
		return mypageDao.mypageUserinfo(User_nickname);
  }  
	public void myBoardDelete(int no) {
		mypageDao.myBoardDelete(no);
	}
	


	@Override
	public String teamnotmember_select(String User_nickname) {
		return mypageDao.teamnotmember_select(User_nickname);
	}


	@Override
	public void teamnotmember_delete(String User_nickname) {
		mypageDao.teamnotmember_delete(User_nickname);
		
	}

	public void myCommentDelete(int no) {
		mypageDao.myCommentDelete(no);
		
	}

	public int UserReq_cnt(MypageDTO dto) {
		return mypageDao.UserReq_cnt(dto);
	}
	@Override
	public int UserSol_cnt(MypageDTO dto) {
		return mypageDao.UserSol_cnt(dto);
	}
	@Override
	public int UserDrop_Req_cnt(MypageDTO dto) {
		return mypageDao.UserDrop_Req_cnt(dto);
	}
	@Override
	public int UserDrop_Sol_cnt(MypageDTO dto) {
		return mypageDao.UserDrop_Sol_cnt(dto);
	}


	

	




	
}
