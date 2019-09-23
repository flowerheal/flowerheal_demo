package com.kh.flowerheal.cart.dao;

import java.util.List;

import com.kh.flowerheal.cart.dto.CartDTO;

public interface CartDAO {
	
	//카트에 상품 추가
	int cart_insert(CartDTO cartDTO);
	
	//카트에서 상품 삭제
	int cart_delete(int cart_num);
	
	//카트에서 상품 보기
	List<CartDTO> getCartList(String id);
	
	//카드에서 상품 수정
	int cart_modify(CartDTO cartDTO);
	
	//카트에서 예상 금액
	int cart_money(String user_id);
	
	//음 또 뭐가 있지
	
}
