<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">

<jsp:include page="../header.jsp" />
<section class="container">
	<form:form modelAttribute="bbsDTO"
						 action="${pageContext.request.contextPath}/bbs/modify/${page}/${bbsDTO.bnum }">
	<form:input path="bnum" type="hidden" value="${bbsDTO.bnum }"/>
	<form:input path="bid" type="hidden" value="${bbsDTO.bid }"/>
 		<div class="row justify-content-center">
			<p class="h3">게시글 수정</p>			
		</div>
		<div class="row">
	    <form:label path="btitle" class="col-sm-3">제목</form:label>
	    <form:input path="btitle" class="form-control col-sm-8"
	    						type="text" value="${bbsDTO.btitle }"/>
			<div class="btitle invalid-feedback"><form:errors path="btitle" cssClass="errMsg"></form:errors></div>
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
	    							 class="form-control col-sm-8"></form:textarea>
			<div class="bcontent invalid-feedback"><form:errors path="bcontent" cssClass="errMsg"></form:errors></div>
		</div>
	<!-- 게시글 수정 -->
		<div class="row justify-content-end" id="modifyMode">
	    <input class="btn btn-outline-dark" type="button" value="취소">
	    <input class="btn btn-outline-dark" type="button" value="저장">
	    <input class="btn btn-outline-dark" type="button" value="목록">
		</div>
	</form:form>
</section>
<jsp:include page="../footer.jsp"/>

<script src="${pageContext.request.contextPath }/resources/js/bbsForms.js"></script>
<script>
 $( document ).ready(function() {
 	$(".row .btn").on("click",modifybuttonF);
 });		

 //수정폼버튼들 click function
function modifybuttonF(){
	switch(this.value){
		case "취소":
			document.location.href="${pageContext.request.contextPath}/bbs/read/${page}/${bbsDTO.bnum}";
		break;
		case "저장":
			//유효성 검사
			valChk();
		break;		
		case "목록":
			document.location.href="${pageContext.request.contextPath}/bbs/list/${page}";
		break;
	}
}
</script>
