<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/* 카트에 담기, 주문하기 */
.submit_checkout {
	position: relative;
	z-index: 0;
	height: auto; 
}
.btn-black{
	width: 100%;
	height: 3rem;
	margin: 0.5rem 0;
	font-size: 1.5rem !important;
	outline: 1px solid black;
}
.btn-black:hover{
 background: black;
 color:white !important;
}
/* 구독기간 버튼 */
.product_SubsCnt_Btn:hover{
	background: none;
}
.product_SubsCnt_Btn.active{
	background: greenyellow !important;
}

/* form */
.form-row{
	width: 100%;
}
.form-row div{
	text-align: center;
}
.form-row #productName{
	font-size: 1.5rem;
}
 /* .form-row input{
	width: 100%;
	margin-bottom: 1rem;
} */
.orderOption{
	outline: 1px solid gray;
}

/* Style the buttons that are used to open and close the accordion panel */
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
}

/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
.accordion.active, .accordion:hover {
  background-color: #ccc;
}

/* Style the accordion panel. Note: hidden by default */
.panel {
  padding: 0 18px;
  background-color: white;
  display: none;
  overflow: hidden;
}


@media (min-width: 768px) {
.form-row #productName{
	font-size: 1.75rem;
}


}
</style>



<jsp:include page="../header.jsp" />
<section class="container">
<div class="row">
	<!-- 상품 대표이미지 -->
	<div class="col-md-6">
	  <img src="${pageContext.request.contextPath }/resources/img/product/product1/product1_banner.jpg"
	       width="100%" height="auto" alt="#" />
	</div>
	<div class="col-md-6">
		<!-- 상품 구성 고르기 폼 -->
<!-- 		<form action="${pageContext.request.contextPath}/product" class="row my-3"> -->
		<form class="row my-3">
			<div class="form-row">
				<input type="hidden" name="user_id" id="user_id" value="${sessionScope.user.id}"> 
				<input type="hidden" name="product_Num" id="product_Num" value="${pdto.product_Num}"> 
				<input type="hidden" name="product_Name" id="product_Name" value="코코낸내 허니잠 세트"> 
				<div class="col-12" id="productName">코코낸내 허니잠 세트</div>
				<div class="col-12 d-flex justify-content-around orderOption" id="orderDate">
					<i class="far fa-calendar-alt my-auto"></i>
					<input type="hidden" name="subs_Fdate" id="subs_Fdate"> 
					<input type="hidden" name="subs_Edate" id="subs_Edate"> 
					<input type="text" id="datepicker" />
					<i class="fas fa-plus my-auto"></i>
				</div>
				<div class="col-12 orderOption" id="orderMore">
					<div class="accordion">구성 변경</div>
					<div class="panel">
						<!-- option0 : 꽃다발/화분 : 제외 불가 -->
						<input type="hidden" name="option0" id="option0" value="21000"> 
						<div>향초(+4000)<input type="checkbox" name="option1" id="option1" value="4000" checked="checked"></div>
						<div>소이캔들(+5000)<input type="checkbox" name="option2" id="option2" value="5000" checked="checked"></div>
						<div>꽃다발/화분은 구성에서 제외할 수 없습니다</div>
					</div>
				</div>
				<div class="row col-12 orderOption" id="product_SubsCnt_Btns">
					<input type="hidden" name="product_SubsCnt" id="product_SubsCnt">
					<button type="button" class="btn product_SubsCnt_Btn" value="1">1개월권</button>
					<button type="button" class="btn product_SubsCnt_Btn" value="2">2개월권</button>
					<button type="button" class="btn product_SubsCnt_Btn" value="6">6개월권</button>
					<!-- <button type="button" class="btn product_SubsCnt_Btn">정기결제</button> -->
				</div>
				<div class="row col-12 d-flex justify-content-around orderOption" id="orderCost">
					<div class="col-12">가격<input type="text" name="productCost" id="productCost" readonly="readonly">원</div>
					<div class="col-12">배송비<input type="text" name="postCost" id="postCost" readonly="readonly">원</div>
					<div class="col-12">금액<input type="text" name="product_Price" id="product_Price" readonly="readonly">원</div>
				</div>

			</div>
		</form>

			<!-- 카트에 담기 버튼(하단 고정) -->
			<div class="row submit_row submit_checkout">
				<button type="button" class="btn btn-black" id="addToCartBtn">카트에 담기</button>
				<button type="button" class="btn btn-black" id="orderPageBtn">주문하기</button>
			</div>

	</div>
	</div>

<!-- 상품 상세 내용 -->
<div class="row my-2">
	<div class="col-md-12">
		  <img src="${pageContext.request.contextPath }/resources/img/product/blank.png"
					 width="100%" height="auto" alt="#" />
	</div>
</div>

</section>
<!-- 푸터 -->
<jsp:include page="../footer.jsp" />

<!-- 상품상세페이지 관련 js -->
<script src="${pageContext.request.contextPath }/resources/js/product.js"></script>

<script>
function orderPageBtnF(){

	var user = "${sessionScope.user == null ? null : sessionScope.user.id}";
	
	//로그인전이면 로그인화면으로 이동
	if(user == null || user == "") {
		if(confirm("로그인 하시겠습니까?")){
			document.location.href="${pageContext.request.contextPath }/login/loginForm";
		}
		return;
	}
	
	//구독기간 설정 안했다면 alert;
	if($("#product_SubsCnt").val()==""){
		alert("구독기간을 선택해주세요.");
		return;
	}
		/* 시작날짜를 바탕으로 종료날짜 산출 */
		let $subs_Fdate = $("#datepicker").val(); // 시작날짜
		let $subs_Edate = ""; //종료날짜 선언

		// 종료날짜 달 = 시작날짜에서 달 추출 + 구독횟수 -1
		let EdateMonth = parseInt($subs_Fdate.substr(5,2)) + parseInt($("#product_SubsCnt").val()) -1;


		// 종료날짜 달이 10보다 작은 경우		
		if(EdateMonth<10){
			// String으로 바꾼 다음 앞에 0을 붙인다. ex) 9 -> "09"
			let StringEdateMonth = "0"+String(EdateMonth);
			// 마지막날짜 = 시작날짜 연도 + 종료날짜 달 + 시작날짜 일
			$subs_Edate = $subs_Fdate.substr(0,5)+StringEdateMonth+$subs_Fdate.substr(7,3);

		// 종료날짜 달이 12보다 큰 경우		
		}else if(EdateMonth>12){
			// 종료날짜 연도 = 시작날짜 연도 +1
			let EdateYear = String(parseInt($subs_Fdate.substr(0,4))+1); 
			// 종료날짜 달 - 12 한 다음 String으로 바꾼 다음 앞에 0을 붙인다. ex) 14 -> "02"
			let StringEdateMonth = "0"+String(EdateMonth-12);
			// 종료날짜 = 종료날짜 연도 + 종료날짜 달 + 시작날짜 일
			$subs_Edate = EdateYear+$subs_Fdate.substr(4,1)+StringEdateMonth+$subs_Fdate.substr(7,3);
		}else{
			//그 외
			// String으로 바꿈 ex) 11 -> "11"
			let StringEdateMonth = String(EdateMonth);
			// 종료날짜 = 시작날짜 연도 + 종료날짜 달 + 시작날짜 일
			$subs_Edate = $subs_Fdate.substr(0,5)+StringEdateMonth+$subs_Fdate.substr(7,3);
		}

		//hidden tag에 각각 시작날짜와 종료날짜 넣기
		$("#subs_Fdate").val($subs_Fdate);
		$("#subs_Edate").val($subs_Edate);
		//pdto에 값 넣어서 orderPage에 넘기기
		$("form").attr("action","${pageContext.request.contextPath }/product/orderPage");
		$("form").attr("method","POST");
	 	$("form").submit();
	
}
</script>

<!-- jquery.ui datapicker 관련 css, js -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
// Cannot read property 'msie' of undefined 에러 나올때
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();

// datepicker(배송일) 특정날짜만 활성화
$(function() {
	//===오늘 날짜===
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 
	
	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
		month = "0" + month; 
	} 
	if(day.length == 1){ 
		day = "0" + day; 
	} 
	
	var todayDate = year + "" + month + "" + day;
	
	//===선택가능 날짜===
		var availableDates = ["2019-09-12", "2019-09-17", "2019-09-18", "2019-09-19"];
		
		//선택가능 날짜 배열에 있는 값이 오늘날짜보다 과거인 경우 제거
		//연도가 과거인 경우	
		for(var i = 0; i<availableDates.length; i++){		
			var aDatesYear = parseInt(availableDates[i].substr(0,4));
			if(aDatesYear<parseInt(year)){
				availableDates.splice(i,1);
				i-=1;
			}
		}
		console.log(availableDates)
		//월이 과거인 경우
		for(var i = 0; i<availableDates.length; i++){		
			var aDatesMonth = parseInt(availableDates[i].substr(5,2));
			if(aDatesMonth<parseInt(month)){
				availableDates.splice(i,1);
				i-=1;
			}
		}
				console.log(availableDates)
		//일이 과거인 경우
		for(var i = 0; i<availableDates.length; i++){
			var aDatesDay = parseInt(availableDates[i].substr(8,2));
			console.log("aDatesDay"+aDatesDay)
			console.log("day"+parseInt(day))
			if(aDatesDay<parseInt(day)){
				availableDates.splice(i,1);
				i-=1;
			}
		}
		console.log(availableDates)

		function available(date) {			

			var thismonth = date.getMonth()+1;
			var thisday = date.getDate();

			if(thismonth<10){
				thismonth = "0"+thismonth;
			}
			if(thisday<10){
				thisday = "0"+thisday;
			}
			ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;
			





		  if ($.inArray(ymd, availableDates) >= 0) {

				return [true,"",""];
			} else {
		    return [false,"",""];
		  }
		}


    $( "#datepicker" ).datepicker({
    dateFormat: 'yy.mm.dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: false,
		changeYear: false,
		yearSuffix: '년',
		regional: "ko",
		beforeShowDay: available,
		// minDate: 0

		}).datepicker("setDate", new Date(availableDates[0]));
		
});
</script>
<script>
// 구성버튼 누르면 열기&닫기
var acc = document.getElementsByClassName("accordion");

for (var i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
		this.classList.toggle("active");

    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>
