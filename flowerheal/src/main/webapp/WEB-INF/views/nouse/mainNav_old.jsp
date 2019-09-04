<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath }/resources/css/mainNav.css" rel="stylesheet">
    
    
<nav id="mainNav">
	<button class="openBtn"><i class="fas fa-bars"></i> MENU</button>
	<nav id="mobileNav" class="navbar navbar-light">
	  <div class="mb-auto pl-0">
	  	<div class="closeBtn"><a href="javascript:void(0)" class="closeBtn" >&times;</a></div>  	
	  	<div><a href="${pageContext.request.contextPath }">Home</a></div>
		  <div><a href="${pageContext.request.contextPath }/product/productList">Product</a></div>
	    <div><a href="<%=request.getContextPath() %>/bbs/list">Review</a></div>
<!-- 		  <div class="subnav">     -->
		    <div class="dropdown-btn subNav" id="openAbout"><a href="javascript:void(0)">About ▼</a></div>
			    <div class="dropdown-container">
			      <a href="#">Notice</a>
			      <a href="#">Q&A</a>
			      <a href="#">FAQ</a>
			      <a href="#">Event</a>
			   </div>
<!-- 		  </div> -->
		  </div>  
	  </nav>
	<nav id="desktopNav" class="navbar navbar-expand-md navbar-light">
	  <div class="mb-auto pl-0 nav-pills"> 	
	  	<div class="nav-link"><a href="${pageContext.request.contextPath }">꽃미힐미 소개</a></div>
		  <div class="nav-link"><a href="${pageContext.request.contextPath }/product/productList">구독 상품</a></div>
		  <div class="nav-link"><a href="${pageContext.request.contextPath }">원데이 클래스</a></div>
		  <div class="nav-link"><a href="${pageContext.request.contextPath }">상품 추천</a></div>
	    <div class="nav-link"><a href="<%=request.getContextPath() %>/bbs/list">후기 게시판</a></div>
<!-- 		  <div class="subnav">    --> 
		    <div class="nav-link dropdown-btn openSubNav"><a href="javascript:void(0)">Q&A</a></div>
			    <div class="dropdown-container col-12">
			      <a href="#">자주하는 질문</a>
			      <a href="#">FAQ</a>
			      <a href="#">고객센터</a>
			   </div>
		  </div>
<!-- 	  </div>   -->
  </nav>
<!-- <button class="openBtn"><i class="fas fa-bars"></i> MENU</button> -->
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
		this.nextElementSibling.classList.toggle("show");
	},false);

 	var openSubNav = document.getElementsByClassName("openSubNav")[0];
	openSubNav.addEventListener("mouseover",function(){
		this.nextElementSibling.classList.toggle("show");
	},false);
	openSubNav.addEventListener("mouseout",function(){
		this.nextElementSibling.classList.toggle("show");
	},false);

	// var dropdownContainer = openSubNav.nextElementSibling;
	// dropdownContainer.addEventListener("mouseover",function(){
	// 	this.classList.add("show");
	// 	this.previousElementSibling.style="background-color:rgb(128,128,0)";
	// 	this.previousElementSibling.firstChild.style="color:white";
	// },false);

	// dropdownContainer.addEventListener("mouseout",function(){
	// 	this.classList.remove("show");
	// 	this.previousElementSibling.style="background-color:none";
	// 	this.previousElementSibling.firstChild.style="color:black";
	// },false); 
}

// $(".dropdown-container, .dropdown-container a").on("mouseover",function(){
// 	$(".dropdown-container").addClass("show");
// 	$(".dropdown-container").prev().css("background-color,rgb(128,128,0)");
// 	$(".dropdown-container").prev().first().css("color,white");
// });
// $(".dropdown-container, .dropdown-container a").on("mouseout",function(){
// 	$(".dropdown-container").removeClass("show");
// 	$(".dropdown-container").prev().css("background-color,none");
// 	$(".dropdown-container").prev().first().css("color,black");
// });
// //$(".dropdown-container, .dropdown-container a").on("mouseout",closeContainer());





// 	$("#desktopNav div div").mouseover(function(){
// 		this.style="backgound-color:rgb(128,128,0)";
// 		this.firstChild.style="color:white"
// 	})
// 	$("#desktopNav div div").mouseout(function(){
// 		this.style="backgound-color:none";
// 		this.firstChild.style="color:black"
// 	}) 

</script>
