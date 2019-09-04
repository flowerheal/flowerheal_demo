package com.kh.flowerheal.controller.nouse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test2")
public class TestController2 {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController2.class);
	
	@GetMapping("/member/{name}/{age}")
	public String member(@PathVariable String name,
											 @PathVariable String age) {
		logger.info(name +"+"+age);
		return "/test/member";
	}
	
}
