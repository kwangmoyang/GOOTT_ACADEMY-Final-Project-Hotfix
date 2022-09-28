package com.Final.Final1.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.board.model.CommentDAO;
import com.Final.Final1.board.model.CommentDTO;
import com.Final.Final1.board.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDAO commentDAO; 
	
	@Override
	public void insert(CommentDTO dto) {
		commentDAO.insert(dto);
		
	}

	@Override
	public List<CommentDTO> list(int Post_num) {
		// TODO Auto-generated method stub
		return commentDAO.list(Post_num);
	}


	@Override
	public void remove(Map<String, Object> map) {
		commentDAO.delete(map);
		

	}

	@Override
	public int count(int post_num) {
		// TODO Auto-generated method stub
		return commentDAO.count(post_num);
	}

}
