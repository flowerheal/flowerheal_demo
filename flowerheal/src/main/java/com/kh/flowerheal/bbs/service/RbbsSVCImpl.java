package com.kh.flowerheal.bbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.flowerheal.bbs.dao.RbbsDAO;
import com.kh.flowerheal.bbs.dto.RbbsDTO;

@Service
public class RbbsSVCImpl implements RbbsSVC {
	
	private static final Logger logger =
			LoggerFactory.getLogger(RbbsSVCImpl.class);
	
	@Inject
	@Qualifier("rbbsDAOImplJDBC")
	RbbsDAO rdao;
	
	
	@Override
	public int write(RbbsDTO rbbsDTO) {
		
		return rdao.write(rbbsDTO);
	}

	@Override
	public List<RbbsDTO> list(String bnum) {
		
		return rdao.list(bnum);
	}

	@Override
	public List<RbbsDTO> list(String bnum, int startRec, int endRec) {
		
		return rdao.list(bnum, startRec, endRec);
	}

	@Override
	public int modify(RbbsDTO rbbsDTO) {
		
		return rdao.modify(rbbsDTO);
	}

	@Override
	public int delete(String rnum) {
		
		return rdao.delete(rnum);
	}

	@Override
	public int goodOrBad(String rnum, String goodOrBad) {
		
		return rdao.goodOrBad(rnum, goodOrBad);
	}

	@Override
	public int reply(RbbsDTO rbbsDTO) {
		
		return rdao.reply(rbbsDTO);
	}

	@Override
	public int replyTotalRec(String bnum) {
		
		return rdao.replyTotalRec(bnum);
	}

}
