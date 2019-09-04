package com.kh.flowerheal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.flowerheal.bbs.dto.RbbsDTO;
import com.kh.flowerheal.bbs.service.RbbsSVC;
import com.kh.flowerheal.common.PageCriteria;
import com.kh.flowerheal.common.RecordCriteria;

@RestController
@RequestMapping("/rbbs")
public class RbbsController {

	private static Logger logger = LoggerFactory.getLogger(BbsController.class);

	@Inject
	RbbsSVC rbbsSVC;
	
	// 댓글작성
	@PostMapping(value = "", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> write(
			@RequestBody RbbsDTO rbbsDTO,
			BindingResult result) {

		ResponseEntity<String> res = null;

		logger.info("rbbs write() 호출" + rbbsDTO.toString());

		// 필수값 체크
		if (rbbsDTO.getBnum() == 0 ||
				rbbsDTO.getRid() == null ||
				rbbsDTO.getRnickname() == null ||
				rbbsDTO.getRcontent() == null) {
			
			res = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST); // 400
		} else {
			rbbsSVC.write(rbbsDTO);
			if(result.hasErrors()) {
				res = new ResponseEntity<String>("tooLong", HttpStatus.OK); // 200
			}else {
				res = new ResponseEntity<String>("success", HttpStatus.OK); // 200				
			}
		}
		return res;
	}

	// 댓글 목록 조회
	@GetMapping(value = "/{page}/{bnum}", produces = "application/json;charset=UTF-8")
	public ResponseEntity<Map<String, Object>> list(
			@PathVariable String page,
			@PathVariable(required = true) String bnum) {
		
		logger.info("rbbs list() 호출");
		final int NUM_PER_PAGE = 10;
		final int PAGE_NUM_PER_PAGE = 10;
		ResponseEntity<Map<String, Object>> res = null;
		Map<String, Object> map = new HashMap<>();

		try {
			RecordCriteria rc = new RecordCriteria(Integer.parseInt(page), NUM_PER_PAGE);
			PageCriteria pc = new PageCriteria(rc, rbbsSVC.replyTotalRec(bnum), PAGE_NUM_PER_PAGE);
			List<RbbsDTO> list = rbbsSVC.list(bnum, rc.getStartRecord(), rc.getEndRecord());

			map.put("item", list);
			map.put("pc", pc);

			res = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			res = new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST);

		}
		return res;

	}

	// 댓글 수정 처리
	@PutMapping(value = "", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> modify(@RequestBody(required=true) RbbsDTO rbbsDTO) {

		logger.info("rbbs modify() 호출" + rbbsDTO.toString());
		ResponseEntity<String> res = null;
		
		// 필수값 체크
		if (String.valueOf(rbbsDTO.getRnum()) == null ||
				rbbsDTO.getRcontent() == null) {
			res = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST); // 400
			return res;
			
		}
		
		int cnt = rbbsSVC.modify(rbbsDTO);
		if(cnt==1) {
			res = new ResponseEntity<String>("success", HttpStatus.OK); // 200
		}else {
			res = new ResponseEntity<String>("cnt가 1이 아님", HttpStatus.BAD_REQUEST); // 400
		}
		return res;

	}

	// 댓글 삭제 처리
	@DeleteMapping(value = "/{rnum}", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> delete(@PathVariable(required = true) String rnum) {
		logger.info("rbbs delete() 호출");

		ResponseEntity<String> res = null;
		int cnt = rbbsSVC.delete(rnum);
		if (cnt == 1) {
			res = new ResponseEntity<String>("success", HttpStatus.OK); // 200
		} else {
			res = new ResponseEntity<String>("삭제 실패", HttpStatus.BAD_REQUEST); // 400
		}
		return res;

	}
	
	
	// 대댓글 작성
	@PostMapping(value = "/reply", produces = "application/json;charset=UTF-8")
	ResponseEntity<String> reply(@RequestBody RbbsDTO rbbsDTO) {

		ResponseEntity<String> res = null;

		logger.info("rbbs reply() 호출" + rbbsDTO.toString());

		// 필수값 체크
		if (String.valueOf(rbbsDTO.getRnum()) == null ||
				rbbsDTO.getRid() == null ||
				rbbsDTO.getRnickname() == null ||
				rbbsDTO.getRcontent() == null) {
			
			return new ResponseEntity<String>("필수값 누락", HttpStatus.BAD_REQUEST); // 400
		}
		int cnt = rbbsSVC.reply(rbbsDTO);
		if(cnt == 1) {
			res = new ResponseEntity<String>("success", HttpStatus.OK); // 200
		} else {
			res = new ResponseEntity<String>("대댓글 작성 실패", HttpStatus.BAD_REQUEST); // 400
		}
		return res;
	}
	
	
	// 호감 & 비호감
	@PutMapping(value = "/{rnum}/{goodOrBad}", produces = "application/json;charset=UTF-8")
	ResponseEntity<String> goodOrBad(
			@PathVariable(required = true) String rnum,
			@PathVariable(required = true) String goodOrBad) {
		
		ResponseEntity<String> res = null;
		
		logger.info("rbbs goodOrBad() 호출");
		
		// 필수값 체크
		if (String.valueOf(rnum) == null ||
				goodOrBad == null ) {			
			return new ResponseEntity<String>("필수값 누락", HttpStatus.BAD_REQUEST); // 400
		}
		
		int cnt = rbbsSVC.goodOrBad(rnum, goodOrBad);
		if(cnt == 1) {
			res = new ResponseEntity<String>("success", HttpStatus.OK); // 200
		} else {
			res = new ResponseEntity<String>("호감/비호감 실패", HttpStatus.BAD_REQUEST); // 400
		}
		return res;
	}

}
