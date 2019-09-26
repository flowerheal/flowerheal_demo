package com.kh.flowerheal.controller;

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
		logger.info("cnt = "+cnt);
		
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
			viewname = "/member/memberJoinComplete";
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
	@GetMapping("/mypage/memberModifyForm/{id:.+}")
	public String memberModifyForm(@PathVariable String id,
															Model model) {
		logger.info("memberModifyForm() 호출됨");
		MemberDTO mdto = mSvc.getMember(id);
		model.addAttribute("mdto",mdto);
		
		return "/member/mypage/memberModifyForm";
	}
	
	//회원수정 처리 : 비밀번호 제외
	@PostMapping("/mypage/memberModifyForm/memberModify")
	public String memberModify(MemberDTO mdto,
							HttpSession session ) {
		logger.info("memberModify() 호출됨");
		int result = mSvc.modify(mdto);
		logger.info("수정결과"+result);

		
		if(result==1) {
			MemberDTO calledMdto =mSvc.getMember(mdto.getId());
			session.setAttribute("user", calledMdto);
			session.setAttribute("msg", "IsMember");
			return "/member/mypage/memberMyPage"; 		
		}else {
			return "/member/mypage/memberModifyForm";
		}
	}
		
		
	
	//회원수정 양식 : 비밀번호
	@GetMapping("/mypage/mPwChangeForm/{id:.+}")
	public String mPwChangeForm(
						@PathVariable String id,
						Model model) {
		logger.info("mPwChangeForm() 호출됨");
		MemberDTO mdto = mSvc.getMember(id);
		model.addAttribute("mdto",mdto);
		model.addAttribute("pdto", new PasswordDTO());
		
		return "/member/mypage/mPwChangeForm";
	}
	
	//회원수정 처리 : 비밀번호
	@PostMapping("/mypage/mPwChangeForm/mPwChange")
	@ResponseBody
	public String mPwChange(
			 @RequestParam("id") String id,
			 @RequestParam("nowPw") String nowPw,
			 @RequestParam("newPw") String newPw,
			 HttpSession session) {
		logger.info("mPwChange() 호출됨");
		PasswordDTO pdto = new PasswordDTO();
		pdto.setId(id);
		pdto.setNowPw(nowPw);
		pdto.setNewPw(newPw);
		int result = mSvc.modifyPw(pdto);
		logger.info("비번수정결과"+result);
		
		String str = null;
		if(result==1) {
			MemberDTO calledMdto =mSvc.getMember(id);
			session.setAttribute("user", calledMdto);
			str = "OK";

		}else {
			str = "WRONGPW";
		}
		return str;		
	}

	
	//회원 삭제 양식
	@GetMapping("/mypage/memberDeleteForm/{id:.+}")
	public String memberDeleteForm(@PathVariable String id,
								   Model model) {
		logger.info("memberDeleteForm() 호출됨");
		MemberDTO mdto = mSvc.getMember(id);
		model.addAttribute("mdto",mdto);
		
		return "/member/mypage/memberDeleteForm";
	}	
	
	//회원삭제처리 : 회원용
	@PostMapping("/mypage/memberDeleteForm/memberDelete")
	@ResponseBody
	public String memberDelete(@RequestParam("id") String id,
							   @RequestParam("pw") String pw,
							   HttpSession session) {
		logger.info("memberDelete() 호출됨");
		int result = mSvc.delete(id,pw);
		String str = null;
		
		if(result==1) {
			logger.info("탈퇴결과"+result);
			session.invalidate();
			str = "OK";
				
		}else {			
			MemberDTO calledMdto =mSvc.getMember(id);
			session.setAttribute("mdto",calledMdto);
			str = "WRONGPW";
			
		}
		return str;
	}

	//회원삭제처리 : 관리자용
	@GetMapping("/memberDelete/{id:.+}")
	public String memberDelete(@PathVariable String id) {
		logger.info("memberDelete() 호출됨");
		int result = mSvc.delByManager(id);
		logger.info("삭제결과"+result);
		return "redirect:/member/memberList";
	}	
	
	//회원 마이페이지
	@GetMapping("/mypage/memberMyPage/{id:.+}")
	public String memberMyPage(@PathVariable String id,
								Model model) {
		logger.info("memberMyPage() 호출됨");
		MemberDTO mdto = mSvc.getMember(id);
		model.addAttribute("mdto",mdto);
		
		return "/member/mypage/memberMyPage";
	}
	
	// 지난 구독조회 페이지
	@GetMapping("/mypage/myPageOther/{id:.+}")
	public String memberOther(@PathVariable String id, Model model) {
		logger.info("memberOther() 호출됨");
		
		MemberDTO mdto = mSvc.getMember(id);
		model.addAttribute("mdto", mdto);
		
		return "/member/mypage/myPageOther";
	}
	
	
}
