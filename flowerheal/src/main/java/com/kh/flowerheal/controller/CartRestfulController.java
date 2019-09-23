package com.kh.flowerheal.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.flowerheal.cart.dto.CartDTO;
import com.kh.flowerheal.cart.service.cartSVC;


@RestController
@RequestMapping("/cartRest")
public class CartRestfulController {
private static final Logger logger = LoggerFactory.getLogger(CartRestfulController.class);
	
	@Inject
	private cartSVC cSvc;
	
	
	// 장바구니 상품 리스트 조회
	//@PostMapping(value= "/cartList", produces = "application/json;charset=UTF-8")
	//public ResponseEntity<List<CartDTO>> getCartList(@RequestParam("id") String id) 
	@PostMapping(value= "/cartList", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<CartDTO>> getCartList(@RequestParam("id") String id) 
	{
		logger.info("장바구니 리스트 호출");
		System.out.println("id : " + id);	
		
		ResponseEntity<List<CartDTO>> res = null;
		List<CartDTO> list = null;
		
		try 
		{
			
			list = cSvc.getCartList(id);
			System.out.println(list);
			res = new ResponseEntity<List<CartDTO>>(list, HttpStatus.OK);	// 200
		} 
		catch (Exception e) 
		{
			res = new ResponseEntity<List<CartDTO>>(HttpStatus.BAD_REQUEST); // 400
		}
		return res;
	}
	
	//장바구니 총가격
	@PostMapping(value= "/cart_totalPrice", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> cart_money(@RequestParam("id") String id) 
	{
		logger.info("장바구니 총 가격 호출");
		System.out.println("id : " + id);	
		
		ResponseEntity<String> res = null;
		
		int result = cSvc.cart_money(id);
		
		if(result == 1)  
		{
			res = new ResponseEntity<String>("총 금액", HttpStatus.OK);	// 200
		} 
		else
		{
			res = new ResponseEntity<String>("금액 계산 실패", HttpStatus.BAD_REQUEST); // 400
		}
		return res;
	}
	
	// 장바구니 삭제
	@DeleteMapping(value = "/cartList/cancel/{cart_num}", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> cancelCart(@PathVariable(required = true) int cart_num){
		logger.info("장바구니삭제");
		System.out.println("이 문장 밑으로 에러가 뜬다면 CartRestFulController.cancelCart(cart_num) 메소드를 찾으세요.");
		
		ResponseEntity<String> res = null;
				
		
		int result = cSvc.cart_delete(cart_num);
		
		if(result == 1) {
			res = new ResponseEntity<String>("장바구니에 담은 상품 삭제", HttpStatus.OK); // 200
		} else {
			res = new ResponseEntity<String>("장바구니에 담은 상품 삭제 실패", HttpStatus.BAD_REQUEST); // 400
		}
		return res;
	}
	
	
}
