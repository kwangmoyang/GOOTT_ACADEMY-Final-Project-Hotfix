package com.Final.Final1.team.model;

import java.util.Map;

public interface TeamleaderDAO {

	Map<String, Object> team_list(TeamlistDTO dto, String teamname);

}
