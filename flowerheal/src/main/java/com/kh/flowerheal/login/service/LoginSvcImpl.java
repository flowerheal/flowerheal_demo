package com.kh.flowerheal.login.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.flowerheal.login.dao.LoginDAO;
import com.kh.flowerheal.member.dto.MemberDTO;

@Service
public class LoginSvcImpl implements LoginSvc{

	@Inject
	@Qualifier("loginDAOImplXML")
	LoginDAO ldao;
	
	// 회원유무 체크
	@Override
	public int isMember(String id, String pw) {
		
		return ldao.isMember(id, pw);
	}
	
	// 회원 정보 가져오기
	@Override
	public MemberDTO getMember(String id, String pw, int cnt) {
			return ldao.getMember(id, pw, cnt);
	}



}
