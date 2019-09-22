<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../header.jsp" />

<!-- Form CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">
<style>
 div#gender{
 	height:fit-content;
 }
 div#gender .row{
 	margin: 0 !important;
 }

 #addressForm :nth-child(2),
 #addressForm :nth-child(3){
 	margin-bottom: 0.5rem;
 }
</style>
<section class="container">
	<form:form modelAttribute="mdto" action="memberJoin"
						 cssClass="row col-9 col-md-11 col-lg-8">
		<h3 class="col justify-content-center">회원가입</h3>
		<div class="form-row">
			<div class="col-md-8 col-lg-10 my-3 h5 text-center">필수 입력사항</div>
			<div class="col-md-8 col-lg-10 mb-3">
				<form:label path="id">아이디</form:label>
				<div class="row justify-content-start">
				<form:input type="email" class="form-control col-md-6 col-xl-7" path="id" placeholder="ex)aaa@bbb.com" required = "required"/>
				<input type="button" class="btn btn-outline-secondary col-md-5 col-xl-4" id="hasId" value="이메일 인증">
				</div>
				<div class="invalid-feedback"><form:errors path="id" cssClass="errMsg"></form:errors></div>
			</div>
			<div class="col-md-8 col-lg-10 mb-3">
				<form:label path="pw">비밀번호</form:label>
				<form:password class="form-control" path="pw" placeholder="비밀번호는 6자리이상"/>
				<div class="invalid-feedback"><form:errors path="pw" cssClass="errMsg" required = "required"></form:errors></div>
			</div>
			<div class="col-md-8 col-lg-10 mb-3">
				<label for="pwdChk">비밀번호 확인</label>
				<input type="password" class="form-control" name="pwdChk" id="pwdChk" required = "required"/>
				<div class="invalid-feedback">비밀번호 재확인 에러메세지</div>
			</div>
			<div class="col-md-8 col-lg-10 mb-3">
				<form:label path="name">이름</form:label>
				<form:input type="text" class="form-control onlyHangul" path="name" placeholder="한글만 입력 가능합니다." 
										required = "required"/>
				<div class="invalid-feedback"><form:errors path="name" cssClass="errMsg"></form:errors></div>
			</div>
			<div class="col-md-8 col-lg-10 my-3 h5 text-center">선택 입력사항</div>
			<div class="col-md-8 col-lg-10 mb-3">
				<form:label path="tel">전화번호</form:label>
				<form:input type="tel" class="form-control" path="tel"
					onkeyup="inputTelNumber(this);" placeholder="'-'를 빼고 입력하세요" />
				<div class="invalid-feedback"><form:errors path="tel" cssClass="errMsg"></form:errors></div>
			</div>
			<div class="col-md-8 col-lg-10 mb-3">
				<form:label path="address">주소</form:label>
					<div class="row" id="addressForm">
						<div class="row col-12 p-0 d-flex justify-content-start">
							<input type="text" class="col-5 form-control ml-0 mr-2" placeholder="우편번호" id="zipNo" name="zipNo" readOnly onClick="goPopup();"/>
							<input type="button" class="col-5 form-control" value="주소 검색" onClick="goPopup();"/>
						</div>
						<input type="text" class="col-12 form-control" placeholder="도로명주소" id="roadAddrPart1" name="roadAddrPart1" readOnly/>
						<input type="text" class="col-12 form-control" placeholder="상세주소" id="addrDetail" name="addrDetail" readOnly/>					
					</div>
				<div class="invalid-feedback"><form:errors path="address" cssClass="errMsg"></form:errors></div>
			</div>
		</div>
		<input type="button" class="btn btn-outline-secondary btn-lg col-md-6 mx-auto" id="joinBtn" value="회원 가입">
	</form:form>
</section>



<script src="${pageContext.request.contextPath }/resources/js/memberJoinForm.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/address.js"></script>
<jsp:include page="../footer.jsp" />