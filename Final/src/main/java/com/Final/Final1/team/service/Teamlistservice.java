package com.Final.Final1.team.service;

import java.util.List;
import java.util.Map;

import com.Final.Final1.team.model.TeamMemberDTO;
import com.Final.Final1.team.model.TeamlistDTO;

public interface Teamlistservice {


	List<TeamlistDTO> list(Map<String, Object> map, String search_option, String keyword, int start, int end);
	
	List<Map<String, Object>> taglist(Map<String, Object> map);

	int teammake(Map<String, Object> map);

	List<Map<String, Object>> tags(Map<String, Object> map);

	int teamjoin(Map<String, Object> map);
	
	

	Map<String, Object> teammakecheck(Map<String, Object> map);

	Map<String, Object> teammakecheck2(Map<String, Object> map);

	int teammakeupdate(Map<String, Object> map);

	int teamsecession(Map<String, Object> map);

	int teamsecessiondelete(Map<String, Object> map);

	String teamsecession_teamleader(Map<String, Object> map);

	void teamsecession_teamleaderdelete(Map<String, Object> map);

	String teamjoin_team(Map<String, Object> map);

	void teamjoininsert(Map<String, Object> map);

	List<Map<String, Object>> teaminfo_notice(Map<String, Object> map);

	List<Map<String, Object>> teaminfo_teamleader(Map<String, Object> map);

	List<Map<String, Object>> teaminfo_members(Map<String, Object> map);


	List<Map<String, Object>> teaminfo_int(Map<String, Object> map);


	int count(String search_option, String keyword);


	


}
