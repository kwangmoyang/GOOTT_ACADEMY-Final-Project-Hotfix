package com.Final.Final1.team.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeamlistDAOImpl implements TeamlistDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //root-context�� ����

	
	@Override
	public List<TeamlistDTO> list(Map<String, Object> map) {
		
		return sqlSessionTemplate.selectList("team.list", map);
	}

	@Override
	public List<Map<String, Object>> taglist(Map<String, Object> map) {	

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
	public Map<String, Object> teammakecheck(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("team.teammakecheck", map);
	}

	@Override
	public Map<String, Object> teammakecheck2(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("team.teammakecheck2", map);
	}

	@Override
	public int teammakeupdate(Map<String, Object> map) {
		return sqlSessionTemplate.update("team.teammakeupdate", map);
	}

	@Override
	public int teamsecession(Map<String, Object> map) {
		return sqlSessionTemplate.update("team.teamsecession", map);
	}
	
	@Override
	public int teamsecessiondelete(Map<String, Object> map) {
		return sqlSessionTemplate.update("team.teamsecessiondelete", map);
	}

	@Override
	public String teamsecession_teamleader(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("team.teamsecession_teamleader", map);
	}

	@Override
	public void teamsecession_teamleaderdelete(Map<String, Object> map) {
		sqlSessionTemplate.delete("team.teamsecession_teamleaderdelete", map);
	}

	@Override
	public Map<String, Object> teamjoin_team(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("team.teamjoin_team", map);
	}

	@Override
	public List<Map<String, Object>> teaminfo_notice(Map<String, Object> map) {

		return sqlSessionTemplate.selectList("team.teaminfo_notice", map);
	}

	@Override
	public List<Map<String, Object>> teaminfo_teamleader(Map<String, Object> map) {
		
		return sqlSessionTemplate.selectList("team.teaminfo_teamleader", map);
	}

	@Override
	public List<Map<String, Object>> teaminfo_members(Map<String, Object> map) {
		
		return sqlSessionTemplate.selectList("team.teaminfo_members", map);
	}
	// 팀 카운트
	@Override
	public int count(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("search_option", search_option);
		
		return sqlSessionTemplate.selectOne("team.count", map);
	}

	@Override
	public List<Map<String, Object>> teaminfo_int(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("team.teaminfo_int", map);
	}



	@Override
	public int teamjoinmessage(Map<String, Object> map) {
		return sqlSessionTemplate.insert("team.teamjoinmessage", map);
	}

	@Override
	public int taginsert(String maketeamname, String tagarray) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("maketeamname", maketeamname);
		map.put("tagarray", tagarray);
		
		return sqlSessionTemplate.insert("team.taginsert", map);
	}


}
