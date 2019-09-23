package com.kh.flowerheal.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.flowerheal.cart.dao.CartDAO;
import com.kh.flowerheal.cart.dto.CartDTO;


@Service
public class cartSVCImpl implements cartSVC{

	@Inject
	@Qualifier("cartDAOImplXML")
	CartDAO cartDAO;
	
	@Override
	public int cart_insert(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return cartDAO.cart_insert(cartDTO);
	}

	@Override
	public int cart_delete(int cart_num) {
		// TODO Auto-generated method stub
		return cartDAO.cart_delete(cart_num);
	}

	@Override
	public List<CartDTO> getCartList(String id) {
		// TODO Auto-generated method stub
		return cartDAO.getCartList(id);
	}

	@Override
	public int cart_modify(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return cartDAO.cart_modify(cartDTO);
	}

	@Override
	public int cart_money(String user_id) {
		// TODO Auto-generated method stub
		return cartDAO.cart_money(user_id);
	}

}
