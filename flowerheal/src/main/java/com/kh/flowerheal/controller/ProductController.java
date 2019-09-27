package com.kh.flowerheal.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.flowerheal.cart.dto.CartDTO;
import com.kh.flowerheal.cart.service.cartSVC;
import com.kh.flowerheal.common.mail.GmailSend;
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
	
	@Inject
	private cartSVC cSvc;
	
	//@Inject
	private GmailSend mail = new GmailSend();
	
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
//			@RequestParam String productCost,
//			@RequestParam String postCost,
			Model model) {
		logger.info("orderPage() 호출됨");
		MemberDTO mdto = mSvc.getMember(user_id);
		model.addAttribute("mdto",mdto);
		
		model.addAttribute("pdto", pdto);
		model.addAttribute("subs_Fdate", subs_Fdate);
		model.addAttribute("subs_Edate", subs_Edate);
//		model.addAttribute("productCost", productCost);
//		model.addAttribute("postCost", postCost);
		viewname = "/product/orderPage";
		return viewname;
	}

	// 카트 -> 주문하기 페이지
	@PostMapping("/orderPage2")
	public String orderPage2(
			@RequestParam String user_id,
			Model model) {
		logger.info("orderPage2() 호출됨");
		MemberDTO mdto = mSvc.getMember(user_id);
		model.addAttribute("mdto",mdto);
		List<CartDTO> list = cSvc.getCartList(user_id);
		model.addAttribute("list", list);
		logger.info(user_id);
		logger.info(list.toString());
		viewname = "/product/orderPage2";
		return viewname;
	}
	// 결제 및 상품등록 기능구현
	@PostMapping("/order")
	public String addSubs(@Valid @ModelAttribute SubsDTO sdto) {
		logger.info("addSubs() 호출됨 구독 상품 결제 기능구현");
		
		int cnt = sSvc.addSubs(sdto);

		if(sdto.getIsSaveAddr().equals("Y")) {
			System.out.println("기본배송지로 주소를 변경하겠습니다.");
			String id = sdto.getSubs_Member_Id();
			String zipNo = sdto.getZipNo();
			String roadAddrPart1 = sdto.getRoadAddrPart1();
			String addrDetail = sdto.getAddrDetail();
			mSvc.changeAddr(id, zipNo, roadAddrPart1, addrDetail);
		}
		
		MemberDTO mdto = mSvc.getMember(sdto.getSubs_Member_Id());
		
		if(cnt == 1) {
			// 구독 상품 결제 이메일 보내는 메소드
			mail.order(mdto.getName(), sdto);
		}
		
		
		return "/product/orderComplete";
	}

	
	// 장바구니 담기 페이지
	@PostMapping("/addToCart")
	@ResponseBody
	public String addToCart(
		@RequestParam("product_Name") String product_Name,
		@RequestParam("user_id") String user_id,
		@RequestParam("product_Price") int product_Price,
		@RequestParam("product_Num") String product_Num,
		@RequestParam("product_SubsCnt") int product_SubsCnt,
		@RequestParam("cart_Fdate") Date cart_Fdate,
		@RequestParam("cart_Edate") Date cart_Edate,
			Model model) {
		logger.info("addToCart() 호출됨");
		MemberDTO mdto = mSvc.getMember(user_id);
		model.addAttribute("mdto",mdto);

		String str = "";
		
		//cart DB에 해당 상품 넣음
		CartDTO cdto = new CartDTO();
		cdto.setProduct_Name(product_Name);
		cdto.setUser_id(user_id);
		cdto.setProduct_Price(product_Price);
		cdto.setProduct_Num(product_Num);
		cdto.setProduct_SubsCnt(product_SubsCnt);
		cdto.setCart_Fdate(cart_Fdate);
		cdto.setCart_Edate(cart_Edate);
		
		int result = cSvc.cart_insert(cdto);
		logger.info("수정결과"+result);
		if(result==1) {
			str = "YES";
		}else {
			str = "NO";
		}
		
		return str;
	}

	
	// orderPage2 기능 구현
	@PostMapping("/orderFromCart")
	public String addSubs2(
			@RequestParam("subs_Member_Id") String user_id,
			@RequestParam("subs_Email") String subs_Email,
			@RequestParam("zipNo") String zipNo,
			@RequestParam("roadAddrPart1") String roadAddrPart1,
			@RequestParam("addrDetail") String addrDetail,
			@RequestParam("isSaveAddr") String isSaveAddr) {
		
		logger.info("addSubs2() 호출됨 orderPage2 기능구현");

		boolean result = false;
		if(isSaveAddr.equals("Y")) {
			System.out.println("기본배송지로 주소를 변경하겠습니다.");
			String _id = user_id;
			String _zipNo = zipNo;
			String _roadAddrPart1 = roadAddrPart1;
			String _addrDetail = addrDetail;
			mSvc.changeAddr(_id, _zipNo, _roadAddrPart1, _addrDetail);
		}
		
		List<CartDTO> list = cSvc.getCartList(user_id);
		List<SubsDTO> sdtoList = new ArrayList<>();
		
		for(int i = 0; i < list.size(); i++) {
			SubsDTO sdto = new SubsDTO();
			sdto.setSubs_Member_Id(user_id);
			sdto.setSubs_Email(subs_Email);
			
			sdto.setSubs_Pname(list.get(i).getProduct_Name());
			sdto.setSubs_Product(Integer.parseInt(list.get(i).getProduct_Num()));
			sdto.setSubs_Cnt(list.get(i).getProduct_SubsCnt());
			sdto.setSubs_Price(list.get(i).getProduct_Price());
			sdto.setZipNo(zipNo);
			sdto.setRoadAddrPart1(roadAddrPart1);
			sdto.setAddrDetail(addrDetail);
			sdto.setSubs_Fdate(list.get(i).getCart_Fdate());
			sdto.setSubs_Edate(list.get(i).getCart_Edate());
			
			sdtoList.add(sdto);
			sSvc.addSubs(sdto);
			cSvc.cart_delete(list.get(i).getCart_num());

			if((i + 1) == list.size()) {
				result = true;
			}
		}
		
		MemberDTO mdto = mSvc.getMember(user_id);
		
		if(result) {
			mail.listOrder(mdto.getName(), sdtoList);
		}
		
		return "/product/orderComplete";
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
