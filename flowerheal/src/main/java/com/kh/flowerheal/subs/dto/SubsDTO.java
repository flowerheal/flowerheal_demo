package com.kh.flowerheal.subs.dto;

import java.sql.Timestamp;

import javax.persistence.Entity;

import lombok.Data;

@Entity
@Data
public class SubsDTO {
	
	private int subs_num;		// 구독 번호
	private String subs_Member_Id;	// 구독자 아이디
	private int subs_Product;	// 구매한 패키지 상품 번호
	private int subs_Cnt;		// 구독한 패키지 남은 발송 횟수
	private int subs_Price;		// 구독한 패키지 총 금액
	
	private String zipNo;		// 우편번호
	private String roadAddrPart1;	// 도로명 주소 1
	private String addrDetail;	// 상세주소
	
	private Timestamp subs_fdate;	// 구독 시작날짜
	private Timestamp subs_udate;	// 구독 업데이트날짜
	private Timestamp subs_edate;	// 구독 마지막날짜
	
}
