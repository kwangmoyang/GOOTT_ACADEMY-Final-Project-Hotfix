package com.Final.Final1.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.board.model.BoardDAO;
import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.service.BoardService;
import com.Final.Final1.mypage.model.MypageDTO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<BoardDTO> list(String boardCode,String keyword, String select, int start, int end) {
		// TODO Auto-generated method stub
		return boardDAO.list(boardCode,keyword, select, start, end);
	}


	@Override
	public void insert(BoardDTO dto) {
		// TODO Auto-generated method stub
		boardDAO.insert(dto);
	}


	@Override
	public Map<String, Object> detail(BoardDTO dto) {
		// TODO Auto-generated method stub
		return boardDAO.detail(dto);
	}


	@Override
	public int update(BoardDTO dto) {
		// TODO Auto-generated method stub
		return boardDAO.update(dto);
	}


	@Override
	public boolean remove(BoardDTO dto) {
		// TODO Auto-generated method stub
		int affectRowCount = boardDAO.delete(dto);
		return affectRowCount == 1;
	}
	
	@Override
	public void viewCount(BoardDTO dto) {
		 boardDAO.viewCount(dto);
		
	}


	@Override
	public int count(String keyword, String boardCode) {
		// TODO Auto-generated method stub
		return  boardDAO.Count(keyword,boardCode);
	}


	@Override
	public int Likeup(int post_num) {
		// TODO Auto-generated method stub
		return boardDAO.Likeup(post_num);
	}


	@Override
	public int Likedown(int post_num) {
		// TODO Auto-generated method stub
		return boardDAO.Likedown(post_num);
	}


	@Override
	public void activeInsert(MypageDTO mydto) {
		 boardDAO.activeInsert(mydto);
		
	}



	

	

}






