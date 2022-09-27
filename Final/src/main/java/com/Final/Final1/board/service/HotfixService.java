package com.Final.Final1.board.service;

import java.util.List;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.HotfixDTO;

public interface HotfixService{
	void insert(HotfixDTO dto);

	List<BoardDTO> list(HotfixDTO dto);
}
