package com.kh.flowerheal.subs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.flowerheal.subs.dto.SubsDTO;

@Repository
public class SubsDAOImplXML implements SubsDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public SubsDTO getSDTO(String snum) {
		return sqlSession.selectOne("mappers.subs-mapper.getSDTO", snum);
	}
	
	@Override
	public SubsDTO getlastOrderSDTO(String id) {
	    	return sqlSession.selectOne("mappers.subs-mapper.getLastOrderSDTO", id);
	}
	
	@Override
	public List<SubsDTO> getMemberSubsList(String id) {
		return sqlSession.selectList("mappers.subs-mapper.getMemberSubsList", id);
	}
	
	@Override
	public List<SubsDTO> getProductSubsList(String pnum) {
		return sqlSession.selectList("mappers.subs-mapper.getProductSubsList", pnum);
	}
	
	@Override
	public int addSubs(SubsDTO sdto) {
		return sqlSession.insert("mappers.subs-mapper.addSubs", sdto);
	}

	@Override
	public int changeAddr(SubsDTO sdto) {

		return sqlSession.update("mappers.subs-mapper.changeAddr", sdto);
	}

	@Override
	public int delivery(String snum) {
		
		// 배송단계 subs_cnt = subs_cnt - 1    카운트  1감소
		int cnt = sqlSession.update("mappers.subs-mapper.delivery", snum);
		
		// 배송을 한 이후에 sbus_cnt == 0   인지 유무를 체크
		int result = sqlSession.selectOne("mappers.subs-mapper.findEndsubs",snum);		
		
		if(result == 0) {
			// 0이면 구독만료로 인해 subs_check = E 로 변경해줌.
			endSubs(snum);
		}
		return cnt;
	}

	@Override
	public int cancelSubs(String snum) {
		return sqlSession.update("mappers.subs-mapper.cancelSubs", snum);
	}

	@Override
	public int changeSubs(SubsDTO sdto) {
		return sqlSession.update("mappers.subs-mapper.changeSubs", sdto);
	}

	@Override
	public int endSubs(String snum) {
		return sqlSession.update("mappers.subs-mapper.endSubs", snum);
	}

	@Override
	public List<SubsDTO> getSubsList() {
		return sqlSession.selectList("mappers.subs-mapper.getSubsList");
	}



}
