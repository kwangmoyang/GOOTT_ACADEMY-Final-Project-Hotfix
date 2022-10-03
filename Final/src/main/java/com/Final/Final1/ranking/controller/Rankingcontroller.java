package com.Final.Final1.ranking.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.ranking.model.RankingDTO;
import com.Final.Final1.ranking.service.Rankingservice;

@Controller
public class Rankingcontroller {
	
	@Inject
	Rankingservice rankingservice;

	
	//팀 활동점수순 랭킹
	@RequestMapping("/RankingcountTeam")
	public ModelAndView rankingteam(ModelAndView mv, RankingDTO dto) {
		
		List<RankingDTO> teamrank = rankingservice.selectteamrank(dto);
		
		mv.addObject("teamrank", teamrank);
		mv.setViewName("/ranking/ranking_countTeam");
		return mv;
	}
	
	
	//팀 커미션점수순 랭킹
	@RequestMapping("/RankingcommissionTeam")
	public ModelAndView RankingcommissionTeam(ModelAndView mv, RankingDTO dto) {
		
		List<RankingDTO> teamrank_commission = rankingservice.teamrank_commission(dto);
		
		mv.addObject("teamcommission", teamrank_commission);
		mv.setViewName("/ranking/ranking_commissionTeam");
		return mv;
	}
	
	//개인 활동점수순 랭킹
	@RequestMapping("/RankingcountUser")
	public ModelAndView RankingcountUser(ModelAndView mv, RankingDTO dto) {
		
		List<RankingDTO> RankingcountUser = rankingservice.RankingcountUser(dto);
		
		mv.addObject("RankingcountUser", RankingcountUser);
		mv.setViewName("/ranking/ranking_countUser");
		return mv;
	}
	
	//개인 커미션순 랭킹
	@RequestMapping("/RankingcommissionUser")
	public ModelAndView RankingcommissionUser(ModelAndView mv, RankingDTO dto) {
		
		List<RankingDTO> RankingcommissionUser = rankingservice.RankingcommissionUser(dto);
		
		mv.addObject("RankingcommissionUser", RankingcommissionUser);
		mv.setViewName("/ranking/ranking_commissionUser");
		return mv;
	}
	
	
	
}
