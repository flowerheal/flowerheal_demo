package com.kh.flowerheal.bbs.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.flowerheal.bbs.dao.BbsDAOImplJDBC;
import com.kh.flowerheal.bbs.dto.BbsDTO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestBbsDAOImplJDBC {

	private static final Logger logger =
			LoggerFactory.getLogger(TestBbsDAOImplJDBC.class);

	
	@Inject
	private BbsDAOImplJDBC bdaoImpl;
	

  //게시글 작성
	@Test
	@Disabled
	void testWrite() {
		BbsDTO bdto = new BbsDTO();
		bdto.setBtitle("title1");
		bdto.setBid("id1");
		bdto.setBnickname("nick1");
		bdto.setBcontent("con1");
		
		int cnt = bdaoImpl.write(bdto);
		assertEquals(1, cnt);
	}

  //게시글 수정	
	@Test
	@Disabled
	void testModify() {
		BbsDTO bdto = new BbsDTO();
		bdto.setBtitle("title2");
		bdto.setBcontent("con2");
		bdto.setBnum(2);
		
		int cnt = bdaoImpl.modify(bdto);
		assertEquals(1, cnt);
	}

	
  //게시글 삭제		
	@Test
	@Disabled
	void testDelete() {
		String bnum = "1";
		int cnt = bdaoImpl.delete(bnum);
		assertEquals(1, cnt);
	}

	
  //게시글 보기		
	@Test
	@Disabled
	void testView() {
		String bnum = "2";
		BbsDTO bdto = bdaoImpl.view(bnum);
		logger.info(bdto.toString());
	}
	
	
  //===게시글 목록보기==
	//1)전체	
	@Test
	@Disabled
	void testList() {
		List<BbsDTO> list= new ArrayList<>();
		list = bdaoImpl.list();
		logger.info(list.toString());
	}
	

	
	//2)검색어 없는경우	
	@Test
	@Disabled
	void testList2() {
		List<BbsDTO> list= new ArrayList<>();
		int starRec = 3;
		int endRec = 5;
		list = bdaoImpl.list(starRec, endRec);
		logger.info(list.toString());
	}
	

	
	//3)검색어 있는경우	
	@Test
	//@Disabled
	void testList3() {
		List<BbsDTO> list= new ArrayList<>();
		int starRec = 1;
		int endRec = 3;
		String searchType = "TC";
		String keyword = "t";
		
		list = bdaoImpl.list(starRec, endRec,searchType,keyword);
		logger.info(list.toString());
	}
	

	
	//게시글 답글	
	@Test
	@Disabled
	void testReply() {
		BbsDTO bdto = new BbsDTO();
		bdto.setBtitle("title1");
		bdto.setBid("id1");
		bdto.setBnickname("nick1");
		bdto.setBcontent("con1");
		bdto.setBgroup(2);
		bdto.setBstep(0);
		
		int cnt = bdaoImpl.reply(bdto);
		assertEquals(1, cnt);
	}
	
	
	//=== 게시글 총계 ===
	//1)검색어 없는경우	
	@Test
	@Disabled
	void testTotalRec() {
		int cnt = bdaoImpl.totalRec();
		logger.info("totalRec :" + cnt);
	}
	
	//2)검색어 있는경우	
	@Test
	@Disabled
	void testSearchTotalRec() {
		String searchType = "TC";
		String keyword = "1";
		int cnt = bdaoImpl.searchTotalRec(searchType, keyword);
		logger.info("searchTotalRec : " + cnt);
	}
	
	
}
