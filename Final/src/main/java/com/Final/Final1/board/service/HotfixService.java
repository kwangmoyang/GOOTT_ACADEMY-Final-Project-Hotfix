package com.Final.Final1.board.service;

import java.util.List;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.HotfixDTO;

public interface HotfixService {

	void insert(HotfixDTO dto);

	List<HotfixDTO> list(String keyword, int start, int end, String select);

	
	List<BoardDTO> myRequestlist(HotfixDTO dto, int start, int end);

	List<BoardDTO> myRequestlist(HotfixDTO dto);
	
	void resolveMember(HotfixDTO dto);

	List<HotfixDTO> resolveMemberlist(int test);

	int count(HotfixDTO dto);
	int count(String keyword);
	

	void choiceResolve(HotfixDTO dto);

	List<HotfixDTO> resolveZone(HotfixDTO dto, int start, int end);


	List<HotfixDTO> mySolverlist(HotfixDTO dto);
	
	void giveUpResolve(HotfixDTO dto);
	
	void requesterCommissionDown(HotfixDTO dto);
	
	void resolverCommissionUp(HotfixDTO dto);
	
	
	void Drop_Req_cnt(HotfixDTO dto);
	
	void Completion(HotfixDTO dto);

	int resultCount(HotfixDTO dto);

	
}
