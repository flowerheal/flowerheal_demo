package com.kh.flowerheal.product.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.flowerheal.product.dto.ProductDTO;

@Repository
public class ProductDAOImplXML implements ProductDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public ProductDTO getPDTO(String pnum) {
		return sqlSession.selectOne("mappers.product-mapper.getPDTO", pnum);
	}
}
