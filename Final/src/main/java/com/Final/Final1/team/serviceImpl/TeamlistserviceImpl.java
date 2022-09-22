package com.Final.Final1.team.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.team.model.TeamlistDAO;
import com.Final.Final1.team.model.TeamlistDAOImpl;
import com.Final.Final1.team.model.TeamlistDTO;
import com.Final.Final1.team.service.Teamlistservice;



@Service
public class TeamlistserviceImpl implements Teamlistservice {
	@Autowired
	TeamlistDAO teamlistdao;

	@Override
	public int insert(Map<String, Object> map) {
		return this.teamlistdao.insert(map);
	}

	@Override
	public List<TeamlistDTO> list(Map<String, Object> map) {

		return this.teamlistdao.list(map);
	}

	@Override
	public List<TeamlistDTO> taglist(Map<String, Object> map) {
		return this.teamlistdao.taglist(map);
	}
	
}
