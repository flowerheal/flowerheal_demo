<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">
	<style>
	.container>.form{ 
		width:90%;
		flex-flow: wrap-reverse;
		justify-content:start;
	}
	.form-row{
		width: 100%;
	}
	/* div.accordion */
	.accordion {
	  background-color: #FFF2E6;
	  color: #444;
	  font-weight: bold;
		/* cursor: pointer; */
		padding: 0.5rem;
	  width: 100%;
	  text-align: left;
	  border: none;
	  outline: none;
	  transition: 0.4s;
	  display: flex;
		justify-content: space-around;
	}
	
		
		/* accordion 중에 나의리뷰, 1:1리뷰*/
		.accordion.active {
		  background: #FFDEC9;
		}
		/* accordion 중에 나의리뷰, 1:1리뷰 hover하면 커서:포인터, 배경색 바뀜 */
		.accordion.active:hover {
			cursor: pointer;
		  background: #FFBDB0;
		  color:#fff;
		}
		
		
		/* accordion 안에 글씨와 화살표 크기 조절 */
		.accordion span,
		.accordion i,
		div{
			font-size: 1rem;
			margin: auto 0;
		}
	
	
	
	
	/* div.accordion 누르면 나오는 div.panel */
	.panel {
	  padding: 0 0.25rem;
	  background-color: white;
	  display: block;
	  overflow: hidden;
	}
	
	.pannel div{
		padding : 0;
	}
	.panel .row.noMobile{display:none;}
	.panel .row{
		display: flex;
		flex-flow: column wrap;
	}
	.panel .row .col{
		display: flex;
		justify-content: center;
	
	}
	.panel .row a{
		width: 100%;
		text-align: center;
		margin: 0.25rem 0;
	     /* background:white; */ /* 해당 페이지 고정될때 표시되는 색*/
	}
	/* 
	  .subInfoChange a{ 
	   color: #FF9268;
		font-weight: bold;
			
		}  */ /*개인정보 스타일*/
		
	.panel .row a:hover{
		color: #FF9268;
		font-weight: bold;
	}
	
	
	/* 태블릿 - 768px 이상 */
	@media screen and (min-width: 768px) {
	.accordion{  padding: 18px;}
	.panel .row.noMobile{display:flex;}
		/* accordion 안에 글씨와 화살표 크기 조절 */
		.accordion span,
		.accordion i,
		div{
			font-size: 1.1rem;
		}
	
	}
	
	@media screen and (min-width: 992px) {
		/* accordion 안에 글씨와 화살표 크기 조절 */
		.accordion span,
		.accordion i,
		div{
			font-size: 1.2rem;
		}
	
	}


 
</style>


<jsp:include page="../../header.jsp" />
	<section class="container">
			<div class="row form">
			<div class="myPageMenu col-md-4 col-lg-3 px-0 mt-2" style="border: 3px solid #FFDEC9;">
			<h3 class="text-center pt-5 pb-5" style="font-weight:bold; color:#212121;">My Page</h3>
				<div class="accordion"><span>구독 정보</span></div>
					<div class="panel orderProductCheck px-1">
						<div class="row py-2">
							<div class="col subInfoChange" >
								<a href="${pageContext.request.contextPath }/member/mypage/memberMyPage/${sessionScope.user.id}">
									구독정보 조회/변경
								</a>
							</div>
							<div class="col orderInfoChange"><a href="">주문/배송 정보</a></div>
							<div class="col otherInfoChange" >
								<a href="${pageContext.request.contextPath }/member/mypage/myPageOther/${sessionScope.user.id}">
									지난 구독정보 조회
								</a>
							</div>
							
						</div>
					</div>
					
				<div class="accordion"><span>개인 정보</span></div>
					<div class="panel orderProductCheck px-1">
						<div class="row py-2">
							<div class="col modifyBtn">
								<a href="${pageContext.request.contextPath }/member/mypage/memberModifyForm/${sessionScope.user.id}">개인정보 수정</a>
							</div>
							<div class="col mPwChangeBtn">
								<a href="${pageContext.request.contextPath }/member/mypage/mPwChangeForm/${sessionScope.user.id}">비밀번호 수정</a>
							</div>
							<div class="col deleteBtn">
								<a href="${pageContext.request.contextPath }/member/mypage/memberDeleteForm/${sessionScope.user.id}">회원 탈퇴</a>
								</div>
						</div>
					</div>
				<div class="accordion active"><span>나의 리뷰</span></div>
				<div class="accordion active"><span>1:1 문의</span></div>
			</div>
			
			<!-- div / section 닫지말기 -->