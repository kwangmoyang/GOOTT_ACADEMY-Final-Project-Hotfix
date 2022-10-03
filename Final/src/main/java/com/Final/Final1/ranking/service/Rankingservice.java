package com.Final.Final1.ranking.service;

import java.util.List;

import com.Final.Final1.ranking.model.RankingDTO;

public interface Rankingservice {

	List<RankingDTO> selectteamrank(RankingDTO dto);

	List<RankingDTO> teamrank_commission(RankingDTO dto);

	List<RankingDTO> RankingcountUser(RankingDTO dto);

	List<RankingDTO> RankingcommissionUser(RankingDTO dto);


}
