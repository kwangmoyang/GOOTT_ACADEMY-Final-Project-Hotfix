package com.Final.Final1.comm.serviceImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.comm.model.LoginDAO;
import com.Final.Final1.comm.model.LoginDTO;
import com.Final.Final1.comm.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	LoginDAO loginDao;
	
	@Override
	public String UserInfo_Chk(Map<String, Object> map) {
		
		return loginDao.UserInfo_Chk(map);
	}

	@Override
	public String UserOnlyId_Chk(Map<String, Object> map) {
		return loginDao.UserOnlyId_Chk(map);
	}

	@Override
	public void Change_User_pw(Map<String, Object> map) {
		loginDao.Change_User_pw(map);
		
	}

	@Override
	public int Pw_Mistake_cnt(Map<String, Object> map) {
		
		return loginDao.Pw_Mistake_cnt(map);
	}

	@Override
	public void Mistake_cnt_Up(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

}
