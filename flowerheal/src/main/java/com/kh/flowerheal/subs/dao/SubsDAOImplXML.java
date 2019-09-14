package com.kh.flowerheal.subs.dao;

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
	public int addSubs(SubsDTO sdto) {
		return sqlSession.insert("mappers.subs-mapper.addSubs", sdto);
	}

	@Override
	public int changeAddr(SubsDTO sdto) {

		return sqlSession.update("mappers.subs-mapper.changeAddr", sdto);
	}

	@Override
	public int delivery(SubsDTO sdto) {
		return sqlSession.update("mappers.subs-mapper.delivery",sdto);
	}

	@Override
	public int cancelSubs(String snum) {
		return sqlSession.delete("mappers.subs-mapper.cancelSubs", snum);
	}

	@Override
	public int changeSubs(SubsDTO sdto) {
		return sqlSession.update("mappers.subs-mapper.changeSubs", sdto);
	}

	@Override
	public int endSubs(SubsDTO sdto) {
		return 0;
	}

}
