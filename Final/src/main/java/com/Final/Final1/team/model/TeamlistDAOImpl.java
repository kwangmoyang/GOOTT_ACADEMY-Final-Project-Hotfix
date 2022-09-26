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
		System.out.println("list"+map.toString());
		System.out.println("list"+search_option);		
		System.out.println("list"+keyword);
		
		
		return sqlSessionTemplate.selectList("team.list", map);
	}

	@Override
	public List<Map<String, Object>> taglist(Map<String, Object> map, String search_option, String keyword) {
		System.out.println("taglistdao"+map.toString());
		System.out.println("taglistdao"+search_option);		
		System.out.println("taglistdao"+keyword);
	

		return sqlSessionTemplate.selectList("team.taglist", map);
	}

	@Override
	public List<TeamlistDTO> tagsearchlist(Map<String, Object> map, String search_option, String keyword) {
		
		System.out.println("searchlist"+map.toString());
		System.out.println("searchlist"+search_option);		
		System.out.println("searchlist"+keyword);
		
		
		return sqlSessionTemplate.selectList("team.tagsearchlist", map);
	}

	@Override
	public int teammake(Map<String, Object> map) {
		return sqlSessionTemplate.insert("team.teammake", map);
	}

	@Override
	public List<Map<String, Object>> tags(Map<String, Object> map) {
		System.out.println("tags");
		return sqlSessionTemplate.selectList("team.tags", map);
	}




}
