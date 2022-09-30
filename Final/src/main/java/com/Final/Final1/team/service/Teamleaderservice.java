package com.Final.Final1.team.service;

import java.util.Map;

import com.Final.Final1.team.model.TeamlistDTO;

public interface Teamleaderservice {

	Map<String, Object> team_list(TeamlistDTO dto, String teamname);

}
