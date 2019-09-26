<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>

.headtext{
font-size:2rem;
}


/* 카트에 담기, 주문하기 */
.submit_checkout {
	position: relative;
	z-index: 0;
	height: auto; 
}
.btn-black{
	width: 100%;
	height: 4rem;
	margin: 0.5rem 0;
	font-size: 1.5rem !important;
    border:1px solid #FFA59C !important;
   /*  border-radius: 2em;  outline 으로 해서 안되는거 같음*/ 
   /*  background-color: #FFA59C;  안먹음*/
}

.btn-black:hover{ 

 background-color: #FFA59C;
 color:white !important;  /*글색깔*/
} 



/* 구독기간 버튼 */


.product_SubsCnt_Btn:hover{
	background: none;
	
}
.product_SubsCnt_Btn.active{
	background: warning !important;
    
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
.orderOption1{ /*orderDate*/
	  /*주문 forom box줄*/
	
	font-size: 1.5rem;
	
}
.orderOption2{ /*orderMore*/
     /*주문 forom box줄*/
	font-size: 1.2rem;
	
}
.orderOption3{ /*ordersubBtn*/
	/* outline: 1px solid #E88E9D; */ /*주문 forom box줄*/
	font-size: 1.5rem;
	
}
.orderOption4{ /*orderCost*/
  font-size:1.2rem;

}

/* Style the buttons that are used to open and close the accordion panel */
.accordion { /*orederMore*/
/*   background-color: #eee; */
  color: #FFA09B;
  cursor: pointer;
  padding: 15px;
  width: 100%;
  text-align: left;
  border: none;
  outline: 1px solid #FFA59C ;
  transition: 0.4s;
  font-size:1.5rem;
}

/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
.accordion.active, .accordion:hover {
  background-color: #FFA59C;
  width: 100%;
  color:white !important;  /*글색깔*/
}

/* Style the accordion panel. Note: hidden by default */
.panel {
  padding: 0 20px;
  background-color: white;
  display: none;
  overflow: hidden;
}


@media (min-width: 768px) {
.form-row #productName{
	font-size: 1.75rem;
}


}

	p {  /*금액들*/
	 font-size: 100px;
	}
	
	button{
	width:120px;
	height:35px;
	
	}
	
	

</style>



<jsp:include page="../header.jsp" />
<section class="container">
<div class="row my-5"><p class="headtext">${pdto.product_Name }</p></div>

<div class="row" >
	<!-- 상품 대표이미지 -->
	<div class="col-md-6">
	  <img src="${pageContext.request.contextPath }/resources/img/product/product1/product-4.jpg"
	       width="100%" height="auto" alt="#" />
	</div>
	<div class="col-md-6 ">
		<!-- 상품 구성 고르기 폼 -->
<!-- 		<form action="${pageContext.request.contextPath}/product" class="row my-3"> -->
<!-- - -->		<form class="row" >
			<div class="form-row " style="outline:2px solid #FEC5B9;">
				<input type="hidden" name="user_id" id="user_id" value="${sessionScope.user.id}"> 
				<input type="hidden" name="product_Num" id="product_Num" value="${pdto.product_Num}"> 
				<input type="hidden" name="product_Name" id="product_Name" value="${pdto.product_Name }"> 
			  <!-- - --><div class="col-12 pb-4" id="productName" >${pdto.product_Name }</div>
				<div class="col-12 pb-3 d-flex justify-content-around orderOption1" id="orderDate">
					<i class="far fa-calendar-alt my-auto"></i> 
					<input type="hidden" name="subs_Fdate" id="subs_Fdate"> 
					<input type="hidden" name="subs_Edate" id="subs_Edate"> 
					<input type="text" style="text-align:center; border:1px solid #FFA09B; color:#5D5D5D;" id="datepicker" />
					 <i class="fas fa-plus my-auto"></i> 
				</div>
				<div class="col-12 pb-3 orderOption2" id="orderMore">
					<div class="accordion pb-3">구성 변경</div>
	    
					    <div class="panel pt-3">
					    
					    <!-- option0 : 꽃다발/화분 : 제외 불가 -->
						<input type="hidden" name="option0" id="option0" value="${pdto.product_Price }"> 
						
						<input type="checkbox"  name="option1" id="option1" value="4000" checked="checked" 
						style="width:20px;height:20px">
						<label for="option1" style="font-size:15pt ;"><span></span>구성품1(+4000)</label> 
			            <input type="checkbox" class="ml-5"  name="option2" id="option2" value="5000" checked="checked"
			            style="width:20px;height:20px">
					    <label for="option2" style="font-size:15pt ;"><span></span>구성품2(+5000)</label>
					    
						
						<div style="color:#E8504A;"> 꽃다발/화분은 구성에서 제외할 수 없습니다</div>
					   </div>
					
					
				</div>
				<div class="row col-12 pb-3  orderOption3" id="product_SubsCnt_Btns">
					<input type="hidden" name="product_SubsCnt" id="product_SubsCnt"><!-- warning 버튼 노랑색 -->
					<button type="button" class="ml-3 btn product_SubsCnt_Btn btn btn-outline-warning" value="1">1개월권</button>
					<button type="button" class="ml-3 btn product_SubsCnt_Btn btn btn-outline-warning" value="2">2개월권</button>
					<button type="button" class="ml-3 btn product_SubsCnt_Btn btn btn-outline-warning" value="6">6개월권</button>
				    <!-- <button type="button" class="ml-5 btn product_SubsCnt_Btn btn btn-outline-warning">정기결제</button> -->  
				</div>
				<div class="row col-12 pb-3 d-flex justify-content-around orderOption4" id="orderCost">
				<!-- 배송비 주석처리함 -->
<!-- 					<div class="col-12 price" style="text-align:right; font-size:1.5rem;">
					금액
					<input type="text" style="border:none; text-align:right;"    name="productCost" id="productCost" readonly="readonly">원</div>
					<div class="col-12 " style="text-align:right; font-size:1.5rem;">
					배송비
					<input type="text" style="border:none; text-align:right;"  name="postCost" id="postCost" readonly="readonly">원</div>
					 -->
					<div class="col-12 " style="text-align:right; font-size:1.5rem;">
					금액
					<input type="text" style="border:none; text-align:right;"  name="product_Price" id="product_Price" readonly="readonly">원</div>
				</div>

			</div>
		</form>

			<!-- 카트에 담기 버튼(하단 고정) -->
			<div class="row pt-3 pb-5 submit_row submit_checkout ">
				<button type="button" class="btn btn-black" style="color:#FFA59C" id="addToCartBtn">카트에 담기</button>
				<button type="button" class="btn btn-black" style="background-color: #FFA59C; color:#fff; " id="orderPageBtn">주문하기</button>
			</div>

	</div>
	</div>

<!-- 상품 상세 내용 -->
<div class="row my-5 pt-5">



	<div class="col-md-12 pt-5">
		  <img src="${pageContext.request.contextPath }/resources/img/product/product1/productbig4.jpg"
					 width="100%" height="auto" alt="#" />
	<br><br><br>
 <img src="${pageContext.request.contextPath }/resources/img/product/product1/productbig4-2.jpg"
	 width="100%" height="auto" alt="#" />
	 
	 <p class="text-center" style="font-size:1.5rem; color:#5D5D5D; font-weight:bold;">
	   작은 소품으로도 힐링을 느껴보세요.<br>
	   </p>
	   
	   <p class="text-center" style="font-size:1.2rem; color:#8C8C8C;">
	    비싸거나 화려한 장식품 보다는 작고 귀여운 화분을 벽에 걸어보세요.<br>
	   우리의 눈은 초록색을 보면 피로가 풀리다고 했어요.<br>
	   물을 주지 않아도 햇빛으로만 먹고사는 식물들과 함께 공기도 정화하고 <br>
	   나에게 작은 힐링을 선물하세요.
	 
	 
	 </p>
	 
<img src="${pageContext.request.contextPath }/resources/img/product/product1/productbig4-3.jpg"
	 width="100%" height="auto" alt="#" />	
	 
	  <p class="text-center"style="font-size:1.5rem; color:#5D5D5D; font-weight:bold;">
	    책과 서류들로 쌓여있는 책상. 
	    </p>
	    
	    <p class="text-center"style="font-size:1.2rem; color:#8C8C8C;">
	    당신의 무뚝뚝한 책상과 테이블에 변신을 해보세요.<br>
	    심플해보이지만 스테인 재질의 장식품이 당신의 책상을 좀 더 세련있게 보이게 할꺼예요.<br>
	    선물받은 장미 한송이나 아무런 꽃송이를 꽂아두어도 예쁘답니다.<br>
	    녹슬지 않고 항상 당신옆에 힐링이 되어줄거예요.
	 
	 
	 </p>
	 
	  
	</div>
	
</div>
</section>
<!-- 푸터 -->
<jsp:include page="../footer.jsp" />

<!-- 상품상세페이지 관련 js -->
<script src="${pageContext.request.contextPath }/resources/js/product.js"></script>
<script>
//구성버튼 누르면 열기&닫기
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

//구독기간 설정버튼
function product_SubsCnt_BtnF(){
	$(".product_SubsCnt_Btn.active").removeClass("active");
	$(this).toggleClass("active");
	let $product_SubsCnt = $(this).val();
	$("#product_SubsCnt").val($product_SubsCnt);
}


// 장바구니, 주문하기 유효성 검사
function orderCheckF(){
	var user = "${sessionScope.user == null ? null : sessionScope.user.id}";
	var state = false;
	//로그인전이면 로그인화면으로 이동
	if(user == null || user == "") {
		
		if(confirm("로그인 하시겠습니까?")){
			document.location.href="${pageContext.request.contextPath }/login/loginForm";
		}
		state = false;
		return;
	}
	
	//구독기간 설정 안했다면 alert;
	if($("#product_SubsCnt").val()==""){
		alert("구독기간을 선택해주세요.");
		state = false;
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
		$subs_Fdate = $subs_Fdate.replace(/\./gi,"-");
		$subs_Edate = $subs_Edate.replace(/\./gi,"-");
		

		//hidden tag에 각각 시작날짜와 종료날짜 넣기
		$("#subs_Fdate").val($subs_Fdate);
		$("#subs_Edate").val($subs_Edate);
		state = true;
		return state;	
}


//카트에 담기 버튼 클릭
function addToCartBtnF(){
	if(orderCheckF()){//유효성 검사
		//pdto에 값 넣어서 productController에 addToCart에 넘기기
		
	var $url = "addToCart";
	
	var $product_Name = $("#product_Name").val();
	var $user_id ="${sessionScope.user.id}";
	var $product_Price =$("#product_Price").val();
	$product_Price = $product_Price.replace(/\,/g,''); // 30,000 String 형태를 30000 콤마 제거 후 Int형으로 넣음
	var $product_Num = $("#product_Num").val();
	var $product_SubsCnt = $("#product_SubsCnt").val();
	var $cart_Fdate = $("#subs_Fdate").val();
	var $cart_Edate = $("#subs_Edate").val();

	console.log($product_Name)
	$.ajax({
		type : "POST",    	 //http 전송 방식
		url  : $url,		//요청 url
		data : {
			"product_Name" : $product_Name,
			"user_id" : $user_id,
			"product_Price" : $product_Price,
			"product_Num" : $product_Num,
			"product_SubsCnt" : $product_SubsCnt,
			"cart_Fdate" : $cart_Fdate,
			"cart_Edate" : $cart_Edate,
			},
		//dataType : "JSON",   //요청시 응답데이터 타입
		//응답 성공시 처리사항
		success:function(result){	
			if(result=="YES"){
				if(confirm("장바구니로 이동하시겠습니까?")){
					document.location.href = "${pageContext.request.contextPath }/cart/cart2/"+"${sessionScope.user.id}";
				}
			}
		},
		//응답 실패시 처리사항
		error:function(xhr, status, err){		
			

			console.log("code:"+xhr.status);
			console.log("message:"+xhr.responseText );
			console.log("status:"+status);
			console.log("err:"+err);
		}	
				
	});//End of $.ajax		
		

	}
}


// 주문하기 버튼 클릭
function orderPageBtnF(){
		if(orderCheckF()){//유효성 검사
			//pdto에 값 넣어서 orderPage에 넘기기
			$("form").attr("action","${pageContext.request.contextPath }/product/orderPage");
			$("form").attr("method","POST");
		 	$("form").submit();
		} 	
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
		var availableDates = ["2019-10-04","2019-10-08","2019-10-09"];
		
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
/* 		for(var i = 0; i<availableDates.length; i++){
			var aDatesDay = parseInt(availableDates[i].substr(8,2));
			console.log("aDatesDay"+aDatesDay)
			console.log("day"+parseInt(day))
			if(aDatesDay<parseInt(day)){
				availableDates.splice(i,1);
				i-=1;
			}
		} */
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