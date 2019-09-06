package com.kh.flowerheal.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.flowerheal.login.service.LoginSvc;
import com.kh.flowerheal.member.dto.MemberDTO;

@Controller
@RequestMapping("/login")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	private LoginSvc loginSvc;
	
	// 회원로그인 양식
	@GetMapping("/loginForm")
	public String memberLoginForm(Model model) {
		logger.info("memberLoginForm() 호출됨");
		model.addAttribute("mdto", new MemberDTO());
		return "/login/loginForm";
	}

//회원 로그인 처리
	@PostMapping("/memberLogin")
public String memberLogin(
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			HttpSession session) {

	logger.info("memberLogin() 호출됨");

	int cnt = loginSvc.isMember(id, pw);

	// 1이면 멤버, 2이면 관리자
	if(cnt==1 || cnt == 2) {
		MemberDTO calledMdto =loginSvc.getMember(id, pw, cnt);
		session.setAttribute("user", calledMdto);
		
		if( cnt == 1) {
			session.setAttribute("msg", "IsMember");			
		} else {
			session.setAttribute("msg", "IsAdmin");
		}
		return "redirect:/"; 
	}else {
		session.invalidate();
		return "/login/loginForm";
	}
}
	
	
	//로그아웃
	@GetMapping("/logOut")
	public String logOut(HttpSession session){
		session.invalidate();
		return "redirect:/login/loginForm";
	}

}
