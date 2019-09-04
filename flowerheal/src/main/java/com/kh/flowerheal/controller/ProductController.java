package com.kh.flowerheal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.flowerheal.product.dto.ProductDTO;

@Controller
@RequestMapping("/product")
public class ProductController {
	private static final Logger logger
	= LoggerFactory.getLogger(ProductController.class);

	String viewname = null;
	
	// 상품목록 페이지 양식
	@GetMapping("/productList")
	public String productList(Model model) {
		logger.info("productList() 호출됨");
		viewname = "/product/productList";
		return viewname;
	}
	
	// 상품상세 페이지
	@GetMapping("/{product_num}")
	public String product(
			@PathVariable String product_Num,
			Model model) {
		logger.info("product() 호출됨");
		ProductDTO pdto = new ProductDTO();
		pdto.setProduct_Num(product_Num);
		model.addAttribute("pdto", pdto);
		viewname = "/product/"+product_Num;
		return viewname;
	}
	
}
