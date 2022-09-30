package com.Final.Final1.admin.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {


	@Inject
	SqlSessionTemplate sqlsession;
	
	@Override
	public List<Map<String, Object>> adminMemList(Map<String, Object> map) {
		return sqlsession.selectList("admin.list",map);
	}

	@Override
	public int userCount(AdminDTO dto) {
		return sqlsession.selectOne("admin.userCount", dto);
	}

}

