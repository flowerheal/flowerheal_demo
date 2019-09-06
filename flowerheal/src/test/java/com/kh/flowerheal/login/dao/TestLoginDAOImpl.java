package com.kh.flowerheal.login.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.inject.Inject;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.flowerheal.login.dao.LoginDAO;
import com.kh.flowerheal.member.dto.MemberDTO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestLoginDAOImpl {
	
	private static final Logger logger =
			LoggerFactory.getLogger(TestLoginDAOImpl.class);
	
	@Inject
	@Qualifier("loginDAOImplXML")
	private LoginDAO ldaoImpl;
	
	String id;
	String pw;
	
	@BeforeEach
	void init() {
		id = "hong@naver.com";
		pw = "asdf1234!";
		
	}
	
	@Test
	void testIsMember() {		
		int cnt = ldaoImpl.isMember(id, pw);
		assertEquals(1, cnt);
	}
	
	@Test
	//@Disabled
	void testGetMember() {
		MemberDTO mdto = ldaoImpl.getMember(id, pw, 1);		
		logger.info(mdto.toString());
	}

}
