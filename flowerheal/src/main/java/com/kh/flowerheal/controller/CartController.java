package com.kh.flowerheal.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.flowerheal.cart.dao.CartDTO;
import com.kh.flowerheal.cart.dao.service.cartSVC;
import com.kh.flowerheal.member.service.MemberSvc;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(CartController.class);

	@Inject
	private cartSVC cartSVC;
	
	
	//장바구니 보기
	@GetMapping("/cart2/{id:.+}")
	public String cartList(@PathVariable String id,
						   Model model)
	{
		logger.info("cartList() 호출");
		
		List<CartDTO> cdto = cartSVC.getCartList(id);
		model.addAttribute("cdto", cdto);
		return "/product/cart";
	}
	
	//카트에서 삭제
	@GetMapping("/cart_delete")
	public String cart_delete()
	{
		return null;
	}
	//카트에 담은 수량 종류 수정
	@PostMapping("/cart_Modify")
	public String cart_modify()
	{
		return null;
	}
	//카트에서 선택후 결제하기
	
	//카트에서 결제하기
}
