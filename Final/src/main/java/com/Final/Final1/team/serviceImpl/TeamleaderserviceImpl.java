package com.Final.Final1.team.serviceImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
