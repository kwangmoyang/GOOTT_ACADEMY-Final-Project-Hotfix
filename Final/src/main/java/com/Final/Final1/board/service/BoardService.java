package com.Final.Final1.board.service;

import java.util.List;
import java.util.Map;

import com.Final.Final1.board.model.BoardDTO;

public interface BoardService {

	List<BoardDTO> list();
	
	List<BoardDTO> list(Map<String, Object> map);

	void insert(BoardDTO dto);

	Map<String, Object> detail(BoardDTO dto);

	int update(BoardDTO dto);

	boolean remove(BoardDTO dto);

	void viewCount(BoardDTO dto);

	

	

}
