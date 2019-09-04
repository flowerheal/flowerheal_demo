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
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
     <link href="${pageContext.request.contextPath }/resources/css/blog.css" rel="stylesheet">
  </head>
  <body>
	<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col text-center">
        <a class="blog-header-logo text-dark" href="${pageContext.request.contextPath }">꽃송이<span class="Lang_Ch">家</span></a>
      </div>
<!--       <div class="col-2">
        <a class="text-muted" href="#"><i class="fas fa-home fa-2x"></i></a>
      </div> -->
    </div>
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col d-flex ">
      	<div class="col-md-6 py-1" id="memberMsg">찾아가는 싱그러움, 꽃송이가</div>
      	<div class="col-md-6  d-flex justify-content-end">
        <a class="btn btn-lg btn-outline-secondary mr-2" href="${pageContext.request.contextPath }/login/loginForm">로그인</a>
        <a class="btn btn-lg btn-outline-secondary" href="${pageContext.request.contextPath }/member/memberJoinForm">회원가입</a>
      	</div>
      </div>
    </div>
  </header>

  <div class=" py-1 mb-2">
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Expand at md</a>
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
    <form class="form-inline my-2 my-md-0">
      <input class="form-control" type="text" placeholder="Search">
    </form>
  </div>
</nav>
  </div>
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