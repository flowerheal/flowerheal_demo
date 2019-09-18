<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../header.jsp" />

<!-- Form CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">
<!-- <style>
 div#gender{
 	height:fit-content;
 }
 div#gender .row{
 	margin: 0 !important;
 }

 #addressForm :nth-child(2),
 #addressForm :nth-child(3){
 	margin-bottom: 0.5rem;
 }
</style> -->
<section class="container">
	<div class="row text-center">
	<div class="col-12">welcome img</div>
	<div class="col-12 h4">주문이 완료되었습니다.</div>
	<div class="row col-12 afterJoinBtns">
		<div class="col-4"><input type="button" class="btn btn-outline-secondary btn-lg" value="다른 구독상품 만나기" /></div>
		<div class="col-4"><input type="button" class="btn btn-outline-secondary btn-lg" value="마이페이지" /></div>
	</div>
 </div>
</section>



<jsp:include page="../footer.jsp" />
<script>
$(".btn").on("click",function(){
	let $value = $(this).val();
	let $id = "${sessionScope.user.id}";
	switch($value){
	case "다른 구독상품 만나기" :
		document.location.href = "${pageContext.request.contextPath }/product/productList";
		break;
		
	case "마이페이지" :
		document.location.href = "${pageContext.request.contextPath }/member/memberMyPage"+$id;
		break;
	}
})
</script>