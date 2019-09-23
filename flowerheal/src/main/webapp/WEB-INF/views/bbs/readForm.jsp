<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">

<style>

	
</style>
<jsp:include page="../header.jsp" />
<section class="container">
	<form:form modelAttribute="bbsDTO">
	<form:input path="bnum" type="hidden" value="${bbsDTO.bnum }"/>
	<form:input path="bid" type="hidden" value="${bbsDTO.bid }"/>
 		<div class="row justify-content-center">
			<p class="h3">게시글 보기</p>			
		</div>
		<div class="row">
	    <form:label path="btitle" class="col-sm-3">제목</form:label>
	    <form:input path="btitle" class="form-control col-sm-8"
	    						type="text" value="${bbsDTO.btitle }" readonly="true"/>
		</div>
		<div class="row">
	    <form:label path="bname" class="col-sm-3">작성자</form:label>
	    <form:input path="bname"
	    						class="form-control col-sm-8 border-0" 
	    						type="text"
	    						readonly="true"
	    						value="${bbsDTO.bname}"></form:input>
		</div>
		<div class="row">
	    <form:label 	 path="bcontent" class="col-sm-3">내용</form:label>
	    <form:textarea path="bcontent" value="${bbsDTO.bcontent }"
	    							 class="form-control col-sm-8" readonly="true"></form:textarea>
		</div>

	<!-- 게시글 보기 -->
		<div class="row justify-content-end" id="readMode">
			<input class="btn btn-outline-dark" type="button" value="답글">
		<!-- 작성자만 수정/삭제 기능 시작 -->
			<c:if test="${bbsDTO.bid == sessionScope.user.id}">
				<input class="btn btn-outline-dark" type="button" value="수정">
				<input class="btn btn-outline-dark" type="button" value="삭제">
			</c:if>
		<!-- 작성자만 수정/삭제 기능 끝 -->
			<input class="btn btn-outline-dark" type="button" value="목록">
		</div>

	</form:form>
	<jsp:include page="comment.jsp" />
</section>
<jsp:include page="../footer.jsp"/>

<script>
$( document ).ready(function() {
	//제목, 내용 border
	$("#btitle, #bcontent").css({"box-shadow":"none","border-color":"rgb(206, 212, 218)"});
	//작성자 border(없음)
	$("#bname").css({"box-shadow":"none"});
	//버튼 click function
	$(".row .btn").on("click",buttonF);

});
//버튼 click function
function buttonF(){
	switch(this.value){
		case "답글":
			//로그인체크
			if(`${sessionScope.user.id}` ==''){
				if(confirm('로그인 후 답글작성이 가능합니다\n로그인 하시겠습니까?')){
					document.location.href='${pageContext.request.contextPath }/login/loginForm';
				}
				return;
			}
			document.location.href="${pageContext.request.contextPath}/bbs/reply/${page}/${bbsDTO.bnum}";
		break;
		case "수정":
			document.location.href="${pageContext.request.contextPath}/bbs/modify/${page}/${bbsDTO.bnum}";	
		break;	
		case "삭제":
			if(confirm("삭제하시겠습니까?")){
				document.location.href="${pageContext.request.contextPath}/bbs/delete/${page}/${bbsDTO.bnum}";
			}
		break;
		case "목록":
			document.location.href="${pageContext.request.contextPath}/bbs/list/${page}/${searchType}/${keyword}";
		break;
	}

}
</script>
