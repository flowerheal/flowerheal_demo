package com.kh.flowerheal.member.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.flowerheal.member.dto.MemberDTO;
import com.kh.flowerheal.member.dto.PasswordDTO;

@Repository //@Controller, @Service => @Component
public class MemberDAOImplJDBC implements MemberDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImplJDBC.class);
	
	//root-context의 bean 쓸 수 있다. bean은 힙메모리에 올라와있어서 new 안써도 instance로 쓸 수 있다.
	//@Autowired //스프링프레임워크에서 제공하는 어노테이션
	@Inject  //자바표준 어노테이션 : 컨텍스트에 등록된 빈을 참조한다.
	private JdbcTemplate jdbcTemplate;

	// 회원가입 시 아이디 중복체크
	@Override
	public int hasId(String id) {
		int cnt = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select count(id) from member where id = ? ");

		cnt = jdbcTemplate.queryForObject(sql.toString(),
					new Object[] {id},Integer.class);

		return cnt;
	}

	
	
	// 회원 등록
	@Override
	public int insert(MemberDTO memberDTO) {
		int cnt = 0;
		logger.info(memberDTO.toString());
		
		StringBuffer sql = new StringBuffer();
		sql.append("insert into member (id,pw,tel,gender,region,nickname,birth) ");
		sql.append("values(?,?,?,?,?,?,?)");
		
		cnt = jdbcTemplate.update(sql.toString(),
				memberDTO.getId(),memberDTO.getPw(),memberDTO.getTel(),	memberDTO.getGender(),
				memberDTO.getRegion(),memberDTO.getNickname());
		
		return cnt;
	}

	// 회원 수정 : 비밀번호 제외
	@Override
	public int modify(MemberDTO memberDTO) {
		int cnt = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("update member ");
		sql.append("   set tel=?, nickname=?, gender=?, region=?, udate=sysdate ");
		sql.append(" where id=? ");
		
		cnt = jdbcTemplate.update(sql.toString(),
				memberDTO.getTel(),memberDTO.getNickname(),memberDTO.getGender(),
				memberDTO.getRegion(),memberDTO.getId());
		
		return cnt;
	}
	 //회원 수정 : 비밀번호 수정
	@Override
	public	int modifyPw(PasswordDTO pdto) {
		int cnt = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("update member ");
		sql.append("   set pw=?, udate=sysdate ");
		sql.append(" where id=? and pw=? ");
		
		cnt = jdbcTemplate.update(sql.toString(),
				pdto.getNewPw(),pdto.getId(),pdto.getNowPw());
		
		return cnt;
	}

	// 회원 삭제(회원용:탈퇴)
	@Override
	public int delete(String id, String pw) {
		int cnt = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("delete from member where id=? and pw=? ");
		
		cnt = jdbcTemplate.update(sql.toString(),id,pw);
		
		return cnt;
	}

	// 회원 삭제(관리자용)
	@Override
	public int delByManager(String id) {
		int cnt = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("delete from member where id=? ");
		
		cnt = jdbcTemplate.update(sql.toString(),id);
		
		return cnt;
	}

	// 회원 개인 조회
	@Override
	public MemberDTO getMember(String id) {
		MemberDTO mdto = new MemberDTO();
		 
		StringBuffer sql = new StringBuffer();
		sql.append("select id,pw,tel,nickname,gender,region,birth ");
		sql.append("  from member ");
		sql.append(" where id=? ");
		

		mdto = jdbcTemplate.queryForObject(
				sql.toString(), 
				new Object[]{id},
				new BeanPropertyRowMapper<>(MemberDTO.class));
		
		return mdto;
	}

	// 회원 목록 조회(관리자용)
	@Override
	public List<MemberDTO> getMemberList() {
		List<MemberDTO> list = new ArrayList<>();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select id,pw,tel,nickname,gender,region,birth,cdate,udate from member ");
		
		list = jdbcTemplate.query(sql.toString(),	new BeanPropertyRowMapper<>(MemberDTO.class));
		
		return list;
	}


	
}
