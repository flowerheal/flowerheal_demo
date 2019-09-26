package com.kh.flowerheal.subs.dto;

import java.sql.Date;

import javax.persistence.Entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Data
public class SubsDTO {
	
	private int subs_num;		// 구독 번호
	private String subs_Member_Id;	// 구독자 아이디
	private String subs_Check;	// 진행여부 Y-진행, E-만료, C-취소
	private String subs_Email;	// 이메일 발송여부 Y/N
	private String subs_Pname;	// 구독한 패키지 상품명	
	private int subs_Product;	// 구매한 패키지 상품 번호
	private int subs_Cnt;		// 구독한 패키지 남은 발송 횟수
	private int subs_Price;		// 구독한 패키지 총 금액
	
	private String zipNo;		// 우편번호
	private String roadAddrPart1;	// 도로명 주소 1
	private String addrDetail;	// 상세주소
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date subs_Fdate;	// 구독 시작날짜
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date subs_Udate;	// 구독 업데이트날짜
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date subs_Edate;	// 구독 마지막날짜
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date subs_Ddate;	// 구독 배송 예정일
	
	private String isSaveAddr;
	
}
