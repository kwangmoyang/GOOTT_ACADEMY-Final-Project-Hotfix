package com.Final.Final1.board.model;

import java.util.List;

public interface HotfixDAO {
	void insert(HotfixDTO dto);

	List<HotfixDTO> list(String keyword, int start, int end, String select);

	List<BoardDTO> myRequestlist(HotfixDTO dto, int start, int end);
	
	List<BoardDTO> myRequestlist(HotfixDTO dto);

	void resolveMember(HotfixDTO dto);

	List<HotfixDTO> resolveMemberlist(int test);

	int Count(String keyword);

	void choiceResolve(HotfixDTO dto);
	
	List<HotfixDTO> resolveZone(HotfixDTO dto, int start, int end);

	int count(HotfixDTO dto);

	int resultCount(HotfixDTO dto);

//	List<BoardDTO> list(HotfixDTO dto);
	
	List<HotfixDTO> mySolverlist(HotfixDTO dto);
	/* List<BoardDTO> list(String keyword, String select, int start, int end); */

	void giveUpResolve(HotfixDTO dto);
	
	void requesterCommissionDown(HotfixDTO dto);
	
	void resolverCommissionUp(HotfixDTO dto);
	
	void Drop_Req_cnt(HotfixDTO dto);
	
	void Completion(HotfixDTO dto);

	
	
}
