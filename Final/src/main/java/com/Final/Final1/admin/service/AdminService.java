package com.Final.Final1.admin.service;

import java.util.List;
import java.util.Map;

import com.Final.Final1.admin.model.AdminDTO;

public interface AdminService {

	List<Map<String, Object>> adminMemList( Map<String, Object> map);
	
	int userCount(AdminDTO dto);
	
	List<AdminDTO> userBoard(int start, int end, String select);
	
	int userBoardCount();

//	List<Map<String, Object>> userBoard(Map<String, Object> map);
//	
//	int userBoardCount(AdminDTO dto);
}

