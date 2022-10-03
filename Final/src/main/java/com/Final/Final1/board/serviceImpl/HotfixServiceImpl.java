package com.Final.Final1.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.board.model.BoardDTO;
import com.Final.Final1.board.model.HotfixDAO;
import com.Final.Final1.board.model.HotfixDTO;
import com.Final.Final1.board.service.HotfixService;

@Service
public class HotfixServiceImpl implements HotfixService{
	
	@Autowired
	HotfixDAO HotfixDao;
	
	@Override
	public void insert(HotfixDTO dto) {
		HotfixDao.insert(dto);
	}
	
	@Override
	public List<HotfixDTO> list(String keyword, int start, int end, String select ) {
		// TODO Auto-generated method stub
		return HotfixDao.list(keyword, start, end, select);
	}

	
	

	@Override
	public List<BoardDTO> myRequestlist(HotfixDTO dto, int start, int end) {
		return HotfixDao.myRequestlist(dto, start, end);
	}

	@Override
	public void resolveMember(HotfixDTO dto) {
		HotfixDao.resolveMember(dto);
		
	}

//	@Override
//	public List<HotfixDTO> resolveMemberlist(HotfixDTO dto) {
//		return HotfixDao.resolveMemberlist(dto);
//	}

	@Override
	public List<HotfixDTO> resolveMemberlist(int test) {
		return HotfixDao.resolveMemberlist(test);
	}
	//HOTFIX count
	@Override
	public int count(String keyword) {
		// TODO Auto-generated method stub
		return HotfixDao.Count(keyword);
	}


	

	@Override
	public void choiceResolve(HotfixDTO dto) {
		HotfixDao.choiceResolve(dto);
		
	}

	@Override
	public List<HotfixDTO> resolveZone(HotfixDTO dto, int start, int end) {
		return HotfixDao.resolveZone(dto, start, end);
	}
	//해결내역 count
		@Override
		public int resultCount(HotfixDTO dto) {
			// TODO Auto-generated method stub
			return HotfixDao.resultCount(dto);
	}
	
	
	
	
	//마이페이지 해결요청내역 count
	@Override
	public int count(HotfixDTO dto) {
		// TODO Auto-generated method stub
		return HotfixDao.count(dto);
	}
	

//	@Override
//	public List<BoardDTO> list(HotfixDTO dto) {
//		return HotfixDao.list(dto);
//	}



	
	
	
	


}
