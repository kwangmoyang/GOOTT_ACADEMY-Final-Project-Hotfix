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
	public List<TeamlistDTO> list(Map<String, Object> map, String search_option, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map1 = new HashMap<>();
		map1.put("keyword", keyword);
		map1.put("search_option", search_option);
		map1.put("start", start);
		map1.put("end", end);
		return sqlSessionTemplate.selectList("team.list", map1);
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



	
	@Override
	public Map<String, Object> teammakecheck3(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("team.teammakecheck3", map);
	}

	//팀탈퇴 추가

	@Override
	public List<Map<String, Object>> if_Teammember(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("team.if_Teammember", map);
	}


	@Override
	public int Teamleader_update(Map<String, Object> map) {
		return sqlSessionTemplate.update("team.Teamleader_update", map);
	}




	@Override
	public Map<String, Object> Teamleader_candidate(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("team.Teamleader_candidate", map);
	}




	@Override
	public int Teamleader_update2(Map<String, Object> map, Map<String, Object> teamleader_candidate) {
		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("map",map);
		map2.put("teamleader_candidate",teamleader_candidate);
		
		System.out.println("Teamleader_update2dao"+map);
		System.out.println("Teamleader_update2dao"+teamleader_candidate);
		
		return sqlSessionTemplate.update("team.Teamleader_update2", map2);
	}




	@Override
	public int Teammember_candidate_delete(Map<String, Object> teamleader_candidate) {
		return sqlSessionTemplate.delete("team.Teammember_candidate_delete", teamleader_candidate);
	}




	@Override
	public int Teamcandidate_teamleader(Map<String, Object> map, Map<String, Object> teamleader_candidate) {
		Map<String, Object> map2 = new HashMap<>();
		map2.put("map",map);
		map2.put("teamleader_candidate",teamleader_candidate);
		
		return sqlSessionTemplate.update("team.Teamcandidate_teamleader", map2);
	}


}
