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
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);		
		return sqlSession.selectOne("mappers.login-mapper.isMember", map);
	}

	// 회원 정보 가져오기
	@Override
	public MemberDTO getMember(String id, String pw) {
		logger.info("LoginDAOImplXML.getMember 호출됨");
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);		
		return sqlSession.selectOne("mappers.login-mapper.getMember", map);

	}

}
