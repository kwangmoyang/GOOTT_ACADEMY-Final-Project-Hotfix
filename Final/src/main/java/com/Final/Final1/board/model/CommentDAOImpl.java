package com.Final.Final1.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(CommentDTO dto) {
		sqlSessionTemplate.insert("Comment.insert", dto);
		
	}
	@Override
	public List<CommentDTO> list(int Post_num) {
		return sqlSessionTemplate.selectList("Comment.list", Post_num);
	}

}
