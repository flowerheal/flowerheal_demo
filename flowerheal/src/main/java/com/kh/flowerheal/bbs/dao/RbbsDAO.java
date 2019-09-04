package com.kh.flowerheal.bbs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.flowerheal.bbs.dto.RbbsDTO;

@Repository
public interface RbbsDAO {
	
	//댓글 등록
	int write(RbbsDTO rbbsDTO);
	
	//댓글 목록
	List<RbbsDTO> list(String bnum);
	List<RbbsDTO> list(String bnum,int startRec, int endRec);
	
	
	//댓글 수정
	int modify(RbbsDTO rbbsDTO);
	
	
	//댓글 삭제
	int delete(String rnum);
	
	
	//댓글 호감 비호감
	int goodOrBad(String rnum, String goodOrBad);
	
	//대댓글 등록
	int reply(RbbsDTO rbbsDTO);
	
	//대댓글 총계
	int replyTotalRec(String bnum);
	
}
