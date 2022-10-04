package com.Final.Final1.board.model;

import java.util.List;
import java.util.Map;

import com.Final.Final1.mypage.model.MypageDTO;

public interface CommentDAO {

	void insert(CommentDTO dto);

	List<CommentDTO> list(int Post_num);

	int delete(Map<String, Object> map);

	int count(int post_num);

	void activeInsert(MypageDTO mydto);

}
