<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.subInfoChange a{
	background: lightpink;
}
.outline{
	outline: 1px solid gray;
}
.subsList .row div {
	text-align: center;
}

@media screen and (max-width: 992px) {
	.TabletMode, .PcMode{
		display:none;
	}
}


</style>
<!-- myPage_Common.jsp : 메뉴창, 공통css -->
<jsp:include page="myPage_Common.jsp" />
	<section class="row col-md-8 col-lg-9">
		<div class="col-lg-10 mt-3">
			<div class="row col-lg-8 outline p-2 my-3">
				<div class="col-11">${mdto.name }님, 환영합니다.</div>
			</div>
			<div class="row col-lg-8 outline p-2 my-3">
				<div class="col-4">아이디</div>
				<div class="col-7">${sessionScope.user.id}</div>
			</div>
			
			
			
			<div class="row outline p-2 my-3 subsList">
				<div class="col-12">구독 현황</div>
				<div class="col-12 outline px-0">
					<div class="row">
						<div class="col-3 px-0 TabletMode">상품명</div>
						<div class="col-md-8 px-0">코코낸내 허니잠 세트</div>
					</div>
					<div class="row">
						<div class="col-4 px-0 PcMode">시작일 ~ 종료일</div>
						<div class="col-md-8 px-0">19년 8월 8일 ~ 20년 2월 8일</div>
					</div>
					<div class="row">
						<div class="col-4 px-0">배송예정일</div>
						<div class="col-7 px-0">19년 9월 8일</div>
					</div>
					<div class="row">
						<button type="button" class="btn btn-sm btn-primary mr-2" id="deliveryInfoBtn">배송정보 변경</button>
						<button type="button" class="btn btn-sm btn-primary mx-3" id="subsCancleBtn">구독 취소</button>
					</div>
				</div>
			</div>
			
		</div>
	</section>
	</div>
</section>

<jsp:include page="../../footer.jsp" />