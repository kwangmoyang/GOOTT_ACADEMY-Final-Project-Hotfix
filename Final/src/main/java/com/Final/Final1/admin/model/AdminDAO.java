package com.Final.Final1.admin.model;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	List<Map<String, Object>> adminMemList(Map<String, Object> map);
	
	int userCount(AdminDTO dto);
	
	List<Map<String, Object>> userBoard(Map<String, Object> map);
	
	int userBoardCount(AdminDTO dto);
	
	public void boardMemDelete(int no);
	
	List<Map<String, Object>> adminBoard(Map<String, Object> map);

}

