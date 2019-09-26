<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>꽃미힐미</title>
    <!-- favicon.ico 404 없앰 -->
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

    <!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath }/webjars/bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">
    <!-- font awesome -->
		<link href="${pageContext.request.contextPath }/webjars/font-awesome/5.9.0/css/all.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
     
     
   <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="${pageContext.request.contextPath }/webjars/jquery/3.4.1/dist/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/webjars/popper.js/1.14.7/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath }/webjars/bootstrap/4.3.1/js/bootstrap.js"></script>


		<!-- owl.carousel 디폴트 css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owlcarousel/owl.carousel.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owlcarousel/owl.theme.default.css">
		<!-- owl.carousel 디폴트 js -->
		<script src="${pageContext.request.contextPath }/resources/js/owlcarousel/owl.carousel.js"></script>



  </head>
  <body>
  <header class="blog-header pt-4" id="blog-header">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col text-center">
        <a class="blog-header-logo text-dark bold" href="${pageContext.request.contextPath }">
        <img src="${pageContext.request.contextPath }/resources/img/logo1.png" 
        width="207" height="110"/></a>
      </div>
    </div>


 <nav class="navbar d-flex justify-content-end" id="headerLinks"> 

			<c:choose>
					<c:when test= "${empty sessionScope.user}">
						<div>
							<a class="px-2" href="${pageContext.request.contextPath }/member/memberJoinForm">회원가입</a>
							<span> | </span>
							<a class="px-2" href="${pageContext.request.contextPath }/login/loginForm">로그인</a>
							<span> | </span>
							<a class="px-2" href="javascript:alert('준비중')">ID/비밀번호 찾기</a>
						</div>
					</c:when>
					<c:when test="${sessionScope.msg == 'IsAdmin' }">
								<span class="px-2 greetMsg">${sessionScope.user.name}님 환영합니다.</span>
								<span> | </span>
								<a class="px-2" href="${pageContext.request.contextPath }/admin/subsList">구독관리</a>
								<span> | </span>
								<a class="px-2" href="javascript:logOut();">로그아웃</a>
					</c:when>
					
					<c:otherwise>

							<div>
								<span class="px-2 greetMsg">${sessionScope.user.name}님 환영합니다.</span>
								<span> | </span>
								<a class="px-2" href="${pageContext.request.contextPath }/member/mypage/memberMyPage/${sessionScope.user.id}">마이페이지</a>
								<span> | </span>
								<a class="px-2" href="${pageContext.request.contextPath }/cart/cart2/${sessionScope.user.id}">장바구니</a>
								<span> | </span>
								<a class="px-2" href="javascript:logOut();">로그아웃</a>
							</div>
							
					</c:otherwise>
				</c:choose>          
    </nav> 

<jsp:include page="mainNav.jsp" />
  </header>



	<script>
	function logOut(){
		var result = confirm("로그아웃 하시겠습니까?");
		if(result){
			this.location.href="${pageContext.request.contextPath }/login/logOut";
		}else{
			return;
		}
	}

	</script>

