package com.Final.Final1.board.model;

import java.util.List;

public interface HotfixDAO {
	void insert(HotfixDTO dto);

	List<BoardDTO> list(HotfixDTO dto);

	List<BoardDTO> myRequestlist(HotfixDTO dto);

	void resolveMember(HotfixDTO dto);

	List<HotfixDTO> resolveMemberlist(int test);

	int Count(String keyword);

	void choiceResolve(HotfixDTO dto);
	
	List<HotfixDTO> resolveZone(HotfixDTO dto);
	
	
	/* List<BoardDTO> list(String keyword, String select, int start, int end); */

}
