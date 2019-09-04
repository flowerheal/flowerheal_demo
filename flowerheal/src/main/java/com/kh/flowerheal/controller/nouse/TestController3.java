package com.kh.flowerheal.controller.nouse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.flowerheal.member.dto.MemberDTO;

@Controller
@RequestMapping("/test3")
public class TestController3 {

	private static final Logger logger = LoggerFactory.getLogger(TestController3.class);
	
	//case 1) Model, String
	@PostMapping("/member")
	public String member(MemberDTO mdto,Model model) {
		logger.info(model.toString());
		logger.info(mdto.toString());
		model.addAttribute("mdto", mdto);
		return "/test/member";
	}
	
	//case 2) ModelAndView 객체 새용
	@PostMapping("/member2")
	public ModelAndView member(MemberDTO mdto) {
		logger.info(mdto.toString());
		ModelAndView mav = new ModelAndView("/test/member");
		mav.addObject("mdto", mdto);
//		mav.setViewName("/test/member");
		return mav;
	}
	
}
