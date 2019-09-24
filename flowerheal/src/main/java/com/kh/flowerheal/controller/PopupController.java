package com.kh.flowerheal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.flowerheal.common.mail.GmailSend;

@Controller
@RequestMapping("/popup")
public class PopupController {

	private static Logger logger = LoggerFactory.getLogger(PopupController.class);

	GmailSend mail = new GmailSend();

	@GetMapping("jusoPopup")
	public String jusoPopup() {
		// GET방식으로 호출하면 주소팝업창이 열리고
		return "popup/jusoPopup";
	}

	@PostMapping("jusoPopup")
	public String jusoPopup2() {
		// POST방식으로 호출하면 주소팝업창에 있는 정보를 가져온다.
		return "popup/jusoPopup";
	}

	@GetMapping("emailCheck/{id:.+}")
	public String eamilCheck(@PathVariable("id") String id, Model model) {
		logger.info("emailCheck 팝업창 들어왔습니다.");
		String email = id;
		String code = randomNum();

		// 난수를 이메일 발송할 때 같이 보내줍니다.
		boolean result = mail.joinEmailCheck(email, code);

		System.out.println("email : " + email);
		System.out.println("code : " + code);

		model.addAttribute("code", code);
		model.addAttribute("input", "N");
		return "popup/emailCheck";
	}

	@PostMapping("emailCheck/{id:.+}")
	public String eamilCheck2(@PathVariable("id") String id, Model model) {
		logger.info("emailCheck2 이메일인증완료");
		model.addAttribute("input", "Y");
		model.addAttribute("code", "0");
		return "popup/emailCheck";
	}

	public String randomNum() {
		StringBuffer code = new StringBuffer();

		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			code.append(n);
		}

		return code.toString();
	}

}
