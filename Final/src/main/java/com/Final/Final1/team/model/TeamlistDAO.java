package com.Final.Final1.team.model;

import java.util.List;
import java.util.Map;

public interface TeamlistDAO {

	public int insert(Map<String, Object> map);

	List<TeamlistDTO> list(Map<String, Object> map, String search_option, String keyword);

	public List<Map<String, Object>> taglist(Map<String, Object> map, String search_option, String keyword);

	public List<Map<String, Object>> click_taglist(Map<String, Object> map, String tagname);

	
	
}
