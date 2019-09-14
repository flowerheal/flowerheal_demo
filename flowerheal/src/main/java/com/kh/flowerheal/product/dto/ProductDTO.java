package com.kh.flowerheal.product.dto;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Entity
@Data
public class ProductDTO {
	@NotNull
	private String product_Num; 		//	상품번호
	@NotNull
	private String product_Name; 		//	패키지이름
	@NotNull
	private String product_Price; 		//	상품가격
}
