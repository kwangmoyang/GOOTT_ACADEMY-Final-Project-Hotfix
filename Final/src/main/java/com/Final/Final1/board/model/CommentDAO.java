package com.Final.Final1.board.model;

import java.util.List;

public interface CommentDAO {

	void insert(CommentDTO dto);

	List<CommentDTO> list(int post_num);

}
