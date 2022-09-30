package com.Final.Final1.team.service;

import java.util.List;
import java.util.Map;

import com.Final.Final1.team.model.TeamMemberDTO;
import com.Final.Final1.team.model.TeamlistDTO;

public interface Teamleaderservice {

	Map<String, Object> team_list(TeamlistDTO dto, String teamname);

	Map<String, Object> team_info(TeamMemberDTO dto2, String teamname);

	List<Map<String, Object>> team_members(TeamMemberDTO dto2, String teamname);

	List<TeamlistDTO> teamnotice_correction(TeamlistDTO dto, String teamname, String teamnotice_correction);

	Map<String, Object> teamname_correction(TeamlistDTO dto, String teamname, String Team_name);

	int teammember_delete(TeamMemberDTO dto, String user_nickname);

	int teammember_delete2(TeamMemberDTO dto, String user_nickname);

	

}
