package com.kh.flowerheal.login.service;

import com.kh.flowerheal.member.dto.MemberDTO;

public interface LoginSvc {
	// 회원유무 체크
	int isMember(String id,String pw);
	
	// 회원 정보 가져오기
	MemberDTO getMember(String id, String pw, int cnt);
	

}
