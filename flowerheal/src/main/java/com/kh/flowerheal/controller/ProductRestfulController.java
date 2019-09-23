package com.kh.flowerheal.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.flowerheal.common.mail.GmailSend;
import com.kh.flowerheal.member.dto.MemberDTO;
import com.kh.flowerheal.member.service.MemberSvc;
import com.kh.flowerheal.subs.dto.SubsDTO;
import com.kh.flowerheal.subs.service.SubsSvc;

@RestController
@RequestMapping("/productRest")
public class ProductRestfulController {

	private static final Logger logger = LoggerFactory.getLogger(ProductRestfulController.class);

	@Inject
	private SubsSvc sSvc;

	@Inject
	private MemberSvc mSvc;

	// @Inject
	private GmailSend mail = new GmailSend();

	// 최근 배송지
	// 주문페이지에서 최근배송지 호출해주는 ajax url이랑 value 값 맞춰주세요.
	// Post 형식이고 id값을 같이 보내주세요.
	@PostMapping(value = "/lastOrder", produces = "application/json;charset=UTF-8")
	public ResponseEntity<SubsDTO> lastOrder(@RequestParam("id") String id) {
		logger.info("최근 구매상품 호출");

		ResponseEntity<SubsDTO> res = null;
		SubsDTO sdto = new SubsDTO();
		try {
			sdto = sSvc.getLastOrderSDTO(id);
			res = new ResponseEntity<SubsDTO>(sdto, HttpStatus.OK); // 200
		} catch (Exception e) {
			res = new ResponseEntity<SubsDTO>(HttpStatus.BAD_REQUEST); // 400
		}
		return res;
	}

	// 구독 상품 리스트 조회
	// 마이페이지에서 구독상품리스트 호출해주는 ajax url이랑 value값 맞춰주세요.
	// Post 형식이고 id 값을 같이 보내주세요.
	@PostMapping(value = "/msselect", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<SubsDTO>> memberSubsList(@RequestParam("id") String id) {
		logger.info("멤버가 구독한 상품 조회 리스트 호출");

		ResponseEntity<List<SubsDTO>> res = null;
		List<SubsDTO> list = null;
		try {
			list = sSvc.getMemberSubsList(id);
			res = new ResponseEntity<List<SubsDTO>>(list, HttpStatus.OK); // 200
		} catch (Exception e) {
			res = new ResponseEntity<List<SubsDTO>>(HttpStatus.BAD_REQUEST); // 400
		}
		return res;
	}

	// 구독 상품 리스트 조회
	// 관리자 페이지에서 해당 구독상품리스트 호출해주는 ajax url이랑 value값 맞춰주세요.
	// Post 형식이고 pnum 값을 같이 보내주세요.
	@PostMapping(value = "/psselect", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<SubsDTO>> test1(@RequestParam("pnum") String pnum) {
		logger.info("멤버가 구독한 상품 조회 리스트 호출");

		ResponseEntity<List<SubsDTO>> res = null;
		List<SubsDTO> list = null;
		try {
			list = sSvc.getProductSubsList(pnum);
			res = new ResponseEntity<List<SubsDTO>>(list, HttpStatus.OK); // 200
		} catch (Exception e) {
			res = new ResponseEntity<List<SubsDTO>>(HttpStatus.BAD_REQUEST); // 400
		}
		return res;
	}

	// 구독 상품 배송
	// 구독 상품을 배송하는 페이지나 기능구현 후 보여줄 부분이 없는뎅?
	// jsp파일안에서 구독 취소 버튼을 눌렀을 떄 호출해주는 ajax url이랑 value값 맞춰주세요.
	@PutMapping(value = "/subs/delivery/{snum}", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> delivery(@PathVariable(required = true) String snum) {
		logger.info("구독 상품 배송 기능구현");

		ResponseEntity<String> res = null;

		System.out.println("★★★★★★★★★★이 문장 밑으로 에러가 뜬다면 ProductRestfulController.delivery(snum) 메소드를 찾으세요.");
		int result = sSvc.delivery(snum);

		if (result == 1) {
			res = new ResponseEntity<String>("subs_product delivery OK", HttpStatus.OK); // 200

			SubsDTO sdto = sSvc.getSDTO(snum);

			MemberDTO mdto = mSvc.getMember(sdto.getSubs_Member_Id());

			boolean dMail = mail.delivery(mdto.getName(), sdto);
			if (!dMail) {
				System.out.println("구독 상품 배송 기능은 구현됐는데... 이메일 발송에 실패했다.");
			}

		} else {
			res = new ResponseEntity<String>("subs_product delivery Fail", HttpStatus.BAD_REQUEST); // 400
		}
		return res;
	}
	
	
	@GetMapping(value= "/adminSubsList", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<SubsDTO>> getSubsList(){
		logger.info("어드민 관리 구독리스트 호출");
		
		ResponseEntity<List<SubsDTO>> res = null;
		
		List<SubsDTO> list = sSvc.getSubsList();
		
		if(list != null) {
			res = new ResponseEntity<List<SubsDTO>>(list, HttpStatus.OK); // 200			
		}else {
			res = new ResponseEntity<List<SubsDTO>>(HttpStatus.BAD_REQUEST); // 400
		}
		
		return res;
	}
	
	// 구독 취소 기능구현
	// 사용자가 기존에 구독중인 상품에 대해 구독취소 버튼을 눌렀을 때 호출해주는 ajax url이랑 value값 맞춰주세요.
	@PutMapping(value = "/subs/cancel/{snum}", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> cancelSubs(@PathVariable(required = true) String snum) {
		logger.info("구독 취소 기능구현");

		ResponseEntity<String> res = null;

		System.out.println("이 문장 밑으로 에러가 뜬다면 ProductRestfulController.cancelSubs(snum) 메소드를 찾으세요.");
		int result = sSvc.cancelSubs(snum);

		if (result == 1) {
			res = new ResponseEntity<String>("상품 구독 취소 기능구현", HttpStatus.OK); // 200
		} else {
			res = new ResponseEntity<String>("상품 구독 취소 실패", HttpStatus.BAD_REQUEST); // 400
		}
		return res;
	}

}
