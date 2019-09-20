package com.kh.flowerheal.cart.dao;

import javax.persistence.Entity;

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
	

}
