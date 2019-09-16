<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
button{
	border : 1px solid gray !important;
	border-radius: 0.25rem !important;
}
/* div.accordion */
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  text-align: left;
  border: none;
  outline: none;
  transition: 0.4s;
  display: flex;
	justify-content: space-around;
}


/* accordion 활성화, 마우스 hover 되었을 때 배경색 */
.accordion.active, .accordion:hover {
  background-color: #ccc;
}


/* accordion 안에 글씨와 화살표 크기 조절 */
.accordion span,
.accordion i,
div{
	font-size: 1rem;
	margin: auto 0;
}


/* accordion 화살표 방향 조절 */
.accordion .fa-chevron-down{
	display: inline-block;
}
.accordion .fa-chevron-up{
	display: none;
}
.accordion.active .fa-chevron-down{
	display: none;
}
.accordion.active .fa-chevron-up{
	display: inline-block;
}




/* div.accordion 누르면 나오는 div.panel */
.panel {
  padding: 0 0.25rem;
  background-color: white;
  display: none;
  overflow: hidden;
}

.pannel div{
	padding : 0;
}
/* 동의문구 감싸는 div, 결제하기 버튼 감싸는 div 태그 */
.agreementDiv, .paymentDiv{
	display: flex;
	justify-content: center;
}

/* 동의문구 hover 커서 */
#agreementMsg:hover{
	cursor: pointer;
}
.orderProductCheck .row:nth-child(2){
	outline: 1px solid gray;
}
.orderProductCheck .row:nth-child(2) div{
	font-size: 1.2rem;
}

.orderProductCheck .row div{
	text-align: center;
}


/* 결제수단 버튼 */
.panel.payMethod{
	/* display:flex; */
	flex-flow : row wrap;
}
.payMethod_Btn:hover{
	background: none;
}
.payMethod_Btn.active{
	background: greenyellow !important;
}

.payMethod_Btn,
.addressForm_Btn{
   display: flex !important;
   width: 42%;
   flex-flow: column;
	 justify-content: center;
   margin: 0.5rem;
   align-items:center;
}
.payMethod_Btn img{
	width : 100%;
}
.payMethod_Btn span{
	display:none;
}
.agreementDiv input[type="radio"]{display:none;}

.panel .row.noMobile{display:none;}
.addressFrom_Btn span{font-size:0.8rem;}


/* 태블릿 - 768px 이상 */
@media screen and (min-width: 768px) {
.panel .row.noMobile{display:flex;}
	/* accordion 안에 글씨와 화살표 크기 조절 */
	.accordion span,
	.accordion i,
	div{
		font-size: 1.1rem;
	}
	
	.payMethod_Btn{
   width: 22%;
   }
   
.addressFrom_Btn span{font-size:1.1rem;}
}
@media screen and (min-width: 992px) {
	/* accordion 안에 글씨와 화살표 크기 조절 */
	.accordion span,
	.accordion i,
	div{
		font-size: 1.4rem;
	}
	.payMethod_Btn span{
	display:block;
	}
}



</style>
<!-- Form CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">

<jsp:include page="../header.jsp" />
<section class="container">
		<%
			String product_SubsCnt = request.getParameter("product_SubsCnt");
		%>

	<form action="${pageContext.request.contextPath}/product/order" method="POST">
	<!-- subs_Member_Id : 구독자 아이디
			 subs_Product : 구독상품번호
			 subs_Fdate : 구독 시작일
			 subs_Edate : 구독 종료일
			 subs_Cnt : 남은 구독 횟수 -->
		${mdto} <br>
		${pdto} <br>
		
		<input type="text" name="subs_Member_Id" id="subs_Member_Id" value="${sessionScope.user.id }">
		<input type="text" name="subs_Product" id="subs_Product" value="${pdto.product_Num}">
		<input type="text" name="subs_Fdate" id="subs_Fdate" value="${subs_Fdate}">
		<input type="text" name="subs_Edate" id="subs_Edate" value="${subs_Edate}">		
		<input type="text" name="subs_Cnt" id="subs_Cnt" value="<%=product_SubsCnt%>">
		<input type="text" name="subs_Price" id="subs_Price" value="${pdto.product_Price}">
		<input type="text" name="subs_Pname" id="subs_Pname" value="${pdto.product_Name}">
		<div class="row my-3">
			<div class="col-lg-11 mb-3">
				<div class="accordion"><span>주문 상품 확인</span><i class="fas fa-chevron-down"></i><i class="fas fa-chevron-up"></i></div>
				<div class="panel orderProductCheck px-1">
					<div class="row noMobile">
						<div class="col-md-6 col-lg-5">상품명</div>
						<div class="col-md-4 col-lg-4">결제금액</div>
						<div class="col-md-2 col-lg-3 px-2">구독기간</div>
					</div>
					<div class="row d-flex py-2">
						<div class="col-md-6 col-lg-5">${pdto.product_Name}</div>
						<div class="col-7 col-md-4 col-lg-4">매월 ${pdto.product_Price}원</div>
						<div class="col-5 col-md-2 col-lg-3"><%=product_SubsCnt %>개월</div>
						<div class="col-md-12 col-md-5 text-right">${subs_Fdate} ~ ${subs_Edate}</div>
					</div>
				</div>
			</div>
			<div class="col-lg-11 mb-3 deliveryInfoDiv">
				<div class="accordion active"><span>배송정보 입력</span><i class="fas fa-chevron-down"></i><i class="fas fa-chevron-up"></i></div>
				<div class="panel deliveryInfo">



<!-- 				<div class="col-lg-10 mb-3"> -->
<!-- 					<div class="row" id="addressForm"> -->
				<div class="row  justify-content-end addressFromBtns">
					<!-- <input type="hidden" name="address" id="address"> -->
					<button type="button" class="btn addressFrom_Btn btn-outline-dark" id="recentAddress">
						<span>최근 배송지</span>
					</button>
					<button type="button" class="btn addressFrom_Btn btn-outline-dark" id="defaultAddress">
						<span>기본 배송지</span>
					</button>
					<button type="button" class="btn addressFrom_Btn btn-outline-dark" id="newAddress">
						<span>새로 입력</span>
					</button>
				</div>
				<div class="row orderAddress">
						<div class="row col-12 p-0 d-flex justify-content-start">
							<input type="text" class="col-5 form-control ml-0 mr-2" placeholder="우편번호" id="zipNo" name="zipNo" readOnly onClick="goPopup();"/>
							<input type="button" class="col-5 form-control" value="주소 검색" onClick="goPopup();"/>
						</div>
							<input type="text" class="col-12 form-control" placeholder="도로명주소" id="roadAddrPart1" name="roadAddrPart1" readOnly/>
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
			<div class="col-lg-11 mb-3 priceDiv">
				<div class="accordion"><span>최종 금액</span><span>${pdto.product_Price}원  <i class="fas fa-chevron-down"></i><i class="fas fa-chevron-up"></i></span></div>
				<div class="panel row">
					<div class="col-lg-7 d-flex justify-content-between mx-auto"><span>가격 </span><span>${productCost}원</span></div>
					<div class="col-lg-7 d-flex justify-content-between mx-auto"><span>배송비</span><span>${postCost}원</span></div>
					<div class="col-lg-7 d-flex justify-content-between mx-auto"><span>금액 </span><span>${pdto.product_Price}원</span></div>
				</div>
			</div>
			<div class="col-lg-11 mb-3 agreementDiv">
				<input type="radio" id="agreementBtn" name="radio">
				<div id="agreementMsg"><i class="far fa-check-circle"></i>주문정보 및 대행서비스 이용약관에 모두 동의합니다.</div>
			</div>
			<div class="col-lg-11 mb-3 paymentDiv">
				<button type="button" class="btn btn-primary" id="paymentBtn">결제하기</button>
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
	$("#agreementMsg").on("click",agreementMsgF); // agreementMsg 클릭 이벤트
	$(".payMethod_Btn").on("click",payMethod_BtnF); //결제수단 설정버튼
	$(".addressFrom_Btn").on("load",loadAddressF);
	$(".addressFrom_Btn").on("click",addressFrom_BtnF);
//	$(".addressFrom_Btn#recentAddress").click();
	$("#paymentBtn").on("click",paymentBtnF);
});


function loadAddressF(){
	/* subs 테이블에서 같은 계정으로 주문한 기록 있는지 조회 */
	/* 있으면 불러와서 주소란에 넣고 최근배송지 click */
	/* 없으면 기존 배송지 click */
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
		if($(this).val()==""){
			$(".addressFrom_Btn#defaultAddress").click();
		}
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

	if(addressTag==""){
		alert("주소를 입력해주세요.");
		return;
	}
	if(paymentHiddenTag==""){
		alert("결제수단을 선택해주세요.");
		return;
		
	}else if(agreementBtn !="on"){
		alert("이용약관에 동의해주세요.");
		return;
		
	}else{
		$("form").submit();
		
	}
	
}
</script>