<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     


<jsp:include page="../header.jsp" />

<style>
 #cartList
 {
 	border: 1px skyblue solid;
 }
 

</style>


<div class="container">
	<!-- 상품 리스트 Grid -->
	<div class="row justify-content-center mx-auto my-3 py-3">
		<div class="col col-md-10 p-0">
			<div class="row justify-content-center mt-3">
				<p class="h4">장바구니</p>
			</div>
			<div id="cartList">
				<div class="row my-1 listHeader">
					<div class="col-6 text-center">상품 이름</div>
					<div class="col-4 text-center"> 주문기간 </div>
					<div class="col-2 text-center"> 가격 </div>
				</div>
				<div class="lists">
					<c:forEach var="rec" items="${list }">
					<div class="row">
						<div style="display: none">${rec.cart_name }</div>
						<div class="col-6 text-left">
						<div class="col">${rec.cart_fdate } ~ ${rec.cart_edate }</div>
						</div>
						<div class="col-4 text-center">${rec.cart_price} 원</div>
						<input type="checkbox" name="option1" id="option1" checked="checked">
						<button type="button" class="btn btn-black" id="cartDelBtn">삭제</button>
					</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 카트에 담기 버튼(하단 고정) -->
			<div class="row submit_row submit_checkout">
				<button type="button" class="btn btn-black" id="selecDelBtn">선택한 상품 삭제하기</button>
				<button type="button" class="btn btn-black" id="selectOrderBtn">선택한 상품 주문하기</button>
				<button type="button" class="btn btn-black" id="allOrderBtn">모든 상품 주문하기</button>
			</div>
			
		</div>
	</div>
</div>


<br>
기타 버튼
체크 상품만 구매+전체 상품 구매
<br>






<jsp:include page="../footer.jsp" />