package com.kh.flowerheal.subs.dao;

import java.util.List;

import com.kh.flowerheal.subs.dto.SubsDTO;

public interface SubsDAO {
	
	// 구독 조회
	SubsDTO getSDTO(String snum);
	
	// 회원이 구독한 구독 리스트 조회
	List<SubsDTO> getMemberSubsList(String id);
	
	// 최근배송지
	SubsDTO getlastOrderSDTO(String id);
	
	// 해당 상품을 구독한 리스트 조회
	List<SubsDTO> getProductSubsList(String pnum);
	
	// 구독 등록
	int addSubs(SubsDTO sdto);
	
	// 구독 상품 배송지 변경
	int changeAddr(SubsDTO sdto);
	
	// 구독 상품 배송
	int delivery(String snum);
	
	// 구독 취소
	int cancelSubs(String snum);
	
	// 구독 변경
	int changeSubs(SubsDTO sdto);
	
	// 구독 만료
	int endSubs(String snum);
	
	// 어드민 구독 리스트 불러오기
	List<SubsDTO> getSubsList();
	
}
