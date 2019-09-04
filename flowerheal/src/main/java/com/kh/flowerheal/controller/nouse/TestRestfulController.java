package com.kh.flowerheal.controller.nouse;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.flowerheal.member.dto.MemberDTO;

@RestController //@Controller + 각메소드의 @ResponseBody
@RequestMapping("/restful")
public class TestRestfulController {
	
	private static Logger logger =
			LoggerFactory.getLogger(TestRestfulController.class);
	
	@GetMapping(value="/json/member", produces="application/json")
	public MemberDTO read() {
		MemberDTO mdto = new MemberDTO();
		
		mdto.setId("test@test.com");
		mdto.setNickname("nick3");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		
		return mdto;
	}
	
	@GetMapping(value="/xml/member", produces="application/xml")
	public MemberDTO read2() {
		MemberDTO mdto = new MemberDTO();
		
		mdto.setId("test@test.com");
		mdto.setNickname("nick3");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		
		return mdto;
	}
	
	
	@GetMapping(value="/json/members", produces="application/json")
	public ResponseEntity<List<MemberDTO>> list(){
		List<MemberDTO> list = new ArrayList<>();
		
		MemberDTO mdto = null;
		mdto = new MemberDTO();
		mdto.setId("test@test.com");
		mdto.setNickname("nick1");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		list.add(mdto);
		
		mdto = new MemberDTO();
		mdto.setId("test2@test.com");
		mdto.setNickname("nick2");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		list.add(mdto);
		
		mdto = new MemberDTO();
		mdto.setId("test3@test.com");
		mdto.setNickname("nick3");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		list.add(mdto);
		
		
		ResponseEntity<List<MemberDTO>> response = null;
		if(list.size()>0) {
			response = new ResponseEntity<List<MemberDTO>>(list,HttpStatus.OK);
		}else {			
			response = new ResponseEntity<List<MemberDTO>>(list,HttpStatus.NOT_FOUND);
		}
		return response;
	}
	
	
	@GetMapping(value="/xml/members", produces="application/xml")
	public List<MemberDTO> list2(){
		List<MemberDTO> list = new ArrayList<>();
		
		MemberDTO mdto = null;
		mdto = new MemberDTO();
		mdto.setId("test@test.com");
		mdto.setNickname("nick1");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		list.add(mdto);
		
		mdto = new MemberDTO();
		mdto.setId("test2@test.com");
		mdto.setNickname("nick2");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		list.add(mdto);
		
		mdto = new MemberDTO();
		mdto.setId("test3@test.com");
		mdto.setNickname("nick3");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		list.add(mdto);
		
		return list;
	}

	
	
	@GetMapping(value="/json/membersMap", produces="application/json")
	public Map<String,MemberDTO> map(){
		Map<String,MemberDTO> map = new HashMap<>();
		
		MemberDTO mdto = null;
		mdto = new MemberDTO();
		mdto.setId("test@test.com");
		mdto.setNickname("nick1");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		map.put("nick1", mdto);
		
		mdto = new MemberDTO();
		mdto.setId("test2@test.com");
		mdto.setNickname("nick2");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		map.put("nick2", mdto);
		
		mdto = new MemberDTO();
		mdto.setId("test3@test.com");
		mdto.setNickname("nick3");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		map.put("nick3", mdto);
		
		return map;
	}
	
	
	
	@GetMapping(value="/xml/membersMap", produces="application/xml")
	public Map<String,MemberDTO> map2(){
		Map<String,MemberDTO> map = new HashMap<>();
		
		MemberDTO mdto = null;
		mdto = new MemberDTO();
		mdto.setId("test@test.com");
		mdto.setNickname("nick1");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		map.put("nick1", mdto);
		
		mdto = new MemberDTO();
		mdto.setId("test2@test.com");
		mdto.setNickname("nick2");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		map.put("nick2", mdto);
		
		mdto = new MemberDTO();
		mdto.setId("test3@test.com");
		mdto.setNickname("nick3");
		mdto.setGender("남");
		mdto.setTel("010-2222-1111");
		mdto.setRegion("울산");
		map.put("nick3", mdto);
		
		return map;
	}
	
	
//	@GetMapping(value="/json/array", produces="application/json")
//	public String[] array(){
//		String[] str= {"홍길동","홍길서","홍길남","홍길북"};
//
//		return str;
//	}
//	
//	
//	@GetMapping(value="/xml/array", produces="application/xml")
//	public String[] array2(){
//		
//		return array();
//	}
	
	@GetMapping(value="/json/array", produces="application/json")
	public ResponseEntity<String[]> array(){
		String[] str = {"홍길동"};
		
		ResponseEntity<String[]> resCode = null;
		resCode = new ResponseEntity<String[]>(str, HttpStatus.NOT_FOUND);
		return resCode;
	}
	
	
	@GetMapping(value="/xml/array", produces="application/xml")
	public ResponseEntity<String[]> array2(){
		String[] str = {"홍길동"};
		
		ResponseEntity<String[]> resCode = null;
		resCode = new ResponseEntity<String[]>(str, HttpStatus.OK);
		return resCode;
	}
	
	
	@PostMapping(value="/json/member")
	public ResponseEntity<String> write(@RequestBody MemberDTO mdto) {

		ResponseEntity<String> resp = null;
		
		logger.info(mdto.toString());
		if(mdto.getId().equals("test@test.com")) {
			resp = new ResponseEntity<String>("ok",HttpStatus.OK);
		}else {
			resp = new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
		return resp;
	}
	
	/*
	 * @GetMapping(value="/xml/member", produces="application/xml") public MemberDTO
	 * read2() { MemberDTO mdto = new MemberDTO();
	 * 
	 * mdto.setId("test@test.com"); mdto.setNickname("nick3"); mdto.setGender("남");
	 * mdto.setTel("010-2222-1111"); mdto.setRegion("울산");
	 * 
	 * return mdto; }
	 */
	
	
}
