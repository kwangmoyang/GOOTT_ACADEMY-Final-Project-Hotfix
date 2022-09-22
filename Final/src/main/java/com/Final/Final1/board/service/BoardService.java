package com.Final.Final1.board.service;

import java.util.List;

import com.Final.Final1.board.model.BoardDTO;

public interface BoardService {

	List<BoardDTO> list();

	void insert(BoardDTO dto);

	

}
