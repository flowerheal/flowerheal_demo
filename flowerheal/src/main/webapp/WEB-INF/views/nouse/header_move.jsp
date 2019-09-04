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
    <title>springFramework</title>
    <!-- favicon.ico 404 없앰 -->
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

    <!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath }/webjars/bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">
    <!-- font awesome -->
		<link href="${pageContext.request.contextPath }/webjars/font-awesome/5.9.0/css/all.css" rel="stylesheet">

    <style>
			header nav{
				margin: 0 auto;
			}


      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }



/* Dropdown Button */
/* .dropbtn {
  background-color: #3498DB;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
} */

/* Dropdown button on hover & focus */
/* .dropbtn:hover, .dropbtn:focus {
  background-color: #2980B9;
} */

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #696969;
	
  min-width: 6.5rem;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color:white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}

.btn-lg{
	padding: 0.6rem;
}
@media (min-width: 576px) {
	.btn-lg{
		padding: 0.5rem 1rem;
	}
}


      @media (min-width: 768px) {

        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }

	.navbar-expand-md .navbar-collapse {
		width:80%;
	}
	#searchBar{
		justify-content: flex-end;
	}
      }
    </style>
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
     <link href="${pageContext.request.contextPath }/resources/css/blog.css" rel="stylesheet">
  </head>
  <body>

  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col text-center">
        <a class="blog-header-logo text-dark bold" href="${pageContext.request.contextPath }">다채롭-티</a>
      </div>
    </div>
 <nav class="navbar navbar-expand-md navbar-light col-lg-10 col-xl-8">

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="col-md-8 collapse navbar-collapse" id="navbarsExample04">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown04">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-md-0" id="searchBar">
      <input class="form-control" type="text" placeholder="Search">
    </form>
  </div>


 
    
    
    <div class="col-9 col-md-4 flex-wrap mx-0">

			<c:choose>
					<c:when test= "${empty sessionScope}">
						<div class="d-flex justify-content-end">
							<a class="btn btn-lg btn-outline-secondary mr-2" href="${pageContext.request.contextPath }/login/loginForm">로그인</a>
							<a class="btn btn-lg btn-outline-secondary" href="${pageContext.request.contextPath }/member/memberJoinForm">회원가입</a>
						</div>
					</c:when>
					<c:otherwise>

							<div class="d-flex justify-content-end">
								<div class="dropdown">
								<a class="dropbtn btn btn-lg btn-outline-secondary dropdown-toggle mr-2" onclick="myFunction()" href="javascript:void(0);">${sessionScope.user.nickname}님</a>
								<div class="dropdown-content" id="myDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath }/member/memberModifyForm/${sessionScope.user.id}">내 정보수정</a>
									<a class="dropdown-item" href="${pageContext.request.contextPath }/member/mPwChangeForm/${sessionScope.user.id}">비밀번호 수정</a>
									<a class="dropdown-item" href="#"></a>
									<a class="dropdown-item" href="${pageContext.request.contextPath }/member/memberDeleteForm/${sessionScope.user.id}">회원 탈퇴</a>
								</div>
								</div>
								<a class="btn btn-lg btn-outline-secondary" href="javascript:logOut();">로그아웃</a>
							</div>
							
					</c:otherwise>
				</c:choose>          
      </div>
    </nav>  
  </header>
<!-- 
  <div class=" py-1 mb-2">
<nav class="navbar navbar-expand-md navbar-light">

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarsExample04">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown04">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-md-0" id="searchBar">
      <input class="form-control" type="text" placeholder="Search">
    </form>
  </div>


</nav>
	</div> -->
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


<!--   <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 text-muted" href="javascript:alert('공사중')">World</a>
      <a class="p-2 text-muted" href="javascript:alert('공사중')">U.S.</a>
      <a class="p-2 text-muted" href="javascript:alert('공사중')">Technology</a>
      <a class="p-2 text-muted" href="javascript:alert('공사중')">Design</a>
      <a class="p-2 text-muted" href="javascript:alert('공사중')">Culture</a>
      <a class="p-2 text-muted" href="javascript:alert('공사중')">게시판</a>
      <a class="p-2 text-muted" href="javascript:alert('공사중')">관리자</a>
    </nav>
  </div> -->