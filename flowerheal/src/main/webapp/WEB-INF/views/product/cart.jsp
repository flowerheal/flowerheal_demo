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
	
	
	.itemDiv div{
		padding :0;
	}
	
	
	@media screen and (min-width: 768px) {
		div,span{font-size:1.1rem;}
	}
	@media screen and (min-width: 992px) {
		div,span{font-size:1.25rem;}
	}
	
	.cartList{
		outline: 1px solid #D5D5D5;
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
	  display:none;
	  border-radius: 3px;
	  content: "";
	 
	  width: 16px;
	  height: 16px;
	
	  background-color: #aaa;
	  box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);
	}
	input[type=checkbox]:checked + label:before {
	  content: "\2713";
	  text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	  font-size: 16px;
	  color: #f3f3f3;
	  text-align: center;
	  line-height: 16px;
	}
	
	.itemBtns :nth-child(1){
		margin-right: 0;
	}
	
	#changeItemBtn, #selectDeleteBtn{display:none}
	
	
	.btn{
	/* background: #FFA59C; */
    color:white !important;  /*글색깔*/
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
						
			<div class="row col-lg-11 col-xl-9 mb-3 priceDiv d-flex justify-content-between">
				<button type="button" class="btn col-md-3"  id="selectDeleteBtn">선택삭제</button>
					<div class="col-md-8 col-lg-7 d-flex justify-content-between mx-auto" id="total_price">
					
						<!-- 총 상품금액 여기에 -->
					</div>
			</div>

			<div class="col-4orderOrNotDiv">
				<button type="button" class="btn" style="background: #FFA59C;" id="keepShoppingBtn">계속 쇼핑하기</button>
				<button type="button" class="btn" style="background: #FFA59C;" id="orderBtn">주문결제하기</button>
			</div>
		</div>
	</section>
</section>



<script>

var memberId = "${sessionScope.user.id}";	//로긴아이디
var cartnum= 0;

$(function(){

	//카트목록 보이기
	cartList(memberId);
		
});//end od function()


//카트목록 보이기
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
			var cart_Num = 0;
			$.each(result,function(idx, cartList){
				cartList.product_Price = addComma(cartList.product_Price);
				str += '    <div class="row cartList" data-cnum="' +cartList.cart_num+ '">';
				str += '    <div class="row col-1 d-none checkboxDiv">';
				str += '      <input type="checkbox" name="itemCheck" id="itemCheck'+cartList.cart_num+'"';
				str += '      	     value="'+cartList.cart_num+'">';
				str += '      <label for="itemCheck'+cartList.cart_num+'"></label>';
				str += '    </div>';
				str += '    <div class="row col-12 itemDiv">';
				str += '      <div class="row col-md-8 col-lg-9 px-0">';
				str += '        <div class="col-md-7 col-lg-6" id="p_name"> ' + cartList.product_Name +' </div>';
				str += '        <div class="col-5 col-md-3 col-lg-3" id="p_price">' + cartList.product_Price + '원 </div>';
				str += '        <div class="col-5 col-md-2 col-lg-3" id="p_subsCnt">' + cartList.product_SubsCnt + '개월</div>';
				str += '        <div class="col-md-12 col-md-5 text-right">' + cartList.cart_Fdate +' ~ '+ cartList.cart_Edate+ '</div>';
				str += '      	<input type="hidden" id="p_Fdate" value='+cartList.cart_Fdate+'>';
				str += '      	<input type="hidden" id="p_Edate" value='+cartList.cart_Edate+'>';
				str += '      </div>';
				str += '      <div class="row col-md-2 itemBtns">';
				str += '        <button type="button" class="changeItembtn btn-sm btn-primary" id="changeItemBtn">구성 변경</button>';
				str += '        <button type="button" class="delCartbtn btn-sm btn-primary" onclick="delCartF(this)">삭제</button>';
				str += '      </div>';
				str += '    </div>';
				str += '    </div>';
				cart_Num += 1;
			});
			
			if(result[0]==null || cart_Num == 0){
				str += '<div class="row col-md-8 col-lg-10 my-3 mx-auto">';
				str += '<div class="col-12 px-0 d-flex justify-content-center">';
				str += '	<i class="fas fa-shopping-basket" style="font-size:14rem;"></i>';
				str += '</div>';
				str += '<div class="col-12 px-0 text-center">';
				str += '	장바구니가 비어있습니다.';
				str += '</div>';
				str += '</div>';
			}
			//장바구니목록 삽입
			$("#cartList").html(str);
			total_price(id);
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
	let $id = id;
	let $url = "${pageContext.request.contextPath }/cartRest/cartList"; 
	let str = "";
	let p_totalPrice = 0;
	$.ajax({
		type : "POST",    	 //http 전송 방식
		url  : $url,		//요청 url
		data : {"id" : $id},
		dataType : "JSON",   //요청시 응답데이터 타입
		//응답 성공시 처리사항
		success:function(result){	
			$.each(result,function(idx, cartList){
				p_totalPrice += cartList.product_Price
			});
				p_totalPrice = addComma(p_totalPrice);
				str += '<span>총 상품금액  </span> <span id="price">' + p_totalPrice + '원</span>';
			
			//장바구니목록 삽입
			$("#total_price").html(str);
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

// 정규식을 이용한 , 원화표시
function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
}

// ',' 콤마를 제거해주는 함수
function removeComma(num){
	return num = parseInt(num).replace(/\,/g,'');
}



</script>
<script src="${pageContext.request.contextPath }/resources/js/cart.js"></script> 

<jsp:include page="../footer.jsp" />
