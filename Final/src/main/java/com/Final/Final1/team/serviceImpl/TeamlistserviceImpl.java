package com.Final.Final1.team.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.team.model.TeamMemberDTO;
import com.Final.Final1.team.model.TeamlistDAO;
import com.Final.Final1.team.model.TeamlistDAOImpl;
import com.Final.Final1.team.model.TeamlistDTO;
import com.Final.Final1.team.service.Teamlistservice;



@Service
public class TeamlistserviceImpl implements Teamlistservice {
	@Autowired
	TeamlistDAO teamlistdao;

	@Override
	public List<TeamlistDTO> list(Map<String, Object> map, String search_option, String keyword, int start, int end) {
		return teamlistdao.list(map, search_option,keyword,start,end);
	}
	
	

	@Override
	public List<Map<String, Object>> taglist(Map<String, Object> map) {
		return this.teamlistdao.taglist(map);
	}

	@Override
	public int teammake(Map<String, Object> map) {
		return this.teamlistdao.teammake(map);
	}

	@Override
	public List<Map<String, Object>> tags(Map<String, Object> map) {
		return this.teamlistdao.tags(map);
	}

	@Override
	public Map<String, Object> teammakecheck(Map<String, Object> map) {
		return this.teamlistdao.teammakecheck(map);
	}

	@Override
	public Map<String, Object> teammakecheck2(Map<String, Object> map) {
		return this.teamlistdao.teammakecheck2(map);
	}

	@Override
	public int teammakeupdate(Map<String, Object> map) {
		return this.teamlistdao.teammakeupdate(map);
	}

	@Override
	public int teamsecession(Map<String, Object> map) {
		return this.teamlistdao.teamsecession(map);
	}

	@Override
	public int teamsecessiondelete(Map<String, Object> map) {
		return this.teamlistdao.teamsecessiondelete(map);
	}

	@Override
	public String teamsecession_teamleader(Map<String, Object> map) {
		return this.teamlistdao.teamsecession_teamleader(map);
	}

	@Override
	public void teamsecession_teamleaderdelete(Map<String, Object> map) {
		this.teamlistdao.teamsecession_teamleaderdelete(map);
	}

	@Override
	public List<Map<String, Object>> teaminfo_notice(Map<String, Object> map) {
		return this.teamlistdao.teaminfo_notice(map);
	}

	@Override
	public List<Map<String, Object>> teaminfo_teamleader(Map<String, Object> map) {
		return this.teamlistdao.teaminfo_teamleader(map);
	}

	@Override
	public List<Map<String, Object>> teaminfo_members(Map<String, Object> map) {
		return this.teamlistdao.teaminfo_members(map);
	}
	// 팀 카운트
	@Override
	public int count(String search_option, String keyword) {
		return teamlistdao.count(search_option ,keyword);
  }

	@Override
	public List<Map<String, Object>> teaminfo_int(Map<String, Object> map) {
		return this.teamlistdao.teaminfo_int(map);
	}

	@Override
	public int teamjoinmessage(Map<String, Object> map) {
		return this.teamlistdao.teamjoinmessage(map);
	}

	@Override
	public Map<String, Object> teamjoin_team(Map<String, Object> map) {
		return this.teamlistdao.teamjoin_team(map);
	}

	@Override
	public int taginsert(String maketeamname, String tagarray) {
		return this.teamlistdao.taginsert(maketeamname, tagarray);
	}



	@Override
	public Map<String, Object> teammakecheck3(Map<String, Object> map) {
		return this.teamlistdao.teammakecheck3(map);
	}



	@Override
	public List<Map<String, Object>> if_Teammember(Map<String, Object> map) {
		return this.teamlistdao.if_Teammember(map);
	}



	@Override
	public int Teamleader_update(Map<String, Object> map) {
		return this.teamlistdao.Teamleader_update(map);
	}



	@Override
	public Map<String, Object> Teamleader_candidate(Map<String, Object> map) {
		return this.teamlistdao.Teamleader_candidate(map);
	}



	@Override
	public int Teamleader_update2(Map<String, Object> map, Map<String, Object> teamleader_candidate) {
		return this.teamlistdao.Teamleader_update2(map, teamleader_candidate);
	}



	@Override
	public int Teammember_candidate_delete(Map<String, Object> teamleader_candidate) {
		return this.teamlistdao.Teammember_candidate_delete(teamleader_candidate);
	}



	@Override
	public int Teamcandidate_teamleader(Map<String, Object> map, Map<String, Object> teamleader_candidate) {
		return this.teamlistdao.Teamcandidate_teamleader(map, teamleader_candidate);
	}



}