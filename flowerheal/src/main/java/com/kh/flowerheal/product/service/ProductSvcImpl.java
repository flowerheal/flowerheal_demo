package com.kh.flowerheal.product.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.flowerheal.product.dao.ProductDAOImplXML;
import com.kh.flowerheal.product.dto.ProductDTO;

@Service
public class ProductSvcImpl implements ProductSvc {

	@Inject
	// @Qualifier("prdocutDAOImplXML")
	ProductDAOImplXML pdao;
	
	@Override
	public ProductDTO getPDTO(String pnum) {
		return pdao.getPDTO(pnum);
	}

}
