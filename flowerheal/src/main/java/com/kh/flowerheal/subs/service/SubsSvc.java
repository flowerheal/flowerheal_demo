package com.kh.flowerheal.subs.service;

import com.kh.flowerheal.subs.dto.SubsDTO;

public interface SubsSvc {
	
	// 구독 조회
	SubsDTO getSDTO(String snum);
	
	// 구독 상품 등록
	int addSubs(SubsDTO sdto);
	
	// 구독 상품 배송지 변경
	int changeAddr(SubsDTO sdto);
	
	// 구독 상품 배송
	int delivery(SubsDTO sdto);
	
	// 구독 취소
	int cancelSubs(String snum);
	
	// 구독 변경
	int changeSubs(SubsDTO sdto);
	
	// 구독 만료
	int endSubs(SubsDTO sdto);
	
}
