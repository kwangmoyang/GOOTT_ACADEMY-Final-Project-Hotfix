package com.Final.Final1.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public List<BoardDTO> list(BoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("board.list",dto);
	}
	
	@Override
	public Object insert(BoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("board.insert", dto);
	}


	@Override
	public Map<String, Object> detail(BoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("board.detail", dto);
	}


	@Override
	public int update(BoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("board.update", dto);
	}


	@Override
	public int delete(BoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("board.delete", dto);
	}

	
	@Override
	public void viewCount(BoardDTO dto) {
		sqlSessionTemplate.update("board.viewCount",dto);
	}

	@Override
	public int Count(String keyword, String boardCode) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("boardCode", boardCode);
		return sqlSessionTemplate.selectOne("board.count",map);
	}
	
}










