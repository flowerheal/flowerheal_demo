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
						<div class="col-7 col-md-4 col-lg-4">매월 ${rec.product_Price}원</div>
						<div class="col-5 col-md-2 col-lg-3">${rec.product_SubsCnt}개월</div>
						<div class="col-md-12 col-md-5 text-right">${rec.cart_Fdate} ~ ${rec.cart_Edate}</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-11 mb-3 deliveryInfoDiv">
				<div class="accordion active"><span>배송정보 입력</span><i class="fas fa-chevron-down"></i><i class="fas fa-chevron-up"></i></div>
				<div class="panel deliveryInfo">
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
						<img src="${pageContext.request.contextPath}/resources/img/product/payMethod.png" alt="creditCard" />
						<span>신용카드</span>
					</button>
					<button type="button" class="btn payMethod_Btn" value="bankTransfer">
						<img src="${pageContext.request.contextPath}/resources/img/product/payMethod.png" alt="bankTransfer" />
						<span>실시간 계좌이체</span>
					</button>
					<button type="button" class="btn payMethod_Btn" value="KakaoPay">
						<img src="${pageContext.request.contextPath}/resources/img/product/payMethod.png" alt="KakaoPay" />
						<span>카카오페이</span>
					</button>
					<button type="button" class="btn payMethod_Btn" value="mobilePayment">
						<img src="${pageContext.request.contextPath}/resources/img/product/payMethod.png" alt="mobilePayment" />
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

<script src="${pageContext.request.contextPath }/resources/js/address.js"></script>
<jsp:include page="../footer.jsp" />
<script>
// 구성버튼 누르면 열기&닫기
var acc = document.getElementsByClassName("accordion");

for (var i = 0; i < acc.length; i++) {
	//===== accordion active 디폴트 =====
	if (acc[i].classList.contains("active")) {
		if(acc[i].classList.contains("payMethod")){
			acc[i].nextElementSibling.style.display = "flex";
		}else{
			acc[i].nextElementSibling.style.display = "block";
		}
	} else {
		acc[i].nextElementSibling.style.display = "none";
	}


	//===== accordion 클릭이벤트 =====
  acc[i].addEventListener("click", function() {
		this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (this.classList.contains("active")) {
			if(this.classList.contains("payMethod")){
				panel.style.display = "flex";
			}else{
				panel.style.display = "block";
			}
    } else {
			panel.style.display = "none";
    }
  });
}
</script>
<script>

$(function() {
	
	loadAddressF(); // 최근 배송지 불러오는 이벤트
	$("#subsEmailMsg").on("click",agreementMsgF); 	// 이메일 수신여부 클릭 이벤트
	$("#agreementMsg").on("click",agreementMsgF); 	// 이용약관 클릭 이벤트
	$(".payMethod_Btn").on("click",payMethod_BtnF); // 결제수단 설정버튼
	$(".addressFrom_Btn").on("click",addressFrom_BtnF); // 배송지 버튼별 이벤트
	$(".addressFrom_Btn#recentAddress").on("click",loadAddressF); // 배송지 버튼별 이벤트

	$("#paymentBtn").on("click",paymentBtnF);
	
});


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
				
			/* 없으면 기존 배송지 click */
			}else{
				$(".addressFrom_Btn#recentAddress").removeClass("active");
				$(".addressFrom_Btn#defaultAddress").addClass("active");
			 	$("#zipNo").val(`${mdto.zipNo}`);
       	$("#roadAddrPart1").val(`${mdto.roadAddrPart1}`);
      	$("#addrDetail").val(`${mdto.addrDetail}`);
      	alert("최근배송지가 없습니다. 기본배송지로 적용됩니다.");
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



function agreementMsgF(){
	console.log(this);
	$(this).toggleClass("active");
	if($(this).hasClass("active")){
		$(this).prev().prop('checked', true);
		$(this).children("i").removeClass("far").addClass("fas")
	}else{
		$(this).prev().prop('checked', false);
		$(this).children("i").removeClass("fas").addClass("far")
	}
}
</script>
<script>
//*===== 결제수단 설정버튼 =====*
function payMethod_BtnF(){
	$(".payMethod_Btn.active").removeClass("active");
	$(this).toggleClass("active");
	let $payMethod_Btn = $(this).val();
	$("input#payment").val($payMethod_Btn);
}

//*===== 주소입력폼 관련 버튼 기능 =====*
function addressFrom_BtnF(){
	$(".addressFrom_Btn.active").removeClass("active");
	$(this).toggleClass("active");
	switch(this.id){
	case "recentAddress": 	//최근배송지

	break;
	case "defaultAddress": 	//기본배송지
		$("#zipNo").val("${mdto.zipNo}");
		$("#roadAddrPart1").val("${mdto.roadAddrPart1}");
		$("#addrDetail").val("${mdto.addrDetail}");
	break;
	case "newAddress":  		//새로입력 ->빈칸으로
		console.log("newAddress")
		$(".orderAddress input:text").val("");
	break;
	}
}
</script>
<script>
function paymentBtnF(){
	
	var addressTag = $('#roadAddrPart1').val();											//주소 입력 여부
	var paymentHiddenTag = $('input#payment').val();								//결제수단 선택 여부
	var agreementBtn = $('input[id="agreementBtn"]:checked').val(); //이용약관 클릭 여부
	var subsEmailBtn = $('input[id="subsEmailBtn"]:checked').val(); //이메일 수신여부 클릭 여부

	if(addressTag==""){
		alert("주소를 입력해주세요.");
		return;
	}
	if(paymentHiddenTag==""){
		alert("결제수단을 선택해주세요.");
		return;
		
	}

	if(agreementBtn !="on"){
		alert("이용약관에 동의해주세요.");
		return;
		
	}else{
		if(subsEmailBtn == "on"){
			$('input[id="subs_Email"]').val('Y');
		}else{
			$('input[id="subs_Email"]').val('N');
		}
		$("form").submit();
		
	}
	
}
</script>