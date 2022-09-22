package com.Final.Final1.team.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeamlistDAOImpl implements TeamlistDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //root-context¿Í ¿¬°á

	@Override
	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("hotfix.insert", map);
	}

	@Override
	public List<TeamlistDTO> list(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("hotfix.list", map);
	}

	public List<TeamlistDTO> taglist(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("hotfix.taglist", map);
	}



}
