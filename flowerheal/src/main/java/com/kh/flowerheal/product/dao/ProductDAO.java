package com.kh.flowerheal.product.dao;

import com.kh.flowerheal.product.dto.ProductDTO;

public interface ProductDAO {
	
	// 패키지 상품 조회
	ProductDTO getPDTO(String pnum);
		
	
}
