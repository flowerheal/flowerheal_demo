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

import com.kh.flowerheal.bbs.dto.BbsDTO;

@Repository
public class BbsDAOImplJDBC implements BbsDAO {

	private static final Logger logger = 
			LoggerFactory.getLogger("BbsDAOImplJDBC.class");
	
	@Inject
	private JdbcTemplate jt;

  //게시글 작성
	@Override
	public int write(BbsDTO bbsDTO) {
		int cnt=0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("insert into board ");
		sql.append("(bnum,btitle,bid,bnickname,bhit,bcontent,bgroup,bstep,bindent) ");
		sql.append("values(board_seq.nextval,?,?,?,0,?,board_seq.currval,0,0) ");
		
		cnt = jt.update(sql.toString(),
							bbsDTO.getBtitle(),bbsDTO.getBid(),bbsDTO.getBnickname(),
							bbsDTO.getBcontent());
		
		return cnt;
	}

  //게시글 수정
	@Override
	public int modify(BbsDTO bbsDTO) {
		int cnt = 0;
		
		StringBuffer sql = new StringBuffer();
				
		sql.append("update board ");
		sql.append("   set btitle=?, budate=sysdate, bcontent=? ");
		sql.append(" where bnum=? ");
		
		cnt = jt.update(sql.toString(), new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, bbsDTO.getBtitle());
				ps.setString(2, bbsDTO.getBcontent());
				ps.setInt(3, bbsDTO.getBnum());
			}
		});
		return cnt;
	}

	
  //게시글 삭제	
	@Override
	public int delete(String bnum) {
		int cnt = 0;
		StringBuffer sql = new StringBuffer();
		
		sql.append("delete from board where bnum = ? ");
		
		cnt = jt.update(sql.toString(), bnum);
		return cnt;
	}

	
  //게시글 보기	
	@Override
	public BbsDTO view(String bnum) {
		BbsDTO bbsDTO = new BbsDTO();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select bnum,btitle,bid,bnickname,bcdate,budate, ");
		sql.append("       bhit,bcontent,bgroup,bstep,bindent ");
		sql.append("  from board ");
		sql.append(" where bnum = ? ");
		
		bbsDTO = jt.queryForObject(sql.toString(),
											new BeanPropertyRowMapper<BbsDTO>(BbsDTO.class), bnum);
//		new BeanPropertyRowMapper<BbsDTO>(), bnum);
		
		if(bbsDTO.getBid() != null) {
			//조회수증가
			updateHit(bnum);			
		}
		
		return bbsDTO;
	}


	//조회수증가	
	public void updateHit(String bnum) {
		
		StringBuffer sql = new StringBuffer();
		sql.append("update board set bhit = bhit + 1 ");
		sql.append(" where bnum = ? ");
		jt.update(sql.toString(), bnum);
	}
	
	
  //===게시글 목록보기==
	//1)전체
	@Override
	public List<BbsDTO> list() {
		List<BbsDTO> list = new ArrayList<>();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select bnum,btitle,bid,bnickname,bcdate,budate, ");
		sql.append("       bhit,bcontent,bgroup,bstep,bindent ");
		sql.append("  from board ");


		list = jt.query(sql.toString(), new RowMapper<BbsDTO>() {

			@Override
			public BbsDTO mapRow(ResultSet rs, int rowNum) throws SQLException {

					BbsDTO bbsDTO = new BbsDTO();
					bbsDTO.setBnum(rs.getInt("bnum"));
					bbsDTO.setBtitle(rs.getString("btitle"));
					bbsDTO.setBid(rs.getString("bid"));
					bbsDTO.setBnickname(rs.getString("bnickname"));
					bbsDTO.setBcdate(rs.getDate("bcdate"));
					bbsDTO.setBudate(rs.getDate("budate"));
					bbsDTO.setBhit(rs.getInt("bhit"));
					bbsDTO.setBcontent(rs.getString("bcontent"));
					bbsDTO.setBgroup(rs.getInt("bgroup"));
					bbsDTO.setBstep(rs.getInt("bstep"));
					bbsDTO.setBindent(rs.getInt("bindent"));
					
					return bbsDTO;
				}
			
		});
		return list;
	}

	
	//2)검색어 없는경우
	@Override
	public List<BbsDTO> list(int startRec, int endRec) {
		List<BbsDTO> list = new ArrayList<>();
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("select t2.* ");
	  sql.append("from ( select row_number() over (order by bgroup desc, bstep asc) as num, t1.* ");
	  sql.append("         from board t1 ) t2 ");
	  sql.append("where num between ? and ? ");


		list = jt.query(sql.toString(), 
						 new RowMapper<BbsDTO>() {

							@Override
							public BbsDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
								BbsDTO bbsDTO = new BbsDTO();
								bbsDTO.setBnum(rs.getInt("bnum"));
								bbsDTO.setBtitle(rs.getString("btitle"));
								bbsDTO.setBid(rs.getString("bid"));
								bbsDTO.setBnickname(rs.getString("bnickname"));
								bbsDTO.setBcdate(rs.getDate("bcdate"));
								bbsDTO.setBudate(rs.getDate("budate"));
								bbsDTO.setBhit(rs.getInt("bhit"));
								bbsDTO.setBcontent(rs.getString("bcontent"));
								bbsDTO.setBgroup(rs.getInt("bgroup"));
								bbsDTO.setBstep(rs.getInt("bstep"));
								bbsDTO.setBindent(rs.getInt("bindent"));
								
								return bbsDTO;
							}
						}, startRec, endRec);
		
	  return list;
	}

	
	//3)검색어 있는경우
	@Override
	public List<BbsDTO> list(int startRec, int endRec, String searchType, String keyword) {

		List<BbsDTO> list = new ArrayList<>();
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("select t2.* ");
	  sql.append("from ( select row_number() over (order by bgroup desc, bstep asc) as num, t1.* ");
	  sql.append("         from board t1 ");
		sql.append("        where bnum > 0 "); 
					  switch(searchType) {
					  case	"TC" ://제목+내용
					  	sql.append("and btitle   	like '%' || ? || '%' ");
					  	sql.append(" or bcontent 	like '%' || ? || '%' ");
					  	break;
					  case	"T" :	//제목
					  	sql.append("and btitle   	like '%' || ? || '%' ");	  
					  	break;
					  case	"C" :	//내용
					  	sql.append("and bcontent   like '%' || ? || '%' ");	  
					  	break;
					  case	"N" :	//작성자(별칭)
					  	sql.append("and bnickname like '%' || ? || '%' ");		  
					  	break;
					  case	"I" :	//아이디
					  	sql.append("and bid   		like '%' || ? || '%' ");		 	  	
					  	break;
					  	
					  default : // 제목 + 내용+ 작성자(별칭)
					  	sql.append("and btitle   	like '%' || ? || '%' ");
					  	sql.append(" or bcontent 	like '%' || ? || '%' ");	 
					  	sql.append(" or bnickname like '%' || ? || '%' ");	 	  	
					  	break;
					  }  
	  sql.append("    ) t2 ");
	  sql.append("where num between ? and ? ");
	  
	  switch(searchType) {
	  case	"TC" ://제목+내용
	  	list = jt.query(sql.toString(),
	  									new BeanPropertyRowMapper<BbsDTO>(BbsDTO.class),
	  									keyword,keyword,startRec,endRec);
	  	break;
		case "T" : //제목
		case "C" : //내용
		case "N" : //작성자(별칭)
		case "I" : //아이디	
	  	list = jt.query(sql.toString(),
											new BeanPropertyRowMapper<BbsDTO>(BbsDTO.class),
											keyword,startRec,endRec);	 	  	
	  	break;
	  	
	  default : // 제목 + 내용+ 작성자(별칭)
	  	list = jt.query(sql.toString(),
					new BeanPropertyRowMapper<BbsDTO>(BbsDTO.class),
					keyword,keyword,keyword,startRec,endRec); 	  	
	  	break;
	  }
		return list;
	}

	
	//게시글 답글
	@Override
	public int reply(BbsDTO bbsDTO) {
		int cnt=0, cnt2=0;
		
		//1) 이전 답글 step업데이트
		cnt2 = updateStep(bbsDTO.getBgroup(), bbsDTO.getBstep());

		//2) 답글 달기
		StringBuffer sql = new StringBuffer();
		sql.append("insert into board ");
		sql.append("(bnum,btitle,bid,bnickname,bhit,bcontent,bgroup,bstep,bindent) ");
		sql.append("values(board_seq.nextval,?,?,?,0,?,?,?,?) ");
		
		cnt = jt.update(sql.toString(), 
										bbsDTO.getBtitle(), 
										bbsDTO.getBid(), 
										bbsDTO.getBnickname(),
										bbsDTO.getBcontent(), 
										
										bbsDTO.getBgroup(), 			//원글의 bgroup값 반영
										bbsDTO.getBstep() + 1,		//원글의 bstep + 1 값 반영
										bbsDTO.getBindent() + 1);	//원글의 bindent + 1 값 반영
		return cnt;
	}

	private int updateStep(int bgroup, int bstep) {
		int cnt=0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("update board ");
		sql.append("   set bstep = bstep + 1 ");
	  sql.append(" where bgroup = ? and bstep > ? "); 

	  cnt = jt.update(sql.toString(), bgroup, bstep);
	
		return cnt;
	}
	
	
	//=== 게시글 총계 ===
	//1)검색어 없는경우
	@Override
	public int totalRec() {
		int cnt=0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select count(bnum) toalcnt from board ");
		cnt = jt.queryForObject(sql.toString(), Integer.class);
		return cnt;
	}
	
	//2)검색어 있는경우
	@Override
	public int searchTotalRec(String searchType, String keyword) {
		int totalRec = 0;
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("select count(bnum) totalRec ");
	  sql.append("from ( select row_number() over (order by bgroup desc, bstep asc) as num, t1.* ");
	  sql.append("         from board t1 ");
		sql.append("        where bnum > 0 "); 
					  switch(searchType) {
					  case	"TC" ://제목+내용
					  	sql.append("and btitle   	like '%' || ? || '%' ");
					  	sql.append(" or bcontent 	like '%' || ? || '%' ");
					  	break;
					  case	"T" :	//제목
					  	sql.append("and btitle   	like '%' || ? || '%' ");	  
					  	break;
					  case	"C" :	//내용
					  	sql.append("and bcontent   like '%' || ? || '%' ");	  
					  	break;
					  case	"N" :	//작성자(별칭)
					  	sql.append("and bnickname like '%' || ? || '%' ");		  
					  	break;
					  case	"I" :	//아이디
					  	sql.append("and bid   		like '%' || ? || '%' ");		 	  	
					  	break;
					  	
					  default : // 제목 + 내용+ 작성자(별칭)
					  	sql.append("and btitle   	like '%' || ? || '%' ");
					  	sql.append(" or bcontent 	like '%' || ? || '%' ");	 
					  	sql.append(" or bnickname like '%' || ? || '%' ");	 	  	
					  	break;
					  }  
	  sql.append("    ) t2 ");
	  
	  switch(searchType) {
	  case	"TC" ://제목+내용
	  	totalRec = jt.queryForObject(sql.toString(),
	  															 new Object[] {keyword,keyword}, Integer.class);
	  	break;
		case "T" : //제목
		case "C" : //내용
		case "N" : //작성자(별칭)
		case "I" : //아이디	
	  	totalRec = jt.queryForObject(sql.toString(),
	  															 new Object[] {keyword}, Integer.class); 	
	  	break;
	  	
	  default : // 제목 + 내용+ 작성자(별칭)
	  	totalRec = jt.queryForObject(sql.toString(),
					 												 new Object[] {keyword,keyword,keyword}, Integer.class); 	
	  	break;
	  }
		return totalRec;
	}

}
