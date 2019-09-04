package com.kh.flowerheal.student;

import static org.junit.Assert.assertTrue;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.inject.Inject;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.Data;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestUpdateJdbcTemplate {

	private static final Logger logger = LoggerFactory.getLogger(TestUpdateJdbcTemplate.class);
	
	@Inject
	JdbcTemplate jt;
	
	StringBuffer sql = null;
	
	@BeforeEach
	void before() {
		sql = new StringBuffer();
	}

	@Test
	@Disabled
	void update() {
		int[] score = {100,100,100};
		//int[] score = {90,90,90};
		String id = "id1";
		//update
		sql.append("update student set kor=?, eng=?, math=? where id=?");
		
		int cnt = jt.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, score[0]);
				pstmt.setInt(2, score[1]);
				pstmt.setInt(3, score[2]);
				pstmt.setString(4, id);
				return pstmt;
			}
		});
		logger.info("변경건수 = "+cnt);
		
		//select
		sql = new StringBuffer();
		sql.append("select kor, eng, math from student where id= ?");
	
		//StudentDTO sdto = jt.queryForObject(sql.toString(),new BeanPropertyRowMapper<>(StudentDTO.class),id);
		
		StudentDTO sdto = jt.queryForObject(sql.toString(), new RowMapper<StudentDTO>() {

			@Override
			public StudentDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				StudentDTO sdto = new StudentDTO();
				sdto.setKor(Integer.parseInt(rs.getString("kor")));
				sdto.setEng(Integer.parseInt(rs.getString("eng")));
				sdto.setMath(Integer.parseInt(rs.getString("math")));
				return sdto;
			}
		},id);
		
		
		boolean result = sdto.getKor() == score[0] &&
										 sdto.getEng() == score[1] &&
										 sdto.getMath() == score[2];
	
		assertTrue(result);
	}
	
	
	@Test
	@Disabled
	void update2() {
		//update
		sql.append("update student set kor=?, eng=?, math=? where id=?");
		
		int cnt = jt.update(sql.toString(), 90,90,90,"id2");
		logger.info("변경건수 : "+ cnt);
	}
	
	
	
	@Test
	@Disabled
	void update3() {

		//update
		sql.append("update student set kor=?, eng=?, math=? where id=?");
		
		int cnt = jt.update(sql.toString(),new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, 70);
				ps.setInt(2, 70);
				ps.setInt(3, 70);
				ps.setString(4, "id3");
				
			}
		});
		logger.info("변경건수 : "+ cnt);
	}
	
	
	
	@Test
	//@Disabled
	void update4() {
		
		//update
		sql.append("update student set kor=?, eng=?, math=? where id=?");
		
		int cnt = jt.update(sql.toString(),
												new Object[] {60,60,60,"id4"},
												new int[] {Types.INTEGER, Types.INTEGER, Types.INTEGER, Types.VARCHAR});
		
		logger.info("변경건수 : "+ cnt);
	}
	
	
	
	
	
	
	
	
	
}


