package com.kh.flowerheal.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kh.flowerheal.bbs.dto.BbsDTO;

public interface BbsSVC {
	//게시글 작성
	int write(BbsDTO bbsDTO);
	//게시글 수정
	int modify(BbsDTO bbsDTO);
	//게시글 삭제
	int delete(String bnum);
	//게시글 보기
	BbsDTO view(String bnum);
	
	
	//게시글 목록보기
//	void list(HttpServletRequest request, Model model);
	void list(String reqPage, String searchType, String keyword, Model model);
	//1)전체
	List<BbsDTO> list();
	//2)검색어 없는경우
	List<BbsDTO> list(int starRec, int endRec);
	//3)검색어 있는경우
	List<BbsDTO> list(int starRec, int endRec, String searchType, String keyword);


	
	
	//게시글 답글
	int reply(BbsDTO bbsDTO);	
	
	//게시글 총계
	//1)검색어 없는경우
	int totalRec();
	//2)검색어 있는경우
	int searchTotalRec(String searchType,String keyword);
}
