<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
div, span{font-size:1rem;}

/* 계속쇼핑하기/주문결제하기 버튼 감싸는 div 태그 */
.orderOrNotDiv{
 	display: flex;
}




@media screen and (min-width: 768px) {
	div,span{font-size:1.1rem;}
}
@media screen and (min-width: 992px) {
	div,span{font-size:1.25rem;}
}

.cartList{
	outline: 1px solid gray;
	padding:0.5rem;
}
.cartList div{
	display:flex;
	justify-content: center;
	margin: auto 0;
}
input[type=checkbox] {
  display: none;
}
.checkboxDiv{
	margin:auto 0 !important;
}
.checkboxDiv label{
	margin-bottom: 0;
}
label:before {
  border-radius: 3px;
  content: "";
  display:flex;
 
  width: 16px;
  height: 16px;

  background-color: #aaa;
  box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);
}
input[type=checkbox]:checked + label:before {
  content: "\2713";
  text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
  font-size: 15px;
  color: #f3f3f3;
  text-align: center;
  line-height: 20px;
}

.itemBtns :nth-child(1){
	margin-right: 0;
}


</style>
<!-- Form CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">

<!-- 장바구니 관련 스크립트 -->

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<jsp:include page="../header.jsp" />
<section class="container">
	<section class="form">
		<div class="row my-3">
			<div class="col-md-8 col-lg-10 my-3 h5 text-center">장바구니</div>
			
			<div class="col-lg-11 col-xl-9 mb-3" id="cartList">
				<!--  ajax cartList로 불러오기-->
			</div>
				<button type="button" class="btn btn-sm btn-primary" id="selectDeleteBtn">선택삭제</button>
			
			
			<div class="col-lg-11 mb-3 priceDiv">
					<span>총 상품금액  </span>
					<div class="col-lg-7 d-flex justify-content-between mx-auto">
						<!-- 총 상품금액 여기에 -->
					</div>
			</div>

			<div class="col-md-9 mb-3 orderOrNotDiv">
				<button type="button" class="btn btn-primary" id="keepShoppingBtn">계속 쇼핑하기</button>
				<button type="button" class="btn btn-primary" id="orderBtn">주문결제하기</button>
			</div>
		</div>
	</section>
</section>

<script src="${pageContext.request.contextPath }/resources/js/cart.js"></script> 

<script>

var memberId = "${sessionScope.user.id}";	//로긴아이디
var cartnum= 0;

$(function(){

	//카트목록 보이기
	cartList(memberId);
	

	
});//end od function()


function cartList(id){
	console.log(id);
	let $id = id;
	let $url = "${pageContext.request.contextPath }/cartRest/cartList"; 
	let str = "";
	$.ajax({
		type : "POST",    	 //http 전송 방식
		url  : $url,		//요청 url
		data : {"id" : $id},
		dataType : "JSON",   //요청시 응답데이터 타입
		//응답 성공시 처리사항
		success:function(result){	
			$.each(result,function(idx, cartList){
				str += '    <div class="row cartList" data-cnum="' +cartList.cart_num+ '">';
				str += '    <div class="row col-1 checkboxDiv">';
				str += '      <input type="checkbox" name="check" class="itemCheck">';
				str += '      <label for="itemCheck"></label>';
				str += '    </div>';
				str += '    <div class="row col-11 itemDiv">';
				str += '      <div class="row col-md-7 px-0">';
				str += '        <div class="col-2"> ' + cartList.cart_num +' </div>';
				str += '        <div class="col-6"> ' + cartList.product_Name +' </div>';
				str += '        <div class="col-3">' + cartList.product_Price + '원 </div>';
				str += '        <div class="col-3">' + cartList.product_SubsCnt + '개월</div>';
				str += '      </div>';
				str += '      <div class="row col-md-5 itemBtns">';
				str += '        <button type="button" class="changeItembtn btn-sm btn-primary" id="changeItemBtn">구성 변경</button>';
				str += '        <button type="button" class="delCartbtn btn-sm btn-primary" onclick="delCartF(this)">삭제</button>';
				str += '      </div>';
				str += '    </div>';
				str += '    </div>';
			});
			

			//장바구니목록 삽입
			$("#cartList").html(str);

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

//총금액
function total_price(id){
	console.log(id);
	let $id = id;
	let $url = "${pageContext.request.contextPath }/cartRest/cartList"; 
	let str = "";
	$.ajax({
		type : "POST",    	 //http 전송 방식
		url  : $url,		//요청 url
		data : {"id" : $id},
		dataType : "JSON",   //요청시 응답데이터 타입
		//응답 성공시 처리사항
		success:function(result){	
			$.each(result,function(idx, cartList){
				str += '    <div class="row cartList" data-cnum="' +cartList.money+ '">';
			});
			

			//장바구니목록 삽입
			$("#cartList").html(str);

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

//장바구니 삭제
function delCartF()
{

	let $cart_num = $(".delCartBtn").closest("div[data-cnum]").attr("data-cnum"); 		 		 
	let $url = "${pageContext.request.contextPath }/cartRest/cartList/cancel/" + $cart_num;
	
	
	console.log("삭제 버튼 클릭 cart_num : "+ $cart_num );

	if(!confirm("삭제하시겠습니까?")) return false;				
	
	//AJAX 비동기 처리기술
	$.ajax({
		type : "DELETE",    	//http 전송 방식
		url  : $url,				  //요청 url
		dataType : "text",    //요청시 응답데이터 타입
		//응답 성공시 처리사항
		success:function(result){		
			console.log(result);
			cartList(memberId);
		},
		//응답 실패시 처리사항
		error:function(xhr, status, err){			
			console.log("code:"+xhr.status);
			console.log("message:"+xhr.responseText );
			console.log("status:"+status);
			console.log("err:"+err);
		}			
	});	//end of ajax	
}


</script>


<jsp:include page="../footer.jsp" />
