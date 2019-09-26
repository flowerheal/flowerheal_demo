package com.kh.flowerheal.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.flowerheal.member.dto.MemberDTO;
import com.kh.flowerheal.member.dto.PasswordDTO;

@Repository
public class MemberDAOImplXML implements MemberDAO {

    private static final Logger logger = LoggerFactory.getLogger("MemberDAOImplXML.class");

    @Inject
    private SqlSession sqlSession;

    // 회원가입 시 아이디 중복체크
    @Override
    public int hasId(String id) {
	logger.info("MemberDAOImplXML.hasId 호출됨");
	return sqlSession.selectOne("mappers.member-mapper.hasId", id);
    }

    // 회원등록
    @Override
    public int insert(MemberDTO memberDTO) {
	logger.info("MemberDAOImplXML.insert 호출됨");
	return sqlSession.insert("mappers.member-mapper.insert", memberDTO);
    }

    // 회원 수정 : 비밀번호 제외
    @Override
    public int modify(MemberDTO memberDTO) {
	logger.info("MemberDAOImplXML.modify 호출됨");
	return sqlSession.update("mappers.member-mapper.modify", memberDTO);
    }

    // 회원수정 : 비밀번호
    @Override
    public int modifyPw(PasswordDTO pdto) {
	logger.info("MemberDAOImplXML.modifyPw 호출됨");
	return sqlSession.update("mappers.member-mapper.modifyPw", pdto);
    }

    // 회원삭제(회원용:탈퇴)
    @Override
    public int delete(String id, String pw) {
	logger.info("MemberDAOImplXML.delete 호출됨");
	Map<String, String> map = new HashMap<>();
	map.put("id", id);
	map.put("pw", pw);
	return sqlSession.delete("mappers.member-mapper.delete", map);
    }

    // 회원삭제(관리자용)
    @Override
    public int delByManager(String id) {
	logger.info("MemberDAOImplXML.delByManager 호출됨");
	return sqlSession.delete("mappers.member-mapper.delByManager", id);
    }

    // 회원 개인조회
    @Override
    public MemberDTO getMember(String id) {
	logger.info("MemberDAOImplXML.getMember 호출됨");
	return sqlSession.selectOne("mappers.member-mapper.getMember", id);
    }

    // 회원 목록조회(관리자용)
    @Override
    public List<MemberDTO> getMemberList() {
	logger.info("MemberDAOImplXML.getMemberList 호출됨");
	return sqlSession.selectList("mappers.member-mapper.getMemberList");
    }

	@Override
	public int changeAddr(String id, String zipNo, String roadAddrPart1, String addrDetail) {
		logger.info("MemberDAOImplXML.changeAddr 호출됨");
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("zipNo", zipNo);
		map.put("roadAddrPart1", roadAddrPart1);
		map.put("addrDetail", addrDetail);
		return sqlSession.update("mappers.member-mapper.changeAddr", map);
	}

}
