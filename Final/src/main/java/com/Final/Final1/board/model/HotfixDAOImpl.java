package com.Final.Final1.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<HotfixDTO> list(String keyword ,int start, int end, String select) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", select);
		
		return sqlSession.selectList("hotfix.list", map);
	}
	/*
	 * @Override public List<BoardDTO> list(String keyword, String select, int
	 * start, int end) { // TODO Auto-generated method stub Map<String, Object> map
	 * = new HashMap<>(); map.put("keyword", keyword); map.put("search_option",
	 * select); map.put("start", start); map.put("end", end);
	 * 
	 * return sqlSession.selectList("hotfix.list",map); }
	 */

	

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

	@Override
	public int Count(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hotfix.count",keyword);
	}
	
	@Override
	public void choiceResolve(HotfixDTO dto) {
		sqlSession.selectOne("hotfix.choiceResolve",dto);
		
	}
	@Override
	public List<HotfixDTO> resolveZone(HotfixDTO dto) {
		return sqlSession.selectList("hotfix.resolveZone",dto);
	}
	@Override
	public List<BoardDTO> list(HotfixDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("hotfix.list",dto);
	}

	


	
	
}
