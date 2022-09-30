package com.Final.Final1.team.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeamleaderDAOImpl implements TeamleaderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Map<String, Object> team_list(TeamlistDTO dto, String teamname) {
		
		Map<String, Object> map2  = new HashMap<>();
		map2.put("dto", dto);
		map2.put("teamname", teamname);
		
		return this.sqlSessionTemplate.selectOne("teamleader.team_list", map2);
	}

}
