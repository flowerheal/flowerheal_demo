package com.kh.flowerheal.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.flowerheal.member.dao.MemberDAO;
import com.kh.flowerheal.member.dto.MemberDTO;
import com.kh.flowerheal.member.dto.PasswordDTO;

@Service
public class MemberSvcImpl implements MemberSvc {

    @Inject
    @Qualifier("memberDAOImplXML")
    MemberDAO mDAO;

    // 회원가입 시 아이디 중복체크
    @Override
    public int hasId(String id) {
	int cnt = 0;
	if (id == "") {
	    cnt = -1;
	} else {
	    cnt = mDAO.hasId(id);
	}

	return cnt;
    }

    // 회원 등록
    @Override
    public int insert(MemberDTO memberDTO) {

	return mDAO.insert(memberDTO);
    }

    // 회원 수정 : 비밀번호 제외
    @Override
    public int modify(MemberDTO memberDTO) {

	return mDAO.modify(memberDTO);
    }

    // 회원 수정 : 비밀번호
    @Override
    public int modifyPw(PasswordDTO pdto) {

	return mDAO.modifyPw(pdto);
    }

    // 회원 삭제(회원용:탈퇴)
    @Override
    public int delete(String id, String pw) {

	return mDAO.delete(id, pw);
    }

    // 회원 삭제(관리자용)
    @Override
    public int delByManager(String id) {

	return mDAO.delByManager(id);
    }

    // 회원 개인 조회
    @Override
    public MemberDTO getMember(String id) {

	return mDAO.getMember(id);
    }

    // 회원 목록 조회(관리자용)
    @Override
    public List<MemberDTO> getMemberList() {

	return mDAO.getMemberList();
    }

	@Override
	public int changeAddr(String id, String zipNo, String roadAddrPart1, String addrDetail) {
		return mDAO.changeAddr(id, zipNo, roadAddrPart1, addrDetail);
	}

}
