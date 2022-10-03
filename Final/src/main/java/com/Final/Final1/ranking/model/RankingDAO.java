package com.Final.Final1.ranking.model;

import java.util.List;

public interface RankingDAO {

	List<RankingDTO> selectteamrank(RankingDTO dto);

	List<RankingDTO> teamrank_commission(RankingDTO dto);

	List<RankingDTO> RankingcountUser(RankingDTO dto);

	List<RankingDTO> RankingcommissionUser(RankingDTO dto);




}
