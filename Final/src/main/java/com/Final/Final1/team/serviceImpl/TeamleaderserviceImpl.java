package com.Final.Final1.team.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.team.model.TeamMemberDTO;
import com.Final.Final1.team.model.TeamleaderDAO;
import com.Final.Final1.team.model.TeamlistDTO;
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
	public int teammember_delete(TeamMemberDTO dto, String user_nickname) {
		return teamleaderdao.teammember_delete(dto, user_nickname);
	}

	@Override
	public int teammember_delete2(TeamMemberDTO dto, String user_nickname) {
		return teamleaderdao.teammember_delete2(dto, user_nickname);
	}

	

}
