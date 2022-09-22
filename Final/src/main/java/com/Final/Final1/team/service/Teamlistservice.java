package com.Final.Final1.team.service;

import java.util.List;
import java.util.Map;

import com.Final.Final1.team.model.TeamlistDTO;

public interface Teamlistservice {

	int insert(Map<String, Object> map);

	List<TeamlistDTO> list(Map<String, Object> map);

	List<TeamlistDTO> taglist(Map<String, Object> map);

	
}
