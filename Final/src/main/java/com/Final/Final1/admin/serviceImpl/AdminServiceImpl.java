package com.Final.Final1.admin.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.admin.model.AdminDAO;
import com.Final.Final1.admin.model.AdminDTO;
import com.Final.Final1.admin.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{


	@Autowired
	AdminDAO adminDao;
	
	@Override
	public List<Map<String, Object>> adminMemList( Map<String, Object> map, int start, int end) {
		return adminDao.adminMemList(map, start, end);
	}

	@Override
	public int userCount(AdminDTO dto) {
		return adminDao.userCount(dto);
	}

	@Override
	public List<AdminDTO> userBoard(int start, int end, String select) {
		return adminDao.userBoard(start, end, select);
	}

	@Override
	public int userBoardCount() {
		return adminDao.userBoardCount();
	}

	@Override
	public void boardMemDelete(int no) {
		adminDao.boardMemDelete(no);
	}

	@Override
	public List<Map<String, Object>> adminBoard(Map<String, Object> map) {
		return adminDao.adminBoard(map);
	}

	@Override
	public void adminBoardinsert(AdminDTO dto) {
		adminDao.adminBoardinsert(dto);
	}

	@Override
	public int userBoardCount(AdminDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> adminBoardlist() {
		return adminDao.adminBoardlist();
	}

	@Override
	public void NoticeDelete(int no) {
		adminDao.NoticeDelete(no);
	}
	

}

