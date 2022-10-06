package com.Final.Final1.team.model;

import java.util.List;
import java.util.Map;

public interface TeamlistDAO {


	List<TeamlistDTO> list(Map<String, Object> map, String search_option, String keyword, int start, int end);

	public List<Map<String, Object>> taglist(Map<String, Object> map);

	int teammake(Map<String, Object> map);

	List<Map<String, Object>> tags(Map<String, Object> map);

	Map<String, Object> teammakecheck(Map<String, Object> map);

	Map<String, Object> teammakecheck2(Map<String, Object> map);

	int teammakeupdate(Map<String, Object> map);

	int teamsecession(Map<String, Object> map);
	
	public int teamsecessiondelete(Map<String, Object> map);

	String teamsecession_teamleader(Map<String, Object> map);

	void teamsecession_teamleaderdelete(Map<String, Object> map);

	List<Map<String, Object>> teaminfo_notice(Map<String, Object> map);

	List<Map<String, Object>> teaminfo_teamleader(Map<String, Object> map);

	List<Map<String, Object>> teaminfo_members(Map<String, Object> map);


	List<Map<String, Object>> teaminfo_int(Map<String, Object> map);

	int count(String search_option, String keyword);


	int teamjoinmessage(Map<String, Object> map);

	Map<String, Object> teamjoin_team(Map<String, Object> map);

	int taginsert(String maketeamname, String tagarray);

	Map<String, Object> teammakecheck3(Map<String, Object> map);

	List<Map<String, Object>> if_Teammember(Map<String, Object> map);

	int Teamleader_update(Map<String, Object> map);

	String Teamleader_candidate(Map<String, Object> map);

	int Teamleader_update2(String secessionteamname, String teamleader_candidate);

	int Teammember_candidate_delete(String teamleader_candidate);

	int Teamcandidate_teamleader(String secessionteamname, String teamleader_candidate);



}
