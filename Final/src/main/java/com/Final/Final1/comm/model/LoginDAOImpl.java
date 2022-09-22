package com.Final.Final1.comm.model;

import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository // 구현할 메서드 찾아와줌
public class LoginDAOImpl implements LoginDAO{

	@Inject
	SqlSessionTemplate sqlSession;

	@Override
	public String UserInfo_Chk(Map<String, Object> map) {
		return sqlSession.selectOne("UserInfo_Chk",map);
	}

	@Override
	public String UserOnlyId_Chk(Map<String, Object> map) {
		return sqlSession.selectOne("UserOnlyId_Chk",map);
	}

	@Override
	public void Change_User_pw(Map<String, Object> map) {
		sqlSession.selectOne("Change_User_pw",map);
	}

	@Override
	public int Pw_Mistake_cnt(Map<String, Object> map) {
		return sqlSession.selectOne("Pw_Mistake_cnt",map);
	}

	@Override
	public void Mistake_cnt_Up(LoginDTO dto) {
		sqlSession.selectOne("Mistake_cnt_Up",dto);
		
	}
	
	

}
