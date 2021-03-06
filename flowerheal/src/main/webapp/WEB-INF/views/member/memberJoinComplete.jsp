<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../header.jsp" />

<!-- Form CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">
 <style>
 /* div#gender{
 	height:fit-content;
 }
 div#gender .row{
 	margin: 0 !important;
 }

 #addressForm :nth-child(2),
 #addressForm :nth-child(3){
 	margin-bottom: 0.5rem;
 } */
 
 
 /* 버튼 스타일 */
	.afterJoinBtns {
		position: relative;
		z-index: 0;
		height: auto; 
	}
	.btn-black{
		width: 100%;
		height: auto;
		margin: 0.5rem 0;
		font-size: 1.4rem !important;
	    border:1px solid #FFA59C !important;
	   /*  border-radius: 2em;  outline 으로 해서 안되는거 같음*/ 
	   /*  background-color: #FFA59C;  안먹음*/
	}
	
	.btn-black:hover{ 
	
	 background-color: #FFA59C;
	 color:white !important;  /*글색깔*/
	} 
	
	.btn-black:hover{ 
	
	 background-color: #FFA59C;
	 color:white !important; /*글자색*/
	} 
	
</style> 
<section class="container">
	<div class="row text-center">
	 <div class="col-md-4 pb-3">
       <!--  <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg> -->
       <img src="${pageContext.request.contextPath }/resources/img/member.png" class="img-fluid" alt="Responsive image">
       
      </div>
	<div class="col-12 pt-3 h4">회원가입이 완료되었습니다.</div>
	<!-- <div class="row col-12 afterJoinBtns">
		<div class="col-4"><input type="button" class="btn btn-outline-secondary btn-lg" value="로그인하기" /></div>
		<div class="col-4"><input type="button" class="btn btn-outline-secondary btn-lg" value="홈으로" /></div>
	</div> -->
	
	<div class="row col-6 afterJoinBtns">
	<button type="button" class="btn btn-black" style="color:#FFA59C" value="로그인하기">로그인하기</button>
	<button type="button" class="btn btn-black" style="color:#FFA59C" value="홈으로">홈으로</button>
	</div>		
	
 </div>
</section>



<jsp:include page="../footer.jsp" />
<script>
$(".btn").on("click",function(){
	let $value = $(this).val();
	switch($value){
	case "로그인하기" :
		document.location.href = "${pageContext.request.contextPath }/login/loginForm";
		break;
		
	case "홈으로" :
		document.location.href = "${pageContext.request.contextPath }";
		break;
	}
})
</script>

