package com.kh.flowerheal.member.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.flowerheal.member.dto.MemberDTO;
import com.kh.flowerheal.member.service.MemberSvc;

@ExtendWith(SpringExtension.class)
//@WebAppConfiguration
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })

public class TestMemberSvcImpl {
	private static final Logger logger = LoggerFactory.getLogger(TestMemberSvcImpl.class);

	@Inject
	MemberSvc mSvc;

	@Test

	void testInsert() {
		MemberDTO mdto = new MemberDTO();
		mdto.setId("test1@test.com");
		mdto.setPw("asdf1234!");
		mdto.setTel("01011112222");
		mdto.setGender("여");
		mdto.setRegion("서울");
		mdto.setNickname("홍길동");
		//mdto.setBirth("2001-01-01");

		int cnt = mSvc.insert(mdto);
		assertEquals(1, cnt);
	}

	@Test
	@Disabled
	void testModify() {
		MemberDTO mdto = new MemberDTO();
		mdto.setTel("01099998888");
		mdto.setNickname("홍길서");
		mdto.setGender("남");
		mdto.setRegion("울산");
		//mdto.setBirth("2001-01-01");
		mdto.setId("test2@test.com");
		mdto.setPw("asdf1234!");

		int cnt = mSvc.modify(mdto);
		assertEquals(1, cnt);
	}

	@Test
	@Disabled
	void testGetMember() {
		String id = "test1@test.com";

		MemberDTO mdto = mSvc.getMember(id);
		logger.info(mdto.toString());
	}
	@Test
	@Disabled
	void testGetMemberList() {
		
		List<MemberDTO> list = mSvc.getMemberList();
		logger.info(list.toString());
	}
	
	@Test
	@Disabled
	void testDelete() {
		String id = "test2@test.com";
		String pw = "asdf1234!";

		int cnt = mSvc.delete(id, pw);
		assertEquals(1, cnt);
	}

	@Test
	@Disabled
	void testDelByManager() {
		String id = "test1@test.com";

		int cnt = mSvc.delByManager(id);
		assertEquals(1, cnt);
	}

}
