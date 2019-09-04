package com.kh.flowerheal.controller.nouse;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.flowerheal.common.Code;
import com.kh.flowerheal.controller.MemberController;
import com.kh.flowerheal.test.MemberDTO;

@Controller
@RequestMapping("/test")
public class TestController10 {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	//@GetMapping("")
	
	@ModelAttribute
	public void initRegion(Model model) {
		List<Code> list = new ArrayList<>();
		list.add(new Code("01","서울"));
		list.add(new Code("02","대전"));
		list.add(new Code("03","대구"));
		list.add(new Code("04","울산"));
		list.add(new Code("05","부산"));
		
		model.addAttribute("region",list);
	}

	@GetMapping("/join")
	public String join(Model model) {
		model.addAttribute("memberDTO", new MemberDTO());
		return "test/memberJoinForm";
	}
	
	@PostMapping("/memberJoin")
	public String memberJoin(
			@Valid @ModelAttribute MemberDTO memberDTO,
			BindingResult result) {
		
		
		
		if(result.hasErrors()) {
			logger.info(result.toString());
			return "test/memberJoinForm";
		}
		return "redirect:/";
	}



}
