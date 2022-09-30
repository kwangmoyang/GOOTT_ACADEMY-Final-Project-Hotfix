package com.Final.Final1.board.service;

import java.util.List;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.HotfixDTO;

public interface HotfixService {

	void insert(HotfixDTO dto);

	List<HotfixDTO> list(String keyword, int start, int end, String select);

	List<BoardDTO> myRequestlist(HotfixDTO dto);

	void resolveMember(HotfixDTO dto);

	List<HotfixDTO> resolveMemberlist(int test);

	int count(String keyword);

	void choiceResolve(HotfixDTO dto);

	List<HotfixDTO> resolveZone(HotfixDTO dto);

	

}
