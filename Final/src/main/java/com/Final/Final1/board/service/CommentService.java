package com.Final.Final1.board.service;

import java.util.List;

import com.Final.Final1.board.model.CommentDTO;

public interface CommentService {

	void insert(CommentDTO dto);

	List<CommentDTO> list(int postNum);


//	List<CommentDTO> list(int Post_num);

}
