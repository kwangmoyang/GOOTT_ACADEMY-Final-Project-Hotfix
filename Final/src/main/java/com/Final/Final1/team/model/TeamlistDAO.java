package com.Final.Final1.team.model;

import java.util.List;
import java.util.Map;

public interface TeamlistDAO {

	public int insert(Map<String, Object> map);

	List<TeamlistDTO> list(Map<String, Object> map);

	public List<TeamlistDTO> taglist(Map<String, Object> map);
	
}
