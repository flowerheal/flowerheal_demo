package com.kh.flowerheal.cart.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.flowerheal.cart.dto.CartDTO;

@Repository
public class CartDAOImplXML implements CartDAO {

	private static final Logger logger = 
			LoggerFactory.getLogger("CartDAOImplXML.class");
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int cart_insert(CartDTO cartDTO) {
		logger.info("cart-insert 호출");
		logger.info("카트 담기 호출됨/xml");
		return sqlSession.insert("mappers.cart-mapper.cart_insert", cartDTO);
	}

	@Override
	public int cart_delete(int cart_num) {
		// TODO Auto-generated method stub
		logger.info("카트 삭제 호출됨/xml");
		return sqlSession.delete("mappers.cart-mapper.cart_delete", cart_num);
	}

	@Override
	public List<CartDTO> getCartList(String id) {
		// TODO Auto-generated method stub
		logger.info("카트 리스트 호출됨/xml");
		return sqlSession.selectList("mappers.cart-mapper.getCartList", id);
	}

	@Override
	public int cart_modify(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cart_money(String user_id) {
		// TODO Auto-generated method stub
		logger.info("카트 총 가격 호출됨/xml");
		return 0;
	}

}
