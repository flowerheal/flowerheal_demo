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

<jsp:include page="../header.jsp" />
<section class="container">
	<section class="form">
		<div class="row my-3">
			<div class="col-md-8 col-lg-10 my-3 h5 text-center">장바구니</div>
			<div class="col-lg-12 col-xl-9 mb-3">
				<div class="row cartList">
				<div class="row col-1 checkboxDiv px-0">
					<input type="checkbox" name="check" id="itemCheck1">
					<label for="itemCheck1"></label>
				</div>
				<div class="row col-11 itemDiv px-0">
					<div class="row col-md-7 px-0">
						<div class="col-7 col-sm-8">코코낸내 허니잠 세트</div>
						<div class="col-5 col-sm-4">30000원</div>						
					</div>
					<div class="row col-md-5 itemBtns px-0">
						<div class="col-5">6개월</div>		
						<button type="button" class="btn btn-sm btn-primary" id="changeItemBtn">구성 변경</button>
						<button type="button" class="btn btn-sm btn-primary" id="delCartBtn">삭제</button>
					</div>
				</div>
				</div>

				<button type="button" class="btn btn-sm btn-primary" id="selectDeleteBtn">선택삭제</button>
			</div>
			<div class="col-lg-11 mb-3 priceDiv">
					<div class="col-lg-7 d-flex justify-content-between mx-auto"><span>총 상품금액 </span><span>${pdto.product_Price}원</span></div>
			</div>

			<div class="col-md-9 mb-3 orderOrNotDiv">
				<button type="button" class="btn btn-primary" id="keepShoppingBtn">계속 쇼핑하기</button>
				<button type="button" class="btn btn-primary" id="orderBtn">주문결제하기</button>
			</div>
		</div>
	</section>
</section>

<jsp:include page="../footer.jsp" />
