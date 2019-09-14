package com.kh.flowerheal.product.service;

import com.kh.flowerheal.product.dto.ProductDTO;

public interface ProductSvc {
	
	// 패키지 상품 조회
	ProductDTO getPDTO(String pnum);

}
