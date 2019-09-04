package com.kh.flowerheal;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

@ExtendWith(SpringExtension.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
class DBconnection {

	private static final Logger logger = LoggerFactory.getLogger(DBconnection.class);

	@Inject
	// @Autowired
	DataSource dataSource;

	@Inject
//	JdbcTemplate jdbcTemplate;

	@Test
	void testdb() {
		// System.out.println("데이터소스:"+dataSource);
		logger.info("데이터소스:" + dataSource);
		try {
			Connection conn = dataSource.getConnection();
			logger.info("db연결 성공!!:" + conn);
		} catch (SQLException e) {
			fail("db연결 실패!!");
			e.printStackTrace();
		}
	}

//	@Test 
//	@Disabled
//	void testJdbcTemplate() {
//		logger.info("JdbcTemplate:"+jdbcTemplate);
//		try {
//			Connection conn = jdbcTemplate.getDataSource().getConnection();
//			logger.info("db연결 성공!!:"+conn);
//		} catch (SQLException e) {
//			fail("db연결 실패!!");
//			e.printStackTrace();
//		}
//	}

}
