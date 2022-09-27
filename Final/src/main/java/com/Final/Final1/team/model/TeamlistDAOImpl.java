package com.Final.Final1.team.model;

import java.util.HashMap;
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
	public List<TeamlistDTO> list(Map<String, Object> map, String search_option, String keyword) {

		return sqlSessionTemplate.selectList("team.list", map);
	}

	@Override
	public List<Map<String, Object>> taglist(Map<String, Object> map, String search_option, String keyword) {	

		return sqlSessionTemplate.selectList("team.taglist", map);
	}

	@Override
	public int teammake(Map<String, Object> map) {
		
		return sqlSessionTemplate.insert("team.teammake", map);
	}

	@Override
	public List<Map<String, Object>> tags(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("team.tags", map);
	}

	@Override
	public int teamjoin(Map<String, Object> map) {
		System.out.println(map.toString());
		return sqlSessionTemplate.update("team.teamjoin", map);
	}

	@Override
	public Map<String, Object> teammakecheck(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("team.teammakecheck", map);
	}


}
