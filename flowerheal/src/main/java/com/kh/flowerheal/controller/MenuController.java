package com.kh.flowerheal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu")
public class MenuController {
	private static final Logger logger
	= LoggerFactory.getLogger(MenuController.class);

	String viewname = null;
	
	// 꽃미힐미 소개 페이지
	@GetMapping("/aboutUs")
	public String aboutUs(Model model) {
		logger.info("aboutUs() 호출됨");
		viewname = "/menu/aboutUs";
		return viewname;
	}
	// 원데이 클래스 페이지
	@GetMapping("/oneDayClass")
	public String oneDayClass(Model model) {
		logger.info("oneDayClass() 호출됨");
		viewname = "/menu/oneDayClass";
		return viewname;
	}
	// 상품 추천 페이지
	@GetMapping("/recommend")
	public String recommend(Model model) {
		logger.info("oneDayClass() 호출됨");
		viewname = "/menu/recommend";
		return viewname;
	}
}
