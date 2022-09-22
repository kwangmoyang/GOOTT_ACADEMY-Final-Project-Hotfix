package com.Final.Final1.comm.service;

import java.util.Map;

import com.Final.Final1.comm.model.LoginDTO;

public interface LoginService {
	String UserInfo_Chk(Map<String, Object> map); //아이디&비밀번호 일치 확인
	
	String UserOnlyId_Chk(Map<String, Object> map); //회원정보중 일치하는 id가 있는지?

	void Change_User_pw(Map<String, Object> map); // 비밀번호 5회 오류시 강제 비밀번호 변경
	
	int Pw_Mistake_cnt(Map<String, Object> map); 
	// 해당 회원의 비밀번호 틀린 cnt 누적값 호출
	// 비밀번호 찾기 구현 완료시 해당 메서드 0으로 초기화 되도록?
	// 아니면 5번틀린걸 일정시간이 지나면 24시간이후 시도해주세요
	
	void Mistake_cnt_Up(Map<String, Object> map); //비밀번호 오류시 회원의 Pw_Mistake_cnt 증가
}
