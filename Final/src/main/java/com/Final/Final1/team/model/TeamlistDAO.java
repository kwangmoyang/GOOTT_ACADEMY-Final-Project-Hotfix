package com.Final.Final1.team.model;

import java.util.List;
import java.util.Map;

public interface TeamlistDAO {


	List<TeamlistDTO> list(Map<String, Object> map, String search_option, String keyword);

	public List<Map<String, Object>> taglist(Map<String, Object> map, String search_option, String keyword);

	List<TeamlistDTO> tagsearchlist(Map<String, Object> map, String search_option, String keyword);

	int teammake(Map<String, Object> map);

	List<Map<String, Object>> tags(Map<String, Object> map);


}
