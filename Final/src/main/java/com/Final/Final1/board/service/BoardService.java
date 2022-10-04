package com.Final.Final1.board.service;

import java.util.List;
import java.util.Map;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.mypage.model.MypageDTO;

public interface BoardService {

	List<BoardDTO> list(String boardCode, String keyword, String select, int start, int end);
	
	void insert(BoardDTO dto);

	Map<String, Object> detail(BoardDTO dto);

	int update(BoardDTO dto);

	boolean remove(BoardDTO dto);

	void viewCount(BoardDTO dto);

	int count(String keyword, String boardCode);

	int Likeup(int post_num);

	int Likedown(int post_num);

	void activeInsert(MypageDTO mydto);



	

	

}
