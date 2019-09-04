<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">


<style>
.tabletMode{
	display:none;
}
@media (min-width: 768px) {
	.mobileMode{
		display:none;
	}
	.tabletMode{
		display:flex;
		flex-flow: column;
	}
}
</style>
<script>
window.addEventListener("load",init,false);
function init(){
 	$(".btn").on("click",function(){
		if(this.classList.contains("modifyBtn")){
			document.location.href= this.getAttribute("data-url");
		}else{
			if(confirm("정말 삭제하시겠습니까?")){
				document.location.href= this.getAttribute("data-url");
			}
		}
	});
}
</script>
<jsp:include page="../header.jsp" />
<section class="container mobileMode">
	<div class="row">
		<div class="col h2">회원정보 리스트</div>
	</div>
	<div class="row">
		<div class="col">아이디</div>

		<div class="col">별칭</div>

		<div class="col">상세보기</div>
	</div>
	<c:forEach items="${memberList }" var="mdto">
	<div class="row">
		<div class="col">${mdto.id}</div>
		<div class="col">${mdto.nickname}</div>
		<div class="col"><button class="btn btn-secondary moreInfo" data-url="">상세보기</button></div>
	</div>
	</c:forEach>
</section>
<section class="container tabletMode">
	<div class="row">
		<div class="col col-sm-12 h2">회원정보 리스트</div>
	</div>
	<div class="row">
		<div class="col-2">아이디</div>
		<div class="col-2">전화번호</div>
		<div class="col-1">별칭</div>
		<div class="col-1">성별</div>
		<div class="col-1">지역</div>
		<div class="col-1">생년월일</div>
		<div class="col-1">가입일</div>
		<div class="col-1">수정일</div>
		<div class="col-1">수정일</div>
		<div class="col-1">수정</div>
		<div class="col-1">삭제</div>
	</div>
	<c:forEach items="${memberList }" var="mdto">
	<div class="row">
		<div class="col-2">${mdto.id}</div>
		<div class="col-2">${mdto.tel}</div>
		<div class="col-1">${mdto.nickname}</div>
		<div class="col-1">${mdto.gender}</div>
		<div class="col-1">${mdto.region}</div>
		<div class="col-1">${mdto.birth}</div>
		<div class="col-1">${mdto.cdate }</div>
		<div class="col-1">${mdto.udate }</div>
		<div class="col-1"><button class="btn btn-warning modifyBtn" data-url="${pageContext.request.contextPath}/member/memberModifyForm/${mdto.id }">수정</button></div>
		<div class="col-1"><button class="btn btn-danger deleteBtn" data-url="${pageContext.request.contextPath}/member/memberDelete/${mdto.id }">삭제</button></div>
	</div>
	</c:forEach>
</section>

<jsp:include page="../footer.jsp" />