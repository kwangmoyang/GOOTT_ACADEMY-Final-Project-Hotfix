package com.Final.Final1.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.board.model.BoardDAO;
import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	
	@Override
	public List<BoardDTO> list() {
		// TODO Auto-generated method stub
		return boardDAO.list();
	}


	@Override
	public void insert(BoardDTO dto) {
		// TODO Auto-generated method stub
		boardDAO.insert(dto);
	}

}






