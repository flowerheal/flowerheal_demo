<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.submit_checkout {
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	z-index: 7000;
	background: black;
	height: 4rem; 
}
.btn-black{
	width: 100%;
	color:white !important;
	font-size: 1.5rem !important;
}
.btn-black:hover{
 background: black !important;
}
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
.active, .accordion:hover {
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
	.submit_checkout {
	position: relative;
	/* bottom: 0;
	left: 0;
	right: 0; */
	z-index: 0;
	/* background: black; */
	height: auto; 
}

}
</style>



<jsp:include page="../header.jsp" />
<section class="container">
<div class="row">
	<!-- 상품 대표이미지 -->
	<div class="col-md-7">
	  <img src="${pageContext.request.contextPath }/resources/img/product/product1/product1_banner.jpg"
	       width="100%" height="auto" alt="#" />
	</div>
	<div class="col-md-5">
		<!-- 상품 구성 고르기 폼 -->
		<form action="addToCart" class="row my-3">
			<div class="form-row">
				<div class="col-12" id="productName">코코낸내 허니잠 세트</div>
				<div class="col-12 d-flex justify-content-around orderOption" id="orderDate">
					<i class="far fa-calendar-alt my-auto"></i>
					<input type="text" id="datepicker" />
					<i class="fas fa-plus my-auto"></i>
				</div>
				<div class="col-12 orderOption" id="orderMore">
					<div class="accordion">구성</div>
					<div class="panel">
						<!-- option0 : 꽃다발/화분 : 제외 불가 -->
						<input type="hidden" name="option0" id="option0" value="21000"> 
						<div>향초(+4000)<input type="checkbox" name="option1" id="option1" value="4000" checked="checked"></div>
						<div>소이캔들(+5000)<input type="checkbox" name="option2" id="option2" value="5000" checked="checked"></div>
						<div>꽃다발/화분은 구성에서 제외할 수 없습니다</div>
					</div>
				</div>
				<div class="row col-12 d-flex justify-content-around orderOption" id="orderCost">
					<div class="col-12">가격<input type="text" name="productCost" id="productCost" readonly="readonly">원</div>
					<div class="col-12">배송비<input type="text" name="postCost" id="postCost" readonly="readonly">원</div>
					<div class="col-12">금액<input type="text" name="totalCost" id="totalCost"readonly="readonly">원</div>
				</div>
				
			</div>
		</form>

			<!-- 카트에 담기 버튼(하단 고정) -->
			<div class="row submit_row submit_checkout">
				<button type="button" class="btn btn-black">카트에 담기</button>
			</div>

		
	</div>
	</div>

<!-- 상품 상세 내용 -->
<div class="row my-2">
	<div class="col-md-12">
		  <img src="${pageContext.request.contextPath }/resources/img/product/blank.png"
		       width="100%" height="150%" alt="#" />
	</div>
</div>

</section>
<jsp:include page="../footer.jsp" />
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
</script>
<script>
	// datepicker(배송일) 특정날짜만 활성화
$(function() {
		//선택가능 날짜
		var availableDates = ["2019-09-09", "2019-09-13"];	
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
		beforeShowDay: available 

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
<!-- 금액 계산 로직 -->
<script>
$( document ).ready(function() {

///// 디폴트 /////
	let $option0 = parseInt($("#option0").val()); //꽃다발 & 화분 가격
	let $option1 = parseInt($("#option1").val()); //구성품 1 가격
	let $option2 = parseInt($("#option2").val()); //구성품 2 가격
	let $productCost = parseInt($option0 + $option1 + $option2); // 상품 가격
	$("#productCost").val($productCost); //가격 input 란에 삽입
	
	//배송비 : 2500원 / 3만원 이상 배송비 무료
	let $postCost = 0;
		if($productCost>=30000){
			$postCost = 0;
		}else{
			$postCost = 2500;
		}
	$("#postCost").val($postCost);	//배송비 input 란에 삽입
	//총액 = 상품 가격 + 배송비
	let $totalCost = $productCost+$postCost; 
	$("#totalCost").val($totalCost); //금액 input 란에 삽입



///// 체크박스 선택에 따를 가격 변동 /////
	$("input:checkbox").each(function(){
		$(this).on("click",function(){
			if(!$(this).is(":checked")){
				$productCost = $productCost - parseInt($(this).val()); //checked 안한 경우	
			}else{
				$productCost = $productCost + parseInt($(this).val()); //다시 checked한 경우
			}

			$("#productCost").val($productCost);//바뀐 가격 input 란에 삽입
			//바뀐 가격에 따른 배송비
			if($productCost>=30000){
					$postCost = 0;
				}else{
					$postCost = 2500;
				}
			$("#postCost").val($postCost);	//배송비 input 란에 삽입
			$totalCost = $productCost+$postCost; //금액 = 바뀐가격 + 바뀐가격에 따른 배송비
			$("#totalCost").val($totalCost); 		 //금액 input 란에 삽입

		});
	});


});
</script>