package com.Final.Final1.board.model;

import java.util.List;

public interface HotfixDAO {
	void insert(HotfixDTO dto);

	
	List<BoardDTO> myRequestlist(HotfixDTO dto);
	
	void resolveMember(HotfixDTO dto);
	
	List<HotfixDTO> resolveMemberlist(HotfixDTO dto);

	int Count(String keyword);

	/* List<BoardDTO> list(String keyword, String select, int start, int end); */


	List<BoardDTO> list(HotfixDTO dto);
}
