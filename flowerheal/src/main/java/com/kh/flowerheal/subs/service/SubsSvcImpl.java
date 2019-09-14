package com.kh.flowerheal.subs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.flowerheal.subs.dao.SubsDAOImplXML;
import com.kh.flowerheal.subs.dto.SubsDTO;

@Service
public class SubsSvcImpl implements SubsSvc {

	
	@Inject
	SubsDAOImplXML sdao;
	
	@Override
	public SubsDTO getSDTO(String snum) {
		return sdao.getSDTO(snum);
	}

	@Override
	public int addSubs(SubsDTO sdto) {
		return sdao.addSubs(sdto);
	}

	@Override
	public int changeAddr(SubsDTO sdto) {
		return sdao.changeAddr(sdto);
	}

	@Override
	public int delivery(SubsDTO sdto) {
		return sdao.delivery(sdto);
	}

	@Override
	public int cancelSubs(String snum) {
		return sdao.cancelSubs(snum);
	}

	@Override
	public int changeSubs(SubsDTO sdto) {
		return sdao.changeSubs(sdto);
	}

	@Override
	public int endSubs(SubsDTO sdto) {
		return sdao.endSubs(sdto);
	}


}
