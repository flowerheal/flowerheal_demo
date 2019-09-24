<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath }/resources/css/mainNav.css" rel="stylesheet">
    
    
<nav id="mainNav">
	<button class="openBtn"><i class="fas fa-bars"></i> MENU</button>
	<nav id="mobileNav" class="navbar navbar-light">
	  <div class="mb-auto pl-0">
	  	<div class="closeBtn"><a href="javascript:void(0)" class="closeBtn" >&times;</a></div>  	
			<div><a href="${pageContext.request.contextPath }/menu/aboutUs">꽃미힐미 소개</a></div>
			<div class="nav-link"><a href="${pageContext.request.contextPath }/product/productList">구독 상품</a></div>
		  <div><a href="javascript:alert('준비중')">원데이 클래스</a></div>
	    <div><a href="javascript:alert('준비중')">상품 추천</a></div>
	    <div><a href="javascript:alert('준비중')">후기 게시판</a></div>
			<div class="dropdown-btn subNav" id="openAbout"><a href="javascript:void(0)">고객센터 ▼</a>
				<div class="dropdown-container">
					<a href="<%=request.getContextPath() %>/bbs/list">공지/이벤트</a>
					<a href="javascript:alert('준비중')">자주 하는 질문</a>
					<a href="javascript:alert('준비중')">Q&A</a>
				</div>
			</div>
		</div>  
	</nav>
	<nav id="desktopNav" class="navbar navbar-expand-md navbar-light">
	  <div class="mb-auto pl-0 nav-pills"> 	
	  	<div class="nav-link"><a href="${pageContext.request.contextPath }/menu/aboutUs">꽃미힐미 소개</a></div>
		  <div class="nav-link"><a href="${pageContext.request.contextPath }/product/productList">구독 상품</a></div>
		  <div class="nav-link"><a href="javascript:alert('준비중')">원데이 클래스</a></div>
		  <div class="nav-link"><a href="javascript:alert('준비중')">상품 추천</a></div>
	    <div class="nav-link"><a href="javascript:alert('준비중')">후기 게시판</a></div>
			<div class="nav-link dropdown-btn openSubNav"><span>고객센터 ▼</span>
				<div class="dropdown-container">
					<a href="<%=request.getContextPath() %>/bbs/list">공지/이벤트</a>
					<a href="javascript:alert('준비중')">자주 하는 질문</a>
					<a href="javascript:alert('준비중')">Q&A</a>
				</div>
			</div>
		</div>
  </nav>
</nav>


<script>
window.addEventListener("load",init,false);
function init(){
	var closeBtn = document.getElementsByClassName("closeBtn")[0];
	closeBtn.addEventListener("click",function(){
		this.parentElement.parentElement.style.display="";
	},false);

	var openBtn = document.getElementsByClassName("openBtn")[0];
	openBtn.addEventListener("click",function(){
		this.nextElementSibling.style.display="flex";
	},false);

	var openAbout = document.getElementById("openAbout");
	openAbout.addEventListener("click",function(){
		this.children[1].classList.toggle("show");
	},false);
}






 $("#desktopNav div div").mouseover(function(){
	this.firstChild.style="color:white"
})
$("#desktopNav div div").mouseout(function(){
	this.firstChild.style="color:black"
}) 

</script>
