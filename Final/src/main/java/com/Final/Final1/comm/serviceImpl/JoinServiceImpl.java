package com.Final.Final1.comm.serviceImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.comm.model.JoinDAO;
import com.Final.Final1.comm.service.JoinService;

@Service
public class JoinServiceImpl implements JoinService{

	@Autowired
	JoinDAO joinDao;
	
	@Override
	public void join(Map<String, Object> map) {
		joinDao.join(map);
	}

}
