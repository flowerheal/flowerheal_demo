package com.kh.flowerheal.login.dao;

import javax.inject.Inject;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.flowerheal.member.dto.MemberDTO;

@Repository
public abstract class LoginDAOImpl implements LoginDAO{

	@Inject
	private JdbcTemplate jdbcTemplate;
	
	//회원유무 체크
	@Override
	public int isMember(String id, String pw) {
		int cnt = 0;
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(id) cnt FROM member WHERE id = ? AND pw = ? ");
		cnt = jdbcTemplate.queryForObject(sql.toString(),
					new String[]{id,pw},Integer.class);

		return cnt;
	}

	// 회원 정보 가져오기
	@Override
	public MemberDTO getMember(String id, String pw, int cnt) {
		MemberDTO mdto = new MemberDTO();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT id, pw, tel, nickname, gender, region ");
		sql.append("  FROM member ");
		sql.append(" WHERE id = ? AND pw = ? ");
		
		mdto = jdbcTemplate.queryForObject(
				sql.toString(), 
				new String[]{id,pw},
				new BeanPropertyRowMapper<>(MemberDTO.class));
		
		return mdto;
	}

}
