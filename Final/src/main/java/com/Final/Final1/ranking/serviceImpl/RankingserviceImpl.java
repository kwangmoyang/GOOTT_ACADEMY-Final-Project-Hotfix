package com.Final.Final1.ranking.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Final.Final1.ranking.model.RankingDAO;
import com.Final.Final1.ranking.model.RankingDTO;
import com.Final.Final1.ranking.service.Rankingservice;

@Service
public class RankingserviceImpl implements Rankingservice {
	
	@Inject
	RankingDAO rankingDAO;

	@Override
	public List<RankingDTO> selectteamrank(RankingDTO dto) {
		return rankingDAO.selectteamrank(dto);
	}

	@Override
	public List<RankingDTO> teamrank_commission(RankingDTO dto) {
		return rankingDAO.teamrank_commission(dto);
	}

	@Override
	public List<RankingDTO> RankingcountUser(RankingDTO dto) {
		return rankingDAO.RankingcountUser(dto);
	}

	@Override
	public List<RankingDTO> RankingcommissionUser(RankingDTO dto) {
		return rankingDAO.RankingcommissionUser(dto);
	}
	

	

}
