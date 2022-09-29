package com.Final.Final1.board.model;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HotfixDAOImpl implements HotfixDAO{

	@Inject
	SqlSessionTemplate sqlSession;

	@Override
	public void insert(HotfixDTO dto) {
		sqlSession.selectOne("hotfix.insert",dto);
		
	}

	@Override
	public List<BoardDTO> list(HotfixDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("hotfix.list",dto);
	}

	@Override
	public List<BoardDTO> myRequestlist(HotfixDTO dto) {
		return sqlSession.selectList("hotfix.myRequestlist",dto);
	}

	@Override
	public void resolveMember(HotfixDTO dto) {
		sqlSession.selectOne("hotfix.resolveMember",dto);
		
	}

//	@Override
//	public List<HotfixDTO> resolveMemberlist(HotfixDTO dto) {
//		return sqlSession.selectList("hotfix.resolveMemberlist",dto);
//	}

	@Override
	public List<HotfixDTO> resolveMemberlist(int test) {
		return sqlSession.selectList("hotfix.resolveMemberlist",test);
	}
	
	
}
