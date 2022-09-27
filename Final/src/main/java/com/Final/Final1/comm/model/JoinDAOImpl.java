package com.Final.Final1.comm.model;

import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAOImpl implements JoinDAO {
	
	@Inject
	SqlSessionTemplate sqlSession;


	@Override
	public void join(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("join.join", map);
	}
	

}
