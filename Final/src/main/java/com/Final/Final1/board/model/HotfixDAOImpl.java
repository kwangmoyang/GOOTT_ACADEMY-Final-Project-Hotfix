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
		System.out.println(select);
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
	public List<BoardDTO> myRequestlist(HotfixDTO dto, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("Requester", dto.getRequester());
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("hotfix.myRequestlist",map);
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
	
	// 마이페이지 해결내역
	@Override
	public List<HotfixDTO> resolveZone(HotfixDTO dto, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("Solver", dto.getSolver());
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("hotfix.resolveZone", map);
	}
	
	//마이페이지 해결내역 count
		@Override
		public int resultCount(HotfixDTO dto) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("hotfix.resultCount",dto); 
		}
	
	
//	@Override
//	public List<BoardDTO> list(HotfixDTO dto) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("hotfix.list",dto);
//	}
	
	//마이페이지 해결요청내역 count
	@Override
	public int count(HotfixDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hotfix.mypageCount",dto); 
	}

	@Override
	public List<HotfixDTO> mySolverlist(HotfixDTO dto) {
		return sqlSession.selectList("hotfix.mySolverlist",dto);
	}
	@Override
	public void giveUpResolve(HotfixDTO dto) {
		sqlSession.selectOne("hotfix.giveUpResolve",dto);
		
	}
	@Override
	public void requesterCommissionDown(HotfixDTO dto) {
		sqlSession.selectOne("hotfix.requesterCommissionDown",dto);
	}
	@Override
	public void resolverCommissionUp(HotfixDTO dto) {
		sqlSession.selectOne("hotfix.resolverCommissionUp",dto);		
	}
	@Override
	public void Drop_Req_cnt(HotfixDTO dto) {
		sqlSession.selectOne("hotfix.Drop_Req_cnt",dto);
	}
	@Override
	public void Completion(HotfixDTO dto) {
		sqlSession.selectOne("hotfix.Completion",dto);
	}


	


	
	
}
