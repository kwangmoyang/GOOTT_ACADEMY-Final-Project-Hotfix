package com.Final.Final1.board.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Final.Final1.mypage.model.MypageDTO;

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
	
	@Override
	public int delete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("Comment.delete", map);
	}
	@Override
	public int count(int post_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("Comment.count", post_num);
	}
	@Override
	public void activeInsert(MypageDTO mydto) {
		sqlSessionTemplate.insert("Comment.activeInsert", mydto);
		
	}

}
