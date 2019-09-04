package com.kh.flowerheal.bbs.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.flowerheal.bbs.dto.RbbsDTO;

@Repository
public class RbbsDAOImplXML implements RbbsDAO {
	
	private static final Logger logger = 
			LoggerFactory.getLogger("RbbsDAOImplXML.class");

	@Override
	public int write(RbbsDTO rbbsDTO) {
		//
		return 0;
	}

	@Override
	public List<RbbsDTO> list(String bnum) {
		//
		return null;
	}

	@Override
	public List<RbbsDTO> list(String bnum, int startRec, int endRec) {
		//
		return null;
	}

	@Override
	public int modify(RbbsDTO rbbsDTO) {
		//
		return 0;
	}

	@Override
	public int delete(String rnum) {
		//
		return 0;
	}

	@Override
	public int goodOrBad(String rnum, String goodOrBad) {
		//
		return 0;
	}

	@Override
	public int reply(RbbsDTO rbbsDTO) {
		//
		return 0;
	}

	@Override
	public int replyTotalRec(String bnum) {
		//
		return 0;
	}
	
//	@Inject
//	private JdbcTemplate jt;
//
//	//댓글 등록
//	@Override
//	public int write(RbbsDTO rbbsDTO) {
//		int cnt = 0;
//		StringBuffer sql = new StringBuffer();
//		sql.append("INSERT INTO replyboard (rnum,bnum,rid,rnickname,rcontent,rgroup,rstep,rindent) ");
//		sql.append("values(rboard_seq.nextval,?,?,?,?,rboard_seq.currval,0,0) ");
//		
//		cnt = jt.update(sql.toString(), new PreparedStatementSetter() {
//			
//			@Override
//			public void setValues(PreparedStatement ps) throws SQLException {
//				ps.setInt(1, rbbsDTO.getBnum());
//				ps.setString(2, rbbsDTO.getRid());
//				ps.setString(3, rbbsDTO.getRnickname());
//				ps.setString(4, rbbsDTO.getRcontent());
//				
//			}
//		});
////		
////		cnt = jt.update(sql.toString(),
////										rbbsDTO.getBnum(),rbbsDTO.getRid(),rbbsDTO.getRnickname(),rbbsDTO.getRcontent());
//		return cnt;
//	}
//
//	
//	//댓글 목록(1)
//	@Override
//	public List<RbbsDTO> list(String bnum) {
//
//		List<RbbsDTO> alist = new ArrayList<>();
//		StringBuffer sql = new StringBuffer();
//		sql.append("SELECT rnum,bnum,rid,rnickname,rcdate,rudate, ");
//		sql.append("	     rcontent,rgood,rbad,rgroup,rstep,rindent ");
//		sql.append("  FROM (select * from replyboard ");
//		sql.append("         where bnum = ? ");		
//		sql.append("        order by rgroup desc, rstep asc ) ");		
//		sql.append(" where rownum >=1 and rownum < 25 ");	
//
//// case1)
////		alist = jt.query(sql.toString(),
////										 new RowMapper<RbbsDTO>() {
////
////												@Override
////												public RbbsDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
////									
////													RbbsDTO rbbsDTO = new RbbsDTO();
////													rbbsDTO.setRnum(rs.getInt("rnum")); 
////													rbbsDTO.setBnum(rs.getInt("bnum")); 
////													rbbsDTO.setRid(rs.getString("rid")); 
////													rbbsDTO.setRnickname(rs.getString("rnickname")); 
////													rbbsDTO.setRcdate(rs.getTimestamp("rcdate")); 
////													rbbsDTO.setRudate(rs.getTimestamp("rudate"));  
////													rbbsDTO.setRcontent(rs.getString("rcontent"));
////													rbbsDTO.setRgood(rs.getInt("rgood"));
////													rbbsDTO.setRbad(rs.getInt("rbad"));
////													rbbsDTO.setRgroup(rs.getInt("rgroup")); 
////													rbbsDTO.setRstep(rs.getInt("rstep")); 
////													rbbsDTO.setRindent(rs.getInt("rindent")); 
////													
////													return rbbsDTO;
////												}
////											},
////										 bnum);
//
//// case2) case1 을 람다식으로
//		alist = jt.query( sql.toString(),
//										( rs, rowNum)-> {
//												
//												RbbsDTO rbbsDTO = new RbbsDTO();
//												rbbsDTO.setRnum(rs.getInt("rnum")); 
//												rbbsDTO.setBnum(rs.getInt("bnum")); 
//												rbbsDTO.setRid(rs.getString("rid")); 
//												rbbsDTO.setRnickname(rs.getString("rnickname")); 
//												rbbsDTO.setRcdate(rs.getTimestamp("rcdate")); 
//												rbbsDTO.setRudate(rs.getTimestamp("rudate"));  
//												rbbsDTO.setRcontent(rs.getString("rcontent"));
//												rbbsDTO.setRgood(rs.getInt("rgood"));
//												rbbsDTO.setRbad(rs.getInt("rbad"));
//												rbbsDTO.setRgroup(rs.getInt("rgroup")); 
//												rbbsDTO.setRstep(rs.getInt("rstep")); 
//												rbbsDTO.setRindent(rs.getInt("rindent")); 
//												
//												return rbbsDTO;											
//											},
//											bnum);
//
////case3)
////		alist = jt.query(sql.toString(),
////										 new BeanPropertyRowMapper<RbbsDTO>(RbbsDTO.class),
////										 bnum);
//		return alist;
//	}
//
//	//댓글 목록(2)
//	@Override
//	public List<RbbsDTO> list(String bnum, int startRec, int endRec) {
//		
//		List<RbbsDTO> alist = new ArrayList<>();
//		StringBuffer sql = new StringBuffer();
//		
//		sql.append("select t2.* ");
//		sql.append("from (select row_number() over (order by rgroup desc, rstep asc) as num,t1.* ");
//		sql.append("		    from replyboard t1 ");
//		sql.append("			 where bnum=? ) t2 ");
//		sql.append("where num between ? and ? ");
//		
//		alist = jt.query(sql.toString(),
//										 new Object[] {bnum, startRec, endRec},
//										 new RowMapper<RbbsDTO>() {
//				
//											@Override
//											public RbbsDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
//												
//												RbbsDTO rbbsDTO = new RbbsDTO();
//												rbbsDTO.setRnum(rs.getInt("rnum")); 
//												rbbsDTO.setBnum(rs.getInt("bnum")); 
//												rbbsDTO.setRid(rs.getString("rid")); 
//												rbbsDTO.setRnickname(rs.getString("rnickname")); 
//												rbbsDTO.setRcdate(rs.getTimestamp("rcdate")); 
//												rbbsDTO.setRudate(rs.getTimestamp("rudate"));  
//												rbbsDTO.setRcontent(rs.getString("rcontent"));
//												rbbsDTO.setRgood(rs.getInt("rgood"));
//												rbbsDTO.setRbad(rs.getInt("rbad"));
//												rbbsDTO.setRgroup(rs.getInt("rgroup")); 
//												rbbsDTO.setRstep(rs.getInt("rstep")); 
//												rbbsDTO.setRindent(rs.getInt("rindent")); 
//												
//												return rbbsDTO;
//											}
//										});
//		
//		return alist;
//	}
//
//	
//	//댓글 수정
//	@Override
//	public int modify(RbbsDTO rbbsDTO) {
//
//		int cnt = 0;
//		StringBuffer sql = new StringBuffer();
//		sql.append("update replyboard set rudate=sysdate, rcontent=? ");
//		sql.append("where rnum=? ");
//		
//		cnt = jt.update(sql.toString(), rbbsDTO.getRcontent(), rbbsDTO.getRnum());
//		return cnt;
//	}
//
//	//댓글 삭제
//	@Override
//	public int delete(String rnum) {
//
//		int cnt = 0;
//		StringBuffer sql = new StringBuffer();
//		sql.append("delete from replyboard where rnum=?");
//		
//		cnt = jt.update(sql.toString(), rnum);
//		return cnt;
//	}
//
//	//댓글 호감 비호감
//	@Override
//	public int goodOrBad(String rnum, String goodOrBad) {
//		int cnt = 0;
//		
//		StringBuffer sql = new StringBuffer();
//		
//		switch(goodOrBad) {
//		case "good":
//			sql.append("update replyboard set rgood = rgood + 1 where rnum=?");
//			break;
//		case "bad":
//			sql.append("update replyboard set rbad = rbad + 1 where rnum=?");			
//			break;
//		default:
//			break;
//		}
//		
//		cnt = jt.update(sql.toString(), rnum);
//		
//		return cnt;
//	}
//
//	//대댓글 등록
//	@Override
//	public int reply(RbbsDTO rbbsDTO) {
//		int cnt1=0 , cnt2=0;
//
//		//댓글대상 정보 읽어오기
//		RbbsDTO originDTO = replyView(rbbsDTO.getRnum());
//
//		//이전 답글 step 업데이트(원글그룹에 대한 세로정렬 재정의)
//		cnt1 = updateStep(originDTO.getRgroup(), originDTO.getRstep());
//		
//		StringBuffer sql = new StringBuffer();	
//		sql.append("INSERT INTO replyboard (rnum,bnum,rid,rnickname,rcontent,rgroup,rstep,rindent) ");
//		sql.append("VALUES (rboard_seq.nextval,?,?,?,?,?,?,?) ");		
//		
//		cnt2 = jt.update(sql.toString(), new PreparedStatementSetter() {
//			
//			@Override
//			public void setValues(PreparedStatement ps) throws SQLException {
//				ps.setInt(1, originDTO.getBnum());			
//				ps.setString(2, rbbsDTO.getRid());
//				ps.setString(3, rbbsDTO.getRnickname());
//				ps.setString(4, rbbsDTO.getRcontent());			
//				ps.setInt(5, originDTO.getRgroup());					//원글번호 = 원글 그룹
//				ps.setInt(6, originDTO.getRstep()+1);         //원글 그룹의 세로정렬(답글단계)
//				ps.setInt(7, originDTO.getRindent()+1);				//원글 그룹의 가로정렬(들여쓰기)
//				
//			}
//		});
//		
//		return cnt2;
//	}
//
//	// 댓글대상 읽어오기
//	private RbbsDTO replyView(int rnum) {
//		RbbsDTO rbbsDTO = new RbbsDTO();
//		
//		StringBuffer sql = new StringBuffer();
//		sql.append("select bnum,rgroup, rstep, rindent ");
//		sql.append("	from replyBoard where rnum = ? ");
//
//		rbbsDTO = jt.queryForObject(sql.toString(),
//																new BeanPropertyRowMapper<RbbsDTO>(RbbsDTO.class),
//																rnum);
//		return rbbsDTO;
//	}
//	
//	//댓글단계 업데이트
//	private int updateStep(int rgroup, int rstep) {
//		int cnt = 0;
//		
//		StringBuffer sql = new StringBuffer();
//		sql.append("update replyboard set rstep=rstep+1 where rgroup=? and rstep>?");
//		
//		cnt = jt.update(sql.toString(), rgroup, rstep);
//		return cnt;
//	}
//	
//	
//	
//	//대댓글 총계
//	@Override
//	public int replyTotalRec(String bnum) {
//		int totalRec = 0;
//		
//		StringBuffer sql = new StringBuffer();
//		sql.append("SELECT count(*) totalRec from replyboard where bnum=?");
//		
//		totalRec = jt.queryForObject(sql.toString(), Integer.class, bnum);
//		return totalRec;
//	}

}
