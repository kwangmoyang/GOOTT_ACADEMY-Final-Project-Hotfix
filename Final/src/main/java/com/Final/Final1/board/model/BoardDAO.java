package com.Final.Final1.board.model;

import java.util.List;

public interface BoardDAO {

	List<BoardDTO> list();

	Object insert(BoardDTO dto);



}
