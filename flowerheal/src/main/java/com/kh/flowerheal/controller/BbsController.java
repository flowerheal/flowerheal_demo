package com.kh.flowerheal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.flowerheal.bbs.dto.BbsDTO;
import com.kh.flowerheal.bbs.service.BbsSVC;
import com.kh.flowerheal.common.Code;

@Controller
@RequestMapping("/bbs")
public class BbsController {

	private static Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	@Inject
	BbsSVC bbsSVC;
	
	@ModelAttribute
	public void initData(Model model) {
		//검색유형
		List<Code> searchType = new ArrayList<>();
		searchType.add(new Code("TC","제목+내용"));
		searchType.add(new Code("T","제목"));
		searchType.add(new Code("C","내용"));
		searchType.add(new Code("N","작성자"));
		searchType.add(new Code("I","아이디"));
		model.addAttribute("searchType", searchType);
	}
	
	//글쓰기양식
	@GetMapping("/write")
	public String write(Model model) { 
		
		model.addAttribute("bbsDTO", new BbsDTO());
		return "/bbs/writeForm";
	}
	
	//글쓰기처리
	@PostMapping("/write")
	public String writeOk(
			@Valid @ModelAttribute("bbsDTO") BbsDTO bbsDTO,
			BindingResult result) {
		
		if(result.hasErrors()) {
			return "/bbs/writeForm";
		}
		
		bbsSVC.write(bbsDTO);
		
		return "redirect:/bbs/list";
	}
	
//	//글목록조회
//	@GetMapping("/list")
//	public String list(HttpServletRequest request, Model model) {
//		logger.info("list 호출됨!");
//		bbsSVC.list(request, model);
//		return "/bbs/list";
//	}
	
	@GetMapping({"/list",
				 "/list/{reqPage}",
				 "/list/{reqPage}/{searchType}",
				 "/list/{reqPage}/{searchType}/{keyword}"})
	public String list2(
			@PathVariable(required=false) String reqPage, 
			@PathVariable(required=false) String searchType,
			@PathVariable(required=false) String keyword,Model model) {
		
		logger.info("list 호출됨!");
		bbsSVC.list(reqPage, searchType, keyword, model);
		return "/bbs/list";
	}
	
	///게시글 읽기	
	@GetMapping({"/read/{page}/{bnum}",
							"/read/{page}/{bnum}/{searchType}/{keyword}"})
	public String read(	@PathVariable String bnum,
											@PathVariable String page,											 
											@PathVariable(required=false) String searchType,
											@PathVariable(required=false) String keyword,
											Model model) {
		logger.info("read 호출됨!");
		BbsDTO bbsDTO = bbsSVC.view(bnum);
		model.addAttribute("bbsDTO",bbsDTO);
		model.addAttribute("page",page);
		model.addAttribute("searchType",searchType);
		model.addAttribute("keyword",keyword);
		
		return "/bbs/readForm";
	}
	
	///게시글 삭제
	@GetMapping("/delete/{page}/{bnum}")
	public String delete(	@PathVariable String bnum,
							@PathVariable String page) {
		logger.info("delete 호출됨!");
		int cnt = bbsSVC.delete(bnum);
		if(cnt == 1) {
			return "redirect:/bbs/list/"+page;			
		}else {
			return	"";
		}
	}
	
	///게시글 수정 화면	
	@GetMapping("/modify/{page}/{bnum}")
	public String modify(	@PathVariable String bnum,
											@PathVariable String page,
											Model model) {
		logger.info("modify 호출됨!");
		BbsDTO bbsDTO = bbsSVC.view(bnum);
		model.addAttribute("bbsDTO",bbsDTO);
		model.addAttribute("page",page);
		
		return "/bbs/modifyForm";
	}
	
	///게시글 수정
	@PostMapping("/modify/{page}/{bnum}")
	public String modify(
						@Valid @ModelAttribute("bbsDTO") BbsDTO bbsDTO,
						BindingResult result,
						@PathVariable String page) {
		logger.info("modify 호출됨!");
		if(result.hasErrors()) {
			
			return "bbs/modifyForm";
		}
		int cnt = bbsSVC.modify(bbsDTO);
		if(cnt == 1) {
			return "redirect:/bbs/read/"+page +"/"+bbsDTO.getBnum();
		}else {
			return	"";
		}
	}

	///답글 양식
	@GetMapping("/reply/{page}/{bnum}")
	public String reply(@PathVariable String bnum,
											@PathVariable String page,
											Model model) {
		logger.info("replyForm 호출됨!");		
		BbsDTO bbsDTO = bbsSVC.view(bnum);
		model.addAttribute("bbsDTO",bbsDTO);
		
		return "/bbs/replyForm";
	}
	
	///답글 처리
	@PostMapping("/reply")
	public String reply(@Valid @ModelAttribute("bbsDTO") BbsDTO bbsDTO,
											BindingResult result,
											Model model) {
		logger.info("replyForm 호출됨!");		

		if(result.hasErrors()) {
			logger.info(result.toString());
			return "/bbs/replyForm";			
		}
		bbsSVC.reply(bbsDTO);
		return "redirect:/bbs/list";
	}
	
	


}
















