package com.kh.flowerheal.cart.dao.service;

import java.util.List;

import com.kh.flowerheal.cart.dao.CartDTO;
import com.kh.flowerheal.product.dto.ProductDTO;

public interface cartSVC{
	
		//카트에 상품 추가
		int cart_insert(CartDTO cartDTO);
		
		//카트에서 상품 삭제
		int cart_delete(int cart_num);
		
		//카트에서 상품 보기
		List<CartDTO> getCartList(String id);
		
		//카트에서 상품 수정
		int cart_modify(CartDTO cartDTO);
		
		//카트에서 결제
		
		
}
