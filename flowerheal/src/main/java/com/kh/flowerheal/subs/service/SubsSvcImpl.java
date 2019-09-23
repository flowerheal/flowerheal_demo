package com.kh.flowerheal.subs.service;

import java.util.List;

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
	public SubsDTO getLastOrderSDTO(String id) {
	    return sdao.getlastOrderSDTO(id);
	}

	@Override
	public List<SubsDTO> getMemberSubsList(String id) {
		return sdao.getMemberSubsList(id);
	}
	
	@Override
	public List<SubsDTO> getProductSubsList(String pnum) {
		return getProductSubsList(pnum);
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
	public int delivery(String snum) {
		return sdao.delivery(snum);
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
	public int endSubs(String snum) {
		return sdao.endSubs(snum);
	}

	@Override
	public List<SubsDTO> getSubsList() {
		return sdao.getSubsList();
	}

}
