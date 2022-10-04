package com.Final.Final1.board.model;

import java.util.List;
import java.util.Map;

import com.Final.Final1.mypage.model.MypageDTO;

public interface BoardDAO {

	List<BoardDTO> list(String boardCode, String keyword, String select, int start, int end);
	
	Object insert(BoardDTO dto);

	Map<String, Object> detail(BoardDTO dto);

	int update(BoardDTO dto);

	int delete(BoardDTO dto);

	void viewCount(BoardDTO dto);

	int Count(String keyword, String boardCode);

	int Likeup(int post_num);

	int Likedown(int post_num);

	void activeInsert(MypageDTO mydto);

	



}
