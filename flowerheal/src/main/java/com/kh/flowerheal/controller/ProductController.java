package com.kh.flowerheal.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.flowerheal.member.dto.MemberDTO;
import com.kh.flowerheal.member.service.MemberSvc;
import com.kh.flowerheal.product.dto.ProductDTO;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Inject
	private MemberSvc mSvc;
	
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
	@GetMapping("/{product_Num}")
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
	
	// 주문하기 페이지
	@PostMapping("/orderPage")
	public String orderPage(
			@ModelAttribute ProductDTO pdto,
			@RequestParam String user_id,
			@RequestParam String subs_Fdate,
			@RequestParam String subs_Edate,
			@RequestParam String productCost,
			@RequestParam String postCost,
			Model model) {
		logger.info("product() 호출됨");
		MemberDTO mdto = mSvc.getMember(user_id);
		model.addAttribute("mdto",mdto);
		
		model.addAttribute("pdto", pdto);
		model.addAttribute("subs_Fdate", subs_Fdate);
		model.addAttribute("subs_Edate", subs_Edate);
		model.addAttribute("productCost", productCost);
		model.addAttribute("postCost", postCost);
		viewname = "/product/orderPage";
		return viewname;
	}
}
