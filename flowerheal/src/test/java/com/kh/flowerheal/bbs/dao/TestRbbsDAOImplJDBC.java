package com.kh.flowerheal.bbs.dao;

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

import com.kh.flowerheal.bbs.dao.RbbsDAOImplJDBC;
import com.kh.flowerheal.bbs.dto.RbbsDTO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestRbbsDAOImplJDBC {

	private static final Logger logger =
			LoggerFactory.getLogger(TestRbbsDAOImplJDBC.class);
	
	@Inject
	private RbbsDAOImplJDBC rbdaoImpl;
	
	//댓글 등록
	@Test
	@Disabled
	void testWrite() {
		RbbsDTO rbbsDTO = new RbbsDTO();
		rbbsDTO.setBnum(2);
		rbbsDTO.setRid("id0");
		rbbsDTO.setRnickname("nick0");
		rbbsDTO.setRcontent("con0");
		
		int cnt = rbdaoImpl.write(rbbsDTO);
		assertEquals(1, cnt);
	}
	//댓글 등록
	@Test
	@Disabled
	void testWrite2() {
		for(int i = 0; i<25; i++) {
		RbbsDTO rbbsDTO = new RbbsDTO();
		rbbsDTO.setBnum(2);
		rbbsDTO.setRid("rereply_"+i+"@test.com");
		rbbsDTO.setRnickname("nick0");
		rbbsDTO.setRcontent("con0");
		rbdaoImpl.write(rbbsDTO);
		}
	}

	//댓글 목록(1)
	@Test
	@Disabled
	void testList() {
		String bnum = "2";
		List<RbbsDTO> alist = rbdaoImpl.list(bnum);
		logger.info(alist.toString());
	}

	//댓글 목록(2)
	@Test
	//@Disabled
	void testList2() {
		String bnum = "2";
		int startRec = 21;
		int endRec = 30;
		List<RbbsDTO> alist = rbdaoImpl.list(bnum,startRec,endRec);
		logger.info(alist.toString());
		assertEquals(10, alist.size());
	}
	
	//댓글 수정
	@Test
	@Disabled
	void testModify() {
		RbbsDTO rbbsDTO = new RbbsDTO();
		rbbsDTO.setRnum(1);
		rbbsDTO.setRcontent("con99");
		int cnt = rbdaoImpl.modify(rbbsDTO);
		assertEquals(1, cnt);
	}
	
	//댓글 삭제
	@Test
	@Disabled
	void testDelete() {
		String rnum = "1";
		int cnt = rbdaoImpl.delete(rnum);
		assertEquals(1, cnt);
	}

	
	
	//댓글 호감
	@Test
	@Disabled
	void testGoodOrBad1() {
		String rnum = "2";
		String goodOrBad = "good";
		int cnt = rbdaoImpl.goodOrBad(rnum, goodOrBad);
		assertEquals(1, cnt);
	}

	//댓글 비호감	
	@Test
	@Disabled
	void testGoodOrBad2() {
		String rnum = "2";
		String goodOrBad = "bad";
		int cnt = rbdaoImpl.goodOrBad(rnum, goodOrBad);
		assertEquals(1, cnt);
	}
	
	//대댓글 등록	
	@Test
	@Disabled
	void testReply() {
		RbbsDTO rbbsDTO = new RbbsDTO();
		rbbsDTO.setRnum(54);
		rbbsDTO.setRid("id9");
		rbbsDTO.setRnickname("nick9");
		rbbsDTO.setRcontent("con9");
		int cnt = rbdaoImpl.reply(rbbsDTO);
		logger.info("cnt : "+ cnt);
	}
	
	//대댓글 총계
	@Test
	@Disabled
	void testReplyTotalRec() {
		String bnum = "2";
		int cnt = rbdaoImpl.replyTotalRec(bnum);
		logger.info("cnt : " + cnt);
	}
	
	
}
