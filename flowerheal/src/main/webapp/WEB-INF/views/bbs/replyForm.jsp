<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">

<style>
	.form-row,
	.form-group,
	.btn-primary {
		display: flex;
		flex-flow: column wrap;
		align-items: center;
	}

	.btn-primary {
		margin: auto;
	}

/* 	form,
	.form {
		width: 80%;
		margin: 3rem auto;
		display: flex;
		flex-flow: column;
		font-size: 1.2rem;
	}
 */
	form .col {
		display: flex;
	}

/* 	.form-group .col .form-check {
		width: 50%;
	} */
/* 	.form-group span{
	 margin: 0 3rem !important;
	} */
	
	form .row,
	.form .row{
		margin: 0.5rem 0 !important;
		justify-content: center;
	}
	
	form .row label{
    margin: auto 0;
	}
	form .row .btn{
	  margin-left: 0.5rem !important;
	  margin-right: 0.5rem !important;
	}
	
	form .invalid-feedback{
		text-align: center;
	}
	form textarea.form-control {
		min-height: 200px;
/* 		font-size: 0.8rem; */
	}
	.form-control:disabled, .form-control[readonly] {
		background-color: #fff !important;
		opacity: 1;
	}



	@media (min-width: 576px) {
		form .row label{
		  text-align: center;
		}
	}
	
	
	
</style>
<jsp:include page="../header.jsp" />
<section class="container">
	<form:form modelAttribute="bbsDTO" action="${pageContext.request.contextPath}/bbs/reply">
	<form:hidden path="bid" value="${sessionScope.user.id}"/>
	<form:hidden path="bgroup" value="${bbsDTO.bgroup}"/>
	<form:hidden path="bstep" value="${bbsDTO.bstep}"/>
	<form:hidden path="bindent" value="${bbsDTO.bindent}"/>
		<div class="row justify-content-center">
			<p class="h3">답글 작성</p>
		</div>
		<div class="row">
	    <form:label path="btitle" class="col-sm-3">제목</form:label>
	    <form:input path="btitle" class="form-control col-sm-8" type="text"
	    						value="[답글]: ${bbsDTO.btitle }"></form:input>
			<div class="btitle invalid-feedback"><form:errors path="btitle" cssClass="errMsg"></form:errors></div>
		</div>
		<div class="row">
	    <form:label path="bname" class="col-sm-3">작성자</form:label>
	    <form:input path="bname"
	    						class="form-control col-sm-8 border-0" 
	    						type="text"
	    						readonly="true"
	    						value="${sessionScope.user.name}"></form:input>
		</div>
		<div class="row">
	    <form:label 	 path="bcontent" class="col-sm-3">내용</form:label>
	    <form:textarea path="bcontent" class="form-control col-sm-8"
	    							 ></form:textarea>
			<div class="bcontent invalid-feedback"><form:errors path="bcontent" cssClass="errMsg"></form:errors></div>
		</div>
		<div class="row justify-content-end">
	    <input class="btn btn-outline-dark" type="button" value="등록">
	    <input class="btn btn-outline-dark" type="button" value="취소">
	    <input class="btn btn-outline-dark" type="button" value="목록">
		</div>
	</form:form>
</section>


<jsp:include page="../footer.jsp" />
<script src="${pageContext.request.contextPath }/resources/js/bbsForms.js"></script>
<script>
 $( document ).ready(function() {
 	$(".row .btn").on("click",writebuttonF);
 	$("textarea").val("[원글]:${bbsDTO.bcontent }")
 });
 		
//답글쓰기 버튼들 click function
 function writebuttonF(){
	switch(this.value){
		case "등록":
			//유효성 검사
			valChk();
		break;

		case "취소":
			$("#btitle").val("");
			$("textarea").val("");
		break;
	
		case "목록":
			document.location.href="${pageContext.request.contextPath}/bbs/list/${page}";
		break;
	}
}
</script>
