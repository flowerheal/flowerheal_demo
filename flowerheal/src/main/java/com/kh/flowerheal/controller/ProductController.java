package com.kh.flowerheal.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.flowerheal.member.dto.MemberDTO;
import com.kh.flowerheal.member.service.MemberSvc;
import com.kh.flowerheal.product.dto.ProductDTO;
import com.kh.flowerheal.product.service.ProductSvc;
import com.kh.flowerheal.subs.dto.SubsDTO;
import com.kh.flowerheal.subs.service.SubsSvc;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Inject
	private MemberSvc mSvc;
	
	@Inject
	private ProductSvc pSvc;
	
	@Inject
	private SubsSvc sSvc;
	
	private static final Logger logger
	= LoggerFactory.getLogger(ProductController.class);

	String viewname = null;
	
	// 상품목록 페이지 양식
	@GetMapping("/productList")
	public String productList(Model model) {
		logger.info("productList() 호출됨");
		
		viewname = "/product/productList";
		return viewname;
	}
	
	// 상품상세 페이지
	@GetMapping("/{product_Num}")
	public String product(
			@PathVariable String product_Num,
			Model model) {
		logger.info("product() 호출됨");
		
		ProductDTO pdto = pSvc.getPDTO(product_Num);

		model.addAttribute("pdto", pdto);
		viewname = "/product/"+product_Num;
		return viewname;
	}
	
	// 주문하기 페이지
	@PostMapping("/orderPage")
	public String orderPage(
			@ModelAttribute ProductDTO pdto,
			@RequestParam String user_id,
			@RequestParam String subs_Fdate,
			@RequestParam String subs_Edate,
			@RequestParam String productCost,
			@RequestParam String postCost,
			Model model) {
		logger.info("orderPage() 호출됨");
		MemberDTO mdto = mSvc.getMember(user_id);
		model.addAttribute("mdto",mdto);
		
		model.addAttribute("pdto", pdto);
		model.addAttribute("subs_Fdate", subs_Fdate);
		model.addAttribute("subs_Edate", subs_Edate);
		model.addAttribute("productCost", productCost);
		model.addAttribute("postCost", postCost);
		viewname = "/product/orderPage";
		return viewname;
	}
	
	// 결제 및 상품등록 기능구현
	@PostMapping("/order")
	public String addSubs(@Valid @ModelAttribute SubsDTO sdto) {
		System.out.println("product 컨트롤러 /order 결제 구독상품 기능구현");
		
		System.out.println(sdto);
		System.out.println("===============================");
		
		sSvc.addSubs(sdto);
		
		return "redirect:/";
	}
	
	// 주문하기 페이지
	@PostMapping("/addToCart")
	public String addToCart(
//			@ModelAttribute ProductDTO pdto,
			@RequestParam String user_id,
//			@RequestParam String subs_Fdate,
//			@RequestParam String subs_Edate,
//			@RequestParam String productCost,
//			@RequestParam String postCost,
			Model model) {
		logger.info("addToCart() 호출됨");
		MemberDTO mdto = mSvc.getMember(user_id);
		model.addAttribute("mdto",mdto);
		
		//cart DB에 해당 상품 넣음
		//cart DB에서 list 불러와서 뿌림
		
//		model.addAttribute("pdto", pdto);
//		model.addAttribute("subs_Fdate", subs_Fdate);
//		model.addAttribute("subs_Edate", subs_Edate);
//		model.addAttribute("productCost", productCost);
//		model.addAttribute("postCost", postCost);
		viewname = "/product/cart";
		return viewname;
	}
	
	//장바구니 이동
	@GetMapping("/cart/{user_id:.+}")
	public String cart(@PathVariable String user_id, Model model) {
		logger.info("cart() 호출됨");
		MemberDTO mdto = mSvc.getMember(user_id);
		model.addAttribute("mdto",mdto);
		viewname = "/product/cart";
		return viewname;
	}
	
	// 구독 상품 배송지 변경 폼 보여주기
	@GetMapping("/changeAddr/{snum}")
	public String changeAddrForm(Model model, @PathVariable String snum) {
		logger.info("구독 상품 배송지 변경 폼");
		
		SubsDTO sdto = sSvc.getSDTO(snum);
		
		model.addAttribute("subs", sdto);
		
		// 배송지변경 버튼 클릭 후 이동페이지  : index.jsp
		viewname = "redirect:/";
		return viewname;
	}
	
	// 구독 상품 배송지 변경 기능구현
	@PostMapping("/changeAddr")
	public String changeAddr(@Valid @PathVariable SubsDTO sdto) {
		
		sSvc.changeAddr(sdto);
		
		// 배송지변경 완료 시 이동페이지 : index.jsp
		viewname = "redirect:/";
		return viewname;
	}
	
	
	/* ========== 구독상품 변경 구현예정 ==========
	// 구독 상품 변경 폼 보여주기
	public String changeSubsForm() {
		logger.info("구독 상품 배송지 변경 폼");
		
		viewname = "redirect:/";
		return viewname;
	}
	
	// 구독 상품 배송지 변경 기능구현
	public String changeSubs(SubsDTO sdto) {
		logger.info("구독 상품 배송지 변경 기능구현");
		sSvc.changeSubs(sdto);
		
		viewname = "redirect:/";
		return viewname;
	}
	========== 구독상품 변경 구현예정 ========== */
}
