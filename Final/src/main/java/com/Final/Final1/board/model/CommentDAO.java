package com.Final.Final1.board.model;

import java.util.List;

public interface CommentDAO {

	void insert(CommentDTO dto);

	List<CommentDTO> list(int Post_num);

	CommentDTO detail(int Post_num);

}
