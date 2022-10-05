package com.Final.Final1.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {


	@Inject
	SqlSessionTemplate sqlsession;
	
	@Override
	public List<Map<String, Object>> adminMemList(Map<String, Object> map, int start, int end) {
		Map<String, Object> map1 = new HashMap<>();
		map1.put("start", start);
		map1.put("end", end);
		map1.put("map", map);
		return sqlsession.selectList("admin.list",map1);
	}

	@Override
	public int userCount(AdminDTO dto) {
		return sqlsession.selectOne("admin.userCount", dto);
	}

	
	@Override
	public List<AdminDTO> userBoard(int start, int end, String select) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", select);
		
		return sqlsession.selectList("admin.userBoard", map);
	}

	@Override
	public int userBoardCount() {
		return sqlsession.selectOne("admin.userBoardCount");
	}	
	
	@Override
	public void boardMemDelete(int no) {
		sqlsession.delete("admin.boardMemDelete", no);
	}

	@Override
	public List<Map<String, Object>> adminBoard(Map<String, Object> map) {
		return sqlsession.selectList("admin.adminBoard",map);
	}

	//양광모 (아래거지우셈
	@Override
	public int userBoardCount(AdminDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void adminBoardinsert(AdminDTO dto) {
		sqlsession.insert("admin.adminBoardinsert",dto);
		
	}

	@Override
	public List<Map<String, Object>> adminBoardlist() {
		return sqlsession.selectList("admin.adminBoardlist");
	}

	@Override
	public void NoticeDelete(int no) {
		sqlsession.delete("admin.NoticeDelete", no);
	}

	

}

