package com.Final.Final1.ranking.model;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RankingDAOImpl implements RankingDAO {
	
	@Inject
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<RankingDTO> selectteamrank(RankingDTO dto) {
		return sqlSessionTemplate.selectList("rank.selectteamrank", dto);
	}

	@Override
	public List<RankingDTO> teamrank_commission(RankingDTO dto) {
		return sqlSessionTemplate.selectList("rank.teamrank_commission", dto);
	}

	@Override
	public List<RankingDTO> RankingcountUser(RankingDTO dto) {
		return sqlSessionTemplate.selectList("rank.RankingcountUser", dto);
	}

	@Override
	public List<RankingDTO> RankingcommissionUser(RankingDTO dto) {
		return sqlSessionTemplate.selectList("rank.RankingcommissionUser", dto);
	}



}
