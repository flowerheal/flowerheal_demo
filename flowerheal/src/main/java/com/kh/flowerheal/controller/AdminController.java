package com.kh.flowerheal.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.flowerheal.subs.service.SubsSvc;

@RequestMapping("/admin")
@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private SubsSvc sSvc;
	
	
	@GetMapping("/subsList")
	public String subsList(Model model) {
		logger.info("어드민 - 구독관리 페이지 호출");
		
		// List<SubsDTO> list = new ArrayList<>();
		// list = sSvc.getSubsList();
		
		
		// model.addAttribute("list", list);
		
		return "admin/subsList";
	}
	
}
