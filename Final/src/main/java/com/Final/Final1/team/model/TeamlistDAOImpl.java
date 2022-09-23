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
	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("team.insert", map);
	}

	@Override
	public List<TeamlistDTO> list(Map<String, Object> map, String search_option, String keyword) {
		
		System.out.println("listdao"+map.toString());
		System.out.println("listdao"+search_option);		
		System.out.println("listdao"+keyword);
		
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
	public List<Map<String, Object>> click_taglist(Map<String, Object> map, String tagname) {
		System.out.println("taglistdao"+map.toString());
		System.out.println("taglistdao"+tagname);		
		
//		Map<String, Object> map2 = new HashMap<>();
//		map2.put("map", map);
//		map2.put("tagname", tagname);

		
		return sqlSessionTemplate.selectList("team.click_taglist", map);
	}



}
