package com.Final.Final1.comm.model;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.Final.Final1.mypage.model.MypageDTO;

@Repository // 구현할 메서드 찾아와줌
public class LoginDAOImpl implements LoginDAO{

	@Inject
	SqlSessionTemplate sqlSession;

	@Override
	public Map<String, Object> UserInfo_Chk(Map<String, Object> map) {
		return sqlSession.selectOne("login.UserInfo_Chk",map);
	}

	@Override
	public Map<String, Object> UserOnlyId_Chk(Map<String, Object> map) {
		return sqlSession.selectOne("login.UserOnlyId_Chk",map);
	}

	@Override
	public void Change_User_pw(Map<String, Object> map) {
		sqlSession.selectOne("login.Change_User_pw",map);
	}

	@Override
	public int Pw_Mistake_cnt(LoginDTO dto) {
		return sqlSession.selectOne("login.Pw_Mistake_cnt",dto);
	}
	
	@Override
	public int Pw_Mistake_cnt2(LoginDTO dto) {
		return sqlSession.selectOne("login.Pw_Mistake_cnt2",dto);
	}

	@Override
	public void Mistake_cnt_Up(LoginDTO dto) {
		sqlSession.selectOne("login.Mistake_cnt_Up",dto);
		
	}
	
	@Override
	public void Mistake_cnt_Up2(LoginDTO dto) {
		sqlSession.selectOne("login.Mistake_cnt_Up2",dto);
	}

	@Override
	public Map<String, Object> User_nickname_Chk(Map<String, Object> map) {
		return sqlSession.selectOne("login.User_nickname_Chk",map);
	}

	@Override
	public String UserEmailinfo(MypageDTO dto) {
		return sqlSession.selectOne("userinfo.UserEmailinfo",dto);
	}

	@Override
	public String UserEmailAndIDinfo(MypageDTO dto) {
		return sqlSession.selectOne("userinfo.UserEmailAndIDinfo",dto);
	}

	@Override
	public void activeInsert(MypageDTO mydto) {
		Map<String, Object> map = new HashMap<>();
		map.put("User_nickname",mydto.getUser_nickname());
		sqlSession.insert("login.activeInsert",map);
		
	}

	

	
	
	

}
