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
	public List<TeamlistDTO> list(Map<String, Object> map, String search_option, String keyword) {
		return this.teamlistdao.list(map, search_option, keyword);
	}

	@Override
	public List<Map<String, Object>> taglist(Map<String, Object> map, String search_option, String keyword) {
		return this.teamlistdao.taglist(map, search_option, keyword);
	}

	@Override
	public List<TeamlistDTO> tagsearchlist(Map<String, Object> map, String search_option, String keyword) {
		
		return this.teamlistdao.tagsearchlist(map, search_option, keyword);
	}

	@Override
	public int teammake(Map<String, Object> map) {
		return this.teamlistdao.teammake(map);
	}

	@Override
	public List<Map<String, Object>> tags(Map<String, Object> map) {
		return this.teamlistdao.tags(map);
	}





	
}
