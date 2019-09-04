package com.kh.flowerheal.controller.nouse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jquery")
public class TestJquery {
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@GetMapping("/test")
	public String jqueryTest() {
		return "test/jquery";
	}
}
