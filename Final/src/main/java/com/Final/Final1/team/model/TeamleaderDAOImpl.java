package com.Final.Final1.team.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeamleaderDAOImpl implements TeamleaderDAO {
	
	@Inject
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Map<String, Object> team_list(TeamlistDTO dto, String teamname) {
		
		Map<String, Object> map2  = new HashMap<>();
		map2.put("dto", dto);
		map2.put("teamname", teamname);
		
		return this.sqlSessionTemplate.selectOne("teamleader.team_notice", map2);
	}

	@Override
	public Map<String, Object> team_info(TeamMemberDTO dto2, String teamname) {
		Map<String, Object> map2  = new HashMap<>();
		map2.put("dto2", dto2);
		map2.put("teamname", teamname);
		
		return this.sqlSessionTemplate.selectOne("teamleader.team_info", map2);
	}

	@Override
	public List<Map<String, Object>> team_members(TeamMemberDTO dto2, String teamname) {
		Map<String, Object> map2  = new HashMap<>();
		map2.put("dto2", dto2);
		map2.put("teamname", teamname);
		
		return this.sqlSessionTemplate.selectList("teamleader.team_members", map2);
	}

	@Override
	public List<TeamlistDTO> teamnotice_correction(TeamlistDTO dto, String teamname, String teamnotice_correction) {
		Map<String, Object> map2  = new HashMap<>();
		map2.put("map", dto);
		map2.put("teamname", teamname);
		map2.put("teamnotice_correction", teamnotice_correction);
		
		return this.sqlSessionTemplate.selectOne("teamleader.teamnotice_correction", map2);
	}

	@Override
	public Map<String, Object> teamname_correction(TeamlistDTO dto, String teamname, String Team_name) {
		Map<String, Object> map2  = new HashMap<>();
		map2.put("dto", dto);
		map2.put("teamname", teamname);
		map2.put("Team_name", Team_name);
		
		return this.sqlSessionTemplate.selectOne("teamleader.teamname_correction", map2);
	}

	@Override
	public int teammember_delete(TeamMemberdelDTO dto) {
		return this.sqlSessionTemplate.update("teamleader.teammember_delete1", dto);
	}

	@Override
	public int teammember_delete2(TeamMemberdelDTO dto) {
		return this.sqlSessionTemplate.update("teamleader.teammember_delete2", dto);
	}

	@Override
	public List<Map<String, Object>> team_notmembers(TeamnotMemberDTO dto3, String teamname) {
		Map<String, Object> map2  = new HashMap<>();
		map2.put("dto", dto3);
		map2.put("teamname", teamname);
		
		return this.sqlSessionTemplate.selectList("teamleader.team_notmembers", map2);
	}

	@Override
	public String teamjoin_team(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("teamleader.teamjoin_team", map);
	}

	@Override
	public int teamjoin_accept(Map<String, Object> map) {
		return this.sqlSessionTemplate.update("teamleader.teamjoin_accept", map);
	}

	@Override
	public int teamjoininsert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("teamleader.teamjoininsert", map);
	}

	@Override
	public int teamnotmember_del(Map<String, Object> map) {
		return this.sqlSessionTemplate.delete("teamleader.teamnotmember_del", map);
	}

	@Override
	public int teamjoinrefuse(Map<String, Object> map) {
		return this.sqlSessionTemplate.delete("teamleader.teamjoinrefuse", map);
	}


}
