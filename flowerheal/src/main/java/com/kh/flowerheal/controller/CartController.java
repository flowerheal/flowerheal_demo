package com.kh.flowerheal.controller;

import java.text.DecimalFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.flowerheal.cart.dto.CartDTO;
import com.kh.flowerheal.cart.service.cartSVC;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(CartController.class);
	
	@Inject
	private cartSVC cartSVC;
	
	DecimalFormat formatter = new DecimalFormat("###,###");
	
	//장바구니 보기
	@GetMapping("/cart2/{id:.+}")
	public String cartList(@PathVariable String id,
						   Model model)
	{
		logger.info("cartList() 호출");
		
		List<CartDTO> list = cartSVC.getCartList(id);
		//List<CartDTO> list = new ArrayList<CartDTO>();
		
		for(CartDTO item : list) {
			int addComma = item.getProduct_Price();
			
			System.out.println("addComma : " + addComma);
			// System.out.println(formatter.format(addComma));
			//  addComma = Integer.parseInt(formatter.format(addComma));
			// item.setProduct_Price(addComma);
		}
		
		model.addAttribute("list", list);
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
	
	
	// 주문하기 페이지
	@PostMapping("/cart2/cartToOrder")
	@ResponseBody
	public String cartToOrder(
			@RequestParam("id") String user_id,
			Model model) {
		logger.info("cartToOrder() 호출됨");

		return "/product/orderPage2";
		
	}
	
}
