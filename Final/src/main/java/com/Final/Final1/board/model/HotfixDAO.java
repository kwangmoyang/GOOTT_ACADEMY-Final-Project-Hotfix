package com.Final.Final1.board.model;

import java.util.List;

public interface HotfixDAO {
	void insert(HotfixDTO dto);

	List<BoardDTO> list(HotfixDTO dto);
}
