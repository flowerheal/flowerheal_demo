package com.kh.flowerheal.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.flowerheal.bbs.dto.BbsDTO;

@Repository
public class BbsDAOImplXML implements BbsDAO {

	private static final Logger logger = 
			LoggerFactory.getLogger("BbsDAOImplXML.class");

	@Inject
	private SqlSession sqlSession;
	
	//게시글 작성
	@Override
	public int write(BbsDTO bbsDTO) {
		logger.info("BbsDAOImplXML.write 호출됨");		
		return sqlSession.insert("mappers.bbsdaoimplxml-mapper.write",bbsDTO);
	}

	//게시글 수정
	@Override
	public int modify(BbsDTO bbsDTO) {
		logger.info("BbsDAOImplXML.modify 호출됨");		
		return sqlSession.update("mappers.bbsdaoimplxml-mapper.modify", bbsDTO);
	}

	//게시글 삭제
	@Override
	public int delete(String bnum) {
		logger.info("BbsDAOImplXML.delete 호출됨");
		//답글이 있는 원글인지 조회
		//sqlSession.delete("mappers.bbsdaoimplxml-mapper.delete", bnum);
		
		deleteComments(bnum);
		return sqlSession.delete("mappers.bbsdaoimplxml-mapper.delete", bnum);
	}

	
	
	
	private void deleteComments(String bnum) {
		sqlSession.update("mappers.bbsdaoimplxml-mapper.deleteComments", bnum);		
	}

	//게시글 보기
	@Override
	public BbsDTO view(String bnum) {
		logger.info("BbsDAOImplXML.view 호출됨");
		BbsDTO bbsDTO = null;
		bbsDTO = sqlSession.selectOne("mappers.bbsdaoimplxml-mapper.view", bnum);
		
		//조회수 증가
		updateHit(bnum);
		return bbsDTO;
	}
	
	//조회수 증가
	private void updateHit(String bnum) {
		sqlSession.update("mappers.bbsdaoimplxml-mapper.updateHit", bnum);
		
	}

	//게시글 목록보기
	//1)전체
	@Override
	public List<BbsDTO> list() {
		logger.info("BbsDAOImplXML.listAll 호출됨");
		return sqlSession.selectList("mappers.bbsdaoimplxml-mapper.listAll");
	}

	//2)검색어 없는경우
	@Override
	public List<BbsDTO> list(int startRec, int endRec) {
		logger.info("BbsDAOImplXML.listNoSearch 호출됨");
		Map<String,Integer> map = new HashMap<>();
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		return sqlSession.selectList("mappers.bbsdaoimplxml-mapper.listNoSearch",map);
	}

	//3)검색어 있는경우
	@Override
	public List<BbsDTO> list(int startRec, int endRec, String searchType, String keyword) {
		logger.info("BbsDAOImplXML.listYesSearch 호출됨");		
		Map<String,Object> map = new HashMap<>();
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return sqlSession.selectList("mappers.bbsdaoimplxml-mapper.listYesSearch",map);
	}


	
	//게시글 답글
	@Override
	public int reply(BbsDTO bbsDTO) {
		logger.info("BbsDAOImplXML.reply 호출됨");	
		//1)이전 답글 step 업데이트
		updateStep(bbsDTO.getBgroup(),bbsDTO.getBstep());
		//답글 달기
		return sqlSession.insert("mappers.bbsdaoimplxml-mapper.reply",bbsDTO);
	}

		//1)이전 답글 step 업데이트
	private void updateStep(int bgroup, int bstep) {
		Map<String,Object> map = new HashMap<>();
		map.put("bgroup", bgroup);
		map.put("bstep", bstep);
		sqlSession.update("mappers.bbsdaoimplxml-mapper.updateStep",map);
		
	}

	//게시글 총계
	//1)검색어 없는경우
	@Override
	public int totalRec() {
		logger.info("BbsDAOImplXML.totalRec 호출됨");		
		return sqlSession.selectOne("mappers.bbsdaoimplxml-mapper.totalRec");
	}

	//2)검색어 있는경우
	@Override
	public int searchTotalRec(String searchType, String keyword) {
		logger.info("BbsDAOImplXML.searchTotalRec 호출됨");		
		Map<String,Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return sqlSession.selectOne("mappers.bbsdaoimplxml-mapper.searchTotalRec",map);
	}
}
