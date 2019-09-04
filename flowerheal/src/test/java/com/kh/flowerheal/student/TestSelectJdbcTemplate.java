package com.kh.flowerheal.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class TestSelectJdbcTemplate {

	private static final Logger logger = LoggerFactory.getLogger(TestSelectJdbcTemplate.class);

	@Inject
	JdbcTemplate jt;

	StringBuffer sql = null;

	@BeforeEach
	void before() {
		sql = new StringBuffer();
	}

	@Test
	@Disabled
	void select() {
		sql.append("select id,name,kor,eng,math from student");

		List<Map<String, Object>> list = null;
		// 하나의 레코드를 컬럼은 key, 값은 value로 매핑하여 맵 객체를 만들고 List에 담아올 때 사용
		list = jt.queryForList(sql.toString());

		/*
		 * for(Map<String,Object> map : list) { logger.info(map.toString()); }
		 */
		list.stream().forEach(map -> {
			logger.info(map.toString());
		});
	}

	@Test
	@Disabled
	void select2() {
		sql.append("select math from student");
		List<Integer> list = null;

		// 레코드 중에서 1개의 컬럼만을 기본타입으로 List에 담아올 때 사용
		list = jt.queryForList(sql.toString(), Integer.class);

		for (Integer i : list) {
			logger.info(i.toString());
		}
	}

	@Test
	@Disabled
	void select3() {
		sql.append("select id,name,kor,eng,math from student where kor > ? and math > ?");

		List<Map<String, Object>> list = null;
		list = jt.queryForList(sql.toString(), 50, 50);

		/*
		 * for(Map<String,Object> map : list) { logger.info(map.toString()); }
		 */
		list.stream().forEach(map -> {
			logger.info(map.toString());
		});
	}

	@Test
	@Disabled
	void select4() {
		sql.append("select name from student where kor > ? and math > ?");

		List<String> list = null;
		list = jt.queryForList(sql.toString(), String.class, 50, 50);

		for (String name : list) {
			logger.info(name.toString());
		}
	}

	@Test
	@Disabled
	void select5() {
		sql.append("select name from student where kor > ? and math > ?");

		List<Map<String, Object>> list = null;
		list = jt.queryForList(sql.toString(), new Object[] { 50, 50 }, new int[] { Types.INTEGER, Types.INTEGER });

		for (Map<String, Object> map : list) {
			logger.info(map.toString());
		}
	}

	@Test
	@Disabled
	void select6() {
		sql.append("select name from student where kor > ? and math > ?");

		List<String> list = null;
		list = jt.queryForList(sql.toString(), new Object[] { 50, 50 }, new int[] { Types.INTEGER, Types.INTEGER },
				String.class);

		for (String name : list) {
			logger.info(name.toString());
		}
	}

	// ^: 레코드가 2개 이상
	// ===========================
	//

	@Test
	@Disabled
	void select10() {
		sql.append("select name from student where id = 'id1'");
		String name = jt.queryForObject(sql.toString(), String.class);
		logger.info("이름:" + name);
	}

	@Test
	@Disabled
	void select11() {
		sql.append("select id,name,kor,eng,math from student where id = 'id2'");
		StudentDTO sdto = jt.queryForObject(sql.toString(), new RowMapper<StudentDTO>() {

			@Override
			public StudentDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				StudentDTO sdto = new StudentDTO();
				sdto.setId(rs.getString("id"));
				sdto.setName(rs.getString("name"));
				sdto.setKor(rs.getInt("kor"));
				sdto.setEng(rs.getInt("eng"));
				sdto.setMath(rs.getInt("math"));
				return sdto;
			}
		});
		logger.info("student:" + sdto.toString());
	}

	@Test
	@Disabled
	void select12() {
		sql.append("select name from student where id = ?");
		String name = jt.queryForObject(sql.toString(), String.class, "id2");
		logger.info("이름:" + name);
	}

	@Test
	@Disabled
	void select13() {
		sql.append("select name from student where kor = ? and eng = ? and math = ?");
		String name = jt.queryForObject(sql.toString(), new Object[] { 100, 100, 100 }, String.class);
		logger.info("이름:" + name);
	}

	
	
	@Test
	@Disabled
	void select14() {
		sql.append("select id,name,kor,eng,math from student where kor = ? and eng = ? and math = ?");
		StudentDTO sdto = jt.queryForObject(sql.toString(), new Object[] { 100, 100, 100 }, new RowMapper<StudentDTO>() {

			@Override
			public StudentDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				StudentDTO sdto = new StudentDTO();
				sdto.setId(rs.getString("id"));
				sdto.setName(rs.getString("name"));
				sdto.setKor(rs.getInt("kor"));
				sdto.setEng(rs.getInt("eng"));
				sdto.setMath(rs.getInt("math"));
				return sdto;
			}
		});
		logger.info("student:" + sdto.toString());
	}
	
	
	
	@Test
	@Disabled
	void select15() {
		sql.append("select id,name,kor,eng,math from student where kor = ? and eng = ? and math = ?");
		StudentDTO sdto = jt.queryForObject(sql.toString(),new RowMapper<StudentDTO>() {

			@Override
			public StudentDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				StudentDTO sdto = new StudentDTO();
				sdto.setId(rs.getString("id"));
				sdto.setName(rs.getString("name"));
				sdto.setKor(rs.getInt("kor"));
				sdto.setEng(rs.getInt("eng"));
				sdto.setMath(rs.getInt("math"));
				return sdto;
			}
		},100,100,100);
		logger.info("student:" + sdto.toString());
	}
	
	
	
	@Test
	@Disabled
	void select16() {
		sql.append("select name from student where kor = ? and eng = ? and math = ?");
		String name = jt.queryForObject(sql.toString(),
																		new Object[] {100,100,100},
																		new int[] {Types.INTEGER,Types.INTEGER,Types.INTEGER},
																		String.class);
		
		logger.info("name:" + name);
	}
	
	
	@Test
	@Disabled
	void select17() {
		sql.append("select id,name,kor,eng,math from student where kor = ? and eng = ? and math = ?");
		StudentDTO sdto = jt.queryForObject(sql.toString(),
																		new Object[] {100,100,100},
																		new int[] {Types.INTEGER,Types.INTEGER,Types.INTEGER},
																		new BeanPropertyRowMapper<StudentDTO>(StudentDTO.class));
		
		logger.info("student:" + sdto.toString());
	}
	

	// =======================================
	@Test
	@Disabled
	void select20() {
		sql.append("select * from student where id = 'id1'");
		
		Map<String,Object> map = jt.queryForMap(sql.toString());
		logger.info("id : " + map.get("id").toString());
		logger.info("name : " + map.get("name").toString());
		logger.info("kor : " + map.get("kor").toString());
		logger.info("eng : " + map.get("eng").toString());
		logger.info("math : " + map.get("math").toString());
	}
	
	
	@Test
	@Disabled
	void select21() {
		sql.append("select * from student where id = ?");
		Map<String,Object> map = jt.queryForMap(sql.toString(),"id1");
		
		logger.info("id : " + map.get("id").toString());
		logger.info("name : " + map.get("name").toString());
		logger.info("kor : " + map.get("kor").toString());
		logger.info("eng : " + map.get("eng").toString());
		logger.info("math : " + map.get("math").toString());
	}
	
	
	
	@Test
	@Disabled
	void select22() {
		sql.append("select * from student where id = ?");
		Map<String,Object> map = jt.queryForMap(sql.toString(),new Object[] {"id1"}, new int[] {Types.VARCHAR});
		
		logger.info("id : " + map.get("id").toString());
		logger.info("name : " + map.get("name").toString());
		logger.info("kor : " + map.get("kor").toString());
		logger.info("eng : " + map.get("eng").toString());
		logger.info("math : " + map.get("math").toString());
	}
	
	
	// =======================================	
	@Test
	//@Disabled
	void select30() {
		sql.append("select id,name,kor,eng,math from student where kor = ? and eng = ? and math = ?");
		StudentDTO student = jt.query(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, 100);
				pstmt.setInt(2, 100);
				pstmt.setInt(3, 100);
				return pstmt;
			}
		}, new ResultSetExtractor<StudentDTO>() {

			@Override
			public StudentDTO extractData(ResultSet rs) throws SQLException, DataAccessException {
				
				StudentDTO sdto = new StudentDTO();
				if(rs.next()) {
					sdto.setId(rs.getString("id"));
					sdto.setName(rs.getString("name"));
					sdto.setKor(rs.getInt("kor"));
					sdto.setEng(rs.getInt("eng"));
					sdto.setMath(rs.getInt("math"));					
				}
				return sdto;
			}
		});
		logger.info("student:"+student);
	}
	
	
	
}
