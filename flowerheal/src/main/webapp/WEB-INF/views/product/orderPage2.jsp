<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/orderPage.css" rel="stylesheet">
<style>
/* 주문 상품 확인 눌렀을 때 나오는 panel .row */
.orderProductCheck .row{  
	outline: 1px solid #F5B6A8;
}
.orderProductCheck .row div{
	font-size: 1.2rem;
	text-align: center;
}
.orderProductCheck .row:nth-child(1){  
	outline: none;
}
.orderProductCheck .row:nth-child(1) div{
	font-size: 1.4rem;
}


</style>
<!-- Form CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">

<jsp:include page="../header.jsp" />
<section class="container">
		<%
			String product_SubsCnt = request.getParameter("product_SubsCnt");
			
		
		%>

	<form action="${pageContext.request.contextPath}/product/orderFromCart" method="POST">
		<input type="hidden" name="subs_Member_Id" id="subs_Member_Id" value="${sessionScope.user.id }">
		
		<div class="row my-3" style="height: auto; width: 100%; border:2px solid #fff;">
			<div class="col-lg-11 mb-3 pt-5 ">
				<div class="accordion"><span>주문 상품 확인</span><i class="fas fa-chevron-down"></i><i class="fas fa-chevron-up"></i></div>
				<div class="panel orderProductCheck px-1">
					<div class="row noMobile">
						<div class="col-md-6 col-lg-5">상품명</div>
						<div class="col-md-4 col-lg-4">결제금액</div>
						<div class="col-md-2 col-lg-3 px-2">구독기간</div>
					</div>
					<c:forEach var="rec" items="${list }">
					<div class="row d-flex py-2">
						<div class="col-md-6 col-lg-5">${rec.product_Name}</div>
						<div class="col-7 col-md-4 col-lg-4" Data-cnum="${rec.cart_num }">매월 ${rec.product_Price}원</div>
						<div class="col-5 col-md-2 col-lg-3">${rec.product_SubsCnt}개월</div>
						<div class="col-md-12 col-md-5 text-right">${rec.cart_Fdate} ~ ${rec.cart_Edate}</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-11 mb-3 deliveryInfoDiv">
				<div class="accordion active"><span>배송정보 입력</span><i class="fas fa-chevron-down"></i><i class="fas fa-chevron-up"></i></div>
				<div class="panel deliveryInfo">
					<div class="row orderNamePhone">
						<div class="row col-12 p-0 d-flex justify-content-start">
							<div class="col-3 col-lg-2 ml-0 mr-2 small text-center">이름</div>
							<input type="text" class="col-5 col-lg-4 form-control ml-0 mr-2" id="name" name="name"
							 			 onkeyup="noSpace(this);" value="${mdto.name }"/>
						</div>
						<div class="row col-12 p-0 d-flex justify-content-start">
							<div class="col-3 col-lg-2 ml-0 mr-2 small text-center">전화번호</div>
							<input type="text" class="col-5 col-lg-4 form-control ml-0 mr-2" id="tel" name="tel"
										 onkeyup="inputTelNumber(this);" value="${mdto.tel }"/>
						</div>
					</div>
					<div class="row  justify-content-end addressFromBtns">
					<button type="button" class="btn addressFrom_Btn " style="color:#FF9484" id="recentAddress">
						<span>최근 배송지</span>
					</button>
					<button type="button" class="btn addressFrom_Btn " style="color:#FF9484" id="defaultAddress">
						<span>기본 배송지</span>
					</button>
					<button type="button" class="btn addressFrom_Btn " style="color:#FF9484" id="newAddress">
						<span>새로 입력</span>
					</button>
				</div>
				<div class="row  justify-content-end addressFromBtns saveAddressDiv">
					<input type="hidden" name="isSaveAddr" id="isSaveAddr">
					<input type="checkbox" id="saveAddressBtn" name="checkbox">
					<div class="col-5 pb-2 text-center" id="saveAddressMsg"><i class="far fa-check-circle"></i>기본 배송지로 설정</div>
				</div>
				<div class="row orderAddress">
						<div class="row col-12 p-0 d-flex justify-content-start">
							<input type="text" class="col-5 form-control ml-0 mr-2" placeholder="우편번호" id="zipNo" name="zipNo" readOnly onClick="goPopup();"/>
							<input type="button" class="col-5 form-control" value="주소 검색" onClick="goPopup();"/>
						</div>
						<br><Br>
							<input type="text" class="col-12 form-control" placeholder="도로명주소" id="roadAddrPart1" name="roadAddrPart1" readOnly/>
							<br/><br>
							<input type="text" class="col-12 form-control" placeholder="상세주소" id="addrDetail" name="addrDetail" />					
					
						</div>
					<div class="invalid-feedback">
						<!-- <form:errors path="address" cssClass="errMsg"></form:errors> -->
					</div>
				</div>


			</div>
			<div class="col-lg-11 mb-3 payMethodDiv">
				<div class="accordion payMethod active"><span>결제수단 선택</span><i class="fas fa-chevron-down"></i><i class="fas fa-chevron-up"></i></div>
				<div class="panel payMethod justify-content-center">
					<input type="hidden" name="payment" id="payment">
					<button type="button" class="btn payMethod_Btn" value="creditCard">
						<img src="${pageContext.request.contextPath}/resources/img/product/card.jpg" alt="creditCard" />
						<span>신용카드</span>
					</button>
					<button type="button" class="btn payMethod_Btn" value="bankTransfer">
						<img src="${pageContext.request.contextPath}/resources/img/product/transfer.jpg" alt="bankTransfer" />
						<span>실시간 계좌이체</span>
					</button>
					<button type="button" class="btn payMethod_Btn" value="KakaoPay">
						<img src="${pageContext.request.contextPath}/resources/img/product/kakao.jpg" alt="KakaoPay" />
						<span>카카오페이</span>
					</button>
					<button type="button" class="btn payMethod_Btn" value="mobilePayment">
						<img src="${pageContext.request.contextPath}/resources/img/product/payment.jpg" alt="mobilePayment" />
						<span>휴대폰결제</span>
					</button>
				</div>
			</div>
			<div class="col-lg-11 mb-3 pb-5 priceDiv">
				<div class="accordion active" style="cursor:default;">
					<span>최종 금액</span>
					<span id="p_All_Price">
						<c:set var = "total" value = "0" />
						<c:forEach var="rec" items="${list}" varStatus="status">     
						<c:set var= "total" value="${total + rec.product_Price}"/>
						</c:forEach>
						<c:out value="${total}"/>원&nbsp;&nbsp;
					</span>
				</div>
<!-- 				<div class="panel row">
					<div class="col-lg-7 d-flex justify-content-between mx-auto"><span>가격 </span><span id="p_All_Cost"></span></div>
					<div class="col-lg-7 d-flex justify-content-between mx-auto"><span>배송비</span><span id="p_All_Post"></span></div>
					<div class="col-lg-7 d-flex justify-content-between mx-auto"><span>금액 </span><span id="p_All_Price"></span></div>
				</div> -->
			</div>
			<div class="row col-lg-11 mb-3 pb-5 agreementDiv">
				<input type="hidden" name="subs_Email" id="subs_Email">
				<input type="checkbox" id="subsEmailBtn" name="checkbox">
				<div class="col-12 pb-2" id="subsEmailMsg"><i class="far fa-check-circle"></i>(선택)배송정보 이메일 수신에 동의합니다.</div>
				<input type="checkbox" id="agreementBtn" name="checkbox">
				<div class="col-12" id="agreementMsg"><i class="far fa-check-circle"></i>(필수)주문정보 및 대행서비스 이용약관에 모두 동의합니다.</div>
			</div>
				<div class="col-lg-11 mb-3 pb-5 paymentDiv">
				<button type="button" class="btn btn-lg btn-block" style="color:#fff; background-color: #FFA596;" id="paymentBtn">결제하기</button>	
			</div>
		</div>
	</form>
</section>

<!-- 주소 js -->
<script src="${pageContext.request.contextPath }/resources/js/address.js"></script>
<jsp:include page="../footer.jsp" />

<!-- 최근배송지 ajax -->
<script>
var $url = "${pageContext.request.contextPath }/productRest"; //공통 URL요청
function loadAddressF(){		
	let $id = $('#subs_Member_Id').val();	//현재 아이디
	console.log($id);
	/* subs 테이블에서 같은 계정으로 주문한 기록 있는지 조회 */
 	$.ajax({
		type : "POST",    			 	//http 전송 방식
		url  : $url+"/lastOrder", //요청 url
		data :{"id":$id},

		//응답 성공시 처리사항
		success:function(res){
			 
			/* 있으면 불러와서 주소란에 넣고 최근배송지 click */
			if(res!=""){
				$(".addressFrom_Btn#recentAddress").addClass("active");
			 	$("#zipNo").val(res.zipNo);
       			$("#roadAddrPart1").val(res.roadAddrPart1);
      			$("#addrDetail").val(res.addrDetail);
      			$("#saveAddressMsg").show();
			/* 없으면 기본 배송지 click */
			}else{
				$(".addressFrom_Btn#recentAddress").removeClass("active");
				$(".addressFrom_Btn#defaultAddress").addClass("active");
			 	$("#zipNo").val(`${mdto.zipNo}`);
       			$("#roadAddrPart1").val(`${mdto.roadAddrPart1}`);
      			$("#addrDetail").val(`${mdto.addrDetail}`);
      			alert("최근배송지가 없습니다. 기본배송지로 적용됩니다.");
      			$("#saveAddressMsg").hide();
			}
			
		},
		//응답 실패시 처리사항
		error:function(xhr, status, err){			
			console.log("code:"+xhr.status);
			console.log("message:"+xhr.responseText );
			console.log("status:"+status);
			console.log("err:"+err);
		}			
	});

}

//*===== 주소입력폼 관련 버튼 기능 =====*
 function addressFrom_BtnF(){
	$(".addressFrom_Btn.active").removeClass("active");
	$(this).toggleClass("active");
	switch(this.id){
	case "recentAddress": 	//최근배송지
		$("#saveAddressMsg").show();
	break;
	case "defaultAddress": 	//기본배송지
		$("#zipNo").val(`${mdto.zipNo}`);
    $("#roadAddrPart1").val(`${mdto.roadAddrPart1}`);
    $("#addrDetail").val(`${mdto.addrDetail}`);
    $("#saveAddressMsg").hide();
	break;
	case "newAddress":  		//새로입력 ->빈칸으로
		console.log("newAddress")
		$(".orderAddress input:text").val("");
		$("#saveAddressMsg").show();
	break;
	}
} 
</script>

<!-- 주문페이지 js -->
<script src="${pageContext.request.contextPath }/resources/js/orderPage.js"></script>