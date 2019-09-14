package com.kh.flowerheal.login.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.kh.flowerheal.member.dto.MemberDTO;

@Repository
public class LoginDAOImplXML implements LoginDAO{

	private static final Logger logger = 
			LoggerFactory.getLogger("LoginDAOImplXML.class");
	
	@Inject
	private SqlSession sqlSession;
	
	//회원유무 체크
	@Override
	public int isMember(String id, String pw) {
		logger.info("LoginDAOImplXML.isMember 호출됨");
		int result = 0;
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);		
		
		// 회원계정인지를 먼저 검색한다음에
		result = sqlSession.selectOne("mappers.login-mapper.isMember", map);
		
		// 회원계정이 있다면 1를 반환해주고
		if(result == 1) {
		    return result;
		}
		
		// 회원계정에 없으면 최종적으로 어드민계정인지 확인
		
		result = sqlSession.selectOne("mappers.login-mapper.isAdmin", map);
		
		// 로그인 계정이 어드민이라면 2를 반환한다.
		if(result == 1) {
		    return result + 1;		    
		}
		
		// 멤버도, 어드민도 없는 계정이라면 0을 반환한다.
		return 0;
	}

	// 회원 정보 가져오기
	@Override
	public MemberDTO getMember(String id, String pw, int cnt) {
		logger.info("LoginDAOImplXML.getMember 호출됨");
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);		
		
		if(cnt == 1) {
			return sqlSession.selectOne("mappers.login-mapper.getMember", map);			
		} else {
			return sqlSession.selectOne("mappers.login-mapper.getAdmin", map);
		}

	}

}
