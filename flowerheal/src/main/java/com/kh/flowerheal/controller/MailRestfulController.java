package com.kh.flowerheal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.flowerheal.common.mail.test.TestGmailSend;

@RestController
@RequestMapping("/mail")
public class MailRestfulController {

	private static Logger logger = LoggerFactory.getLogger(MailRestfulController.class);
	
	// 회원가입 안내 이메일 발송
	
	
	
	// 비밀번호 찾기 안내 이메일 발송
	
	
	
	// 구독 및 결제 내역 안내 이메일 발송
	
	
	
	// 배송 안내 이메일 발송
	
	
	
	// 구독 만료 안내 이메일 발송
	
	
	// 이메일발송 테스트용
	@PostMapping(value = "/sand", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> delivery(@RequestParam("sort") String sort, @RequestParam("email") String email){
		logger.info("이메일 발송 테스트입니다.");
		
		TestGmailSend mail = new TestGmailSend();
		
		// 파라미터 값으로는 ( "이메일 주소") 을 넣어주세요.
		// boolean result = mail.GmailSet("flowerheal2019@gmail.com");
		boolean result = mail.GmailSet(email);
		
		ResponseEntity<String> res = null;
		
		if(result) {
			res = new ResponseEntity<String>("이메일 발송 테스트", HttpStatus.OK); // 200			
		} else {
			res = new ResponseEntity<String>("이메일 발송 테스트 실패", HttpStatus.BAD_REQUEST); // 400			
		}
		
		
		return res;
	}
	
}
