package com.kh.flowerheal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.flowerheal.common.Code;
import com.kh.flowerheal.member.dto.MemberDTO;
import com.kh.flowerheal.member.dto.PasswordDTO;
import com.kh.flowerheal.member.service.MemberSvc;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberSvc mSvc;

	// id중복검사
	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(@RequestParam("wantId") String id, Model model) {
		logger.info("checkId() 호출됨");

		String str = null;
		
		int cnt = mSvc.hasId(id);			
		if(cnt==0) {
			logger.info("canmake");
			str = "YES";
		}else if(cnt==-1){
			str = "NULL";
		}else {
			logger.info("cannt");
			str = "NO";
		}

		return str;
	}

	
	@ModelAttribute
	public void initData(Model model) {
		//지역
		List<Code> region = new ArrayList<>();
		region.add(new Code("서울","서울특별시"));
		region.add(new Code("인천","인천광역시"));
		region.add(new Code("대전","대전광역시"));
		region.add(new Code("광주","광주광역시"));
		region.add(new Code("울산","울산광역시"));
		region.add(new Code("부산","부산광역시"));
		region.add(new Code("경기","경기도"));
		region.add(new Code("강원","강원도"));
		region.add(new Code("충북","충청북도"));
		region.add(new Code("충남","충청남도"));
		region.add(new Code("전북","전라북도"));
		region.add(new Code("전남","전라남도"));
		region.add(new Code("경북","경상북도"));
		region.add(new Code("충남","충청남도"));
		region.add(new Code("경남","경상남도"));
		region.add(new Code("제주","제주도"));
		region.add(new Code("기타","기  타"));
		
		model.addAttribute("region",region);
		
		//성별
		List<Code> gender = new ArrayList<>();
		gender.add(new Code("남","남자"));
		gender.add(new Code("여","여자"));
		
		model.addAttribute("gender",gender);
	}
	
	// 회원가입 양식
	@GetMapping("/memberJoinForm")
	public String memberJoinForm(Model model) {
		logger.info("memberJoinForm() 호출됨");
		model.addAttribute("mdto", new MemberDTO());
		return "/member/memberJoinForm";
	}

	// 회원 가입 처리
	@PostMapping("/memberJoin")
	public String memberJoin(
			@Valid @ModelAttribute MemberDTO mdto,
			BindingResult result,
			Model model) {

		String viewname = null;
		
		logger.info("memberJoin() 호출됨");
		logger.info(mdto.toString());
		
		if(result.hasErrors()) {
			logger.info("회원가입시 오류 발생");
			logger.info(result.toString());
			model.addAttribute("mdto",mdto);
			viewname = "/member/memberJoinForm";
			return viewname;
		}
		
		//회원중복체크
		if(mSvc.getMember(mdto.getId())!=null) {
			model.addAttribute("svr_msg","중복된 아이디입니다.");
			viewname="/member/memberJoinForm";
			return viewname;
		}
		
		//회원 등록
		int cnt = mSvc.insert(mdto);
		if (cnt == 1) {
			viewname = "redirect:/";
			return viewname;

		} else {
			viewname = "/member/memberJoinForm";
			return viewname;
		}
	}

	//회원목록 조회
	@GetMapping("/memberList")
	public String memberList(Model model) {
		logger.info("memberList() 호출됨");
		
		List<MemberDTO> list = mSvc.getMemberList();
		model.addAttribute("memberList",list);
		
		return "/member/memberList";
	}
	
	//회원수정 양식 : 비밀번호 제외
	@GetMapping("/memberModifyForm/{id:.+}")
	public String memberModifyForm(@PathVariable String id,
															Model model) {
		logger.info("memberModifyForm() 호출됨");
		MemberDTO mdto = mSvc.getMember(id);
		model.addAttribute("mdto",mdto);
		
		return "/member/memberModifyForm";
	}
	
	//회원수정 처리 : 비밀번호 제외
	@PostMapping("/memberModifyForm/memberModify")
	public String memberModify(MemberDTO mdto,
							HttpSession session ) {
		logger.info("memberModify() 호출됨");
		int result = mSvc.modify(mdto);
		logger.info("수정결과"+result);

		
		if(result==1) {
			MemberDTO calledMdto =mSvc.getMember(mdto.getId());
			session.setAttribute("user", calledMdto);
			session.setAttribute("msg", "IsMember");
			return "redirect:/"; 		
		}else {
			return "/member/memberModifyForm";
		}
	}
		
		
	
	//회원수정 양식 : 비밀번호
	@GetMapping("/mPwChangeForm/{id:.+}")
	public String mPwChangeForm(
						@PathVariable String id,
						Model model) {
		logger.info("mPwChangeForm() 호출됨");
		MemberDTO mdto = mSvc.getMember(id);
		model.addAttribute("mdto",mdto);
		model.addAttribute("pdto", new PasswordDTO());
		
		return "/member/mPwChangeForm";
	}
	
	//회원수정 처리 : 비밀번호
	@PostMapping("/mPwChangeForm/mPwChange")
	public String mPwChange(
			 @RequestParam String id,
			 @RequestParam String nowPw,
			 @RequestParam String newPw,
			 HttpSession session) {
		logger.info("mPwChange() 호출됨");
		PasswordDTO pdto = new PasswordDTO();
		pdto.setId(id);
		pdto.setNowPw(nowPw);
		pdto.setNewPw(newPw);
		int result = mSvc.modifyPw(pdto);
		logger.info("비번수정결과"+result);
		
		if(result==1) {
			MemberDTO calledMdto =mSvc.getMember(id);
			session.setAttribute("user", calledMdto);
			return "redirect:/"; 		
		}else {
			
			return "/member/mPwChangeForm";
		}
		
	}

	//회원 삭제 양식
	@GetMapping("/memberDeleteForm/{id:.+}")
	public String memberDeleteForm(@PathVariable String id,
								   Model model) {
		logger.info("memberDeleteForm() 호출됨");
		MemberDTO mdto = mSvc.getMember(id);
		model.addAttribute("mdto",mdto);
		
		return "/member/memberDeleteForm";
	}	
	
	//회원삭제처리 : 회원용
	@PostMapping("/memberDeleteForm/memberDelete")
	public String memberDelete(@RequestParam String id,
							   @RequestParam String pw,
							   HttpSession session) {
		logger.info("memberDelete() 호출됨");
		int result = mSvc.delete(id,pw);
		
		if(result==1) {
			logger.info("탈퇴결과"+result);
			session.invalidate();
			return "redirect:/"; 		
		}else {			
			MemberDTO calledMdto =mSvc.getMember(id);
			session.setAttribute("mdto",calledMdto);
			return "/member/memberDeleteForm";
		}

	}
	
	//회원삭제처리 : 관리자용
	@GetMapping("/memberDelete/{id:.+}")
	public String memberDelete(@PathVariable String id) {
		logger.info("memberDelete() 호출됨");
		int result = mSvc.delByManager(id);
		logger.info("삭제결과"+result);
		return "redirect:/member/memberList";
	}	
	
	
}
