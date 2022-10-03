package com.Final.Final1.team.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.team.model.TeamMemberDTO;
import com.Final.Final1.team.model.TeamMemberdelDTO;
import com.Final.Final1.team.model.TeamleaderDAO;
import com.Final.Final1.team.model.TeamlistDTO;
import com.Final.Final1.team.model.TeamnotMemberDTO;
import com.Final.Final1.team.service.Teamleaderservice;

@Service
public class TeamleaderserviceImpl implements Teamleaderservice {
	
	@Autowired
	TeamleaderDAO teamleaderdao;

	@Override
	public Map<String, Object> team_list(TeamlistDTO dto, String teamname) {
		return teamleaderdao.team_list(dto, teamname);
	}

	@Override
	public Map<String, Object> team_info(TeamMemberDTO dto2, String teamname) {
		return teamleaderdao.team_info(dto2, teamname);
	}

	@Override
	public List<Map<String, Object>> team_members(TeamMemberDTO dto2, String teamname) {
		return teamleaderdao.team_members(dto2, teamname);
	}

	@Override
	public List<TeamlistDTO> teamnotice_correction(TeamlistDTO dto, String teamname, String teamnotice_correction) {
		return teamleaderdao.teamnotice_correction(dto, teamname, teamnotice_correction);
	}

	@Override
	public Map<String, Object> teamname_correction(TeamlistDTO dto, String teamname, String Team_name) {
		return teamleaderdao.teamname_correction(dto, teamname, Team_name);
	}

	@Override
	public int teammember_delete(TeamMemberdelDTO dto) {
		return teamleaderdao.teammember_delete(dto);
	}

	@Override
	public int teammember_delete2(TeamMemberdelDTO dto) {
		return teamleaderdao.teammember_delete2(dto);
	}

	@Override
	public List<Map<String, Object>> team_notmembers(TeamnotMemberDTO dto3, String teamname) {
		return teamleaderdao.team_notmembers(dto3, teamname);
	}

	@Override
	public String teamjoin_team(Map<String, Object> map) {
		return teamleaderdao.teamjoin_team(map);
	}

	@Override
	public int teamjoin_accept(Map<String, Object> map) {
		return teamleaderdao.teamjoin_accept(map);
	}

	@Override
	public int teamjoininsert(Map<String, Object> map) {
		return teamleaderdao.teamjoininsert(map);
	}

	@Override
	public int teamnotmember_del(Map<String, Object> map) {
		return teamleaderdao.teamnotmember_del(map);
	}

	@Override
	public int teamjoinrefuse(Map<String, Object> map) {
		return teamleaderdao.teamjoinrefuse(map);
	}

	

}
