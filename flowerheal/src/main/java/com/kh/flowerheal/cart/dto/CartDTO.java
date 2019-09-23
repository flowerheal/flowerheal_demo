package com.kh.flowerheal.cart.dto;

import java.sql.Date;

import javax.persistence.Entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Data
public class CartDTO {
	
	//카트 번호
	private int cart_num ;
	
	//장바구니에 담은 상품이름
	private String product_Name ;
	
	//담은 사람 아이디
	private String user_id; 

	//가격
	private int product_Price;
	
	//상품번호
	private String product_Num;
	
	//상품옵션
	//private String cart_option;
	
	//구독횟수
	private int product_SubsCnt;
	
	//상품 구독시작일
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date cart_Fdate;	
	
	//상품 구독종료일
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date cart_Edate;		
	

}
