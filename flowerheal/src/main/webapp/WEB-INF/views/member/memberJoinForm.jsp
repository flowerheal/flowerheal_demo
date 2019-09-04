<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../header.jsp" />

<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">
<style>
 div#gender{
 	height:fit-content;
 }
 div#gender .row{
 	margin: 0 !important;
 }
</style>
<section class="container">
	<form:form modelAttribute="mdto" action="memberJoin"
						 cssClass="row col-9 col-md-11 col-lg-6">
		<h4 class="col justify-content-center">회원가입</h4>
		<div class="form-row">
			<div class="col-md-6 col-lg-8 mb-3">
				<form:label path="id">아이디</form:label>
				<form:input type="email" class="form-control" path="id" placeholder="ex)aaa@bbb.com" required = "required"/>
				<input type="button" class="btn btn-outline-secondary my-2" id="hasId" value="이메일 중복 확인">
				<div class="invalid-feedback"><form:errors path="id" cssClass="errMsg"></form:errors></div>
			</div>
			<div class="col-md-6 col-lg-8 mb-3">
				<form:label path="pw">비밀번호</form:label>
				<form:password class="form-control" path="pw" placeholder="비밀번호는 6자리이상"/>
				<div class="invalid-feedback"><form:errors path="pw" cssClass="errMsg" required = "required"></form:errors></div>
			</div>
			<div class="col-md-6 col-lg-8 mb-3">
				<label for="pwdChk">비밀번호 확인</label>
				<input type="password" class="form-control" name="pwdChk" id="pwdChk" required = "required"/>
				<div class="invalid-feedback">비밀번호 재확인 에러메세지</div>
			</div>
			<div class="col-md-6 col-lg-8 mb-3">
				<form:label path="tel">전화번호</form:label>
				<form:input type="tel" class="form-control" path="tel"
					onkeyup="inputTelNumber(this);" placeholder="'-'를 빼고 입력하세요" required = "required" />
				<div class="invalid-feedback"><form:errors path="tel" cssClass="errMsg"></form:errors></div>
			</div>
			<div class="col-md-6 col-lg-8 mb-3">
				<form:label path="region">지역</form:label>
				<form:select path="region" class="form-control">
				<option value="0">---지역---</option>
				<form:options items="${region}" itemValue="code" itemLabel="label"></form:options>
				</form:select>
				<div class="invalid-feedback"><form:errors path="region" cssClass="errMsg"></form:errors></div>
			</div>
			<div class="col-md-6 col-lg-8 mb-3">
				<fieldset class="form-group mb-0">
					<form:label path="gender" class="form-check-label">성별</form:label>
					<div class="form-control" id="gender">
							<div class="row form-check d-flex justify-content-center my-0">
								<form:radiobuttons path="gender" class="form-check-input" items="${gender}" itemValue="code" itemLabel="label" />
							</div>
						</div>					
				</fieldset>
				<div class="invalid-feedback">성별을 선택하세요</div>
			</div>
			<div class="col-md-6 col-lg-8 mb-3">
				<form:label path="nickname">별명</form:label>
				<form:input type="text" class="form-control" path="nickname" placeholder="별명을 입력하세요.(2자리~10자리)" required = "required"/>
				<div class="invalid-feedback"><form:errors path="nickname" cssClass="errMsg"></form:errors></div>
			</div>
		</div>
		<input type="button" class="btn btn-outline-secondary btn-lg col-md-6 mx-auto" id="joinBtn" value="회원 가입">
	</form:form>
</section>


<script src="${pageContext.request.contextPath }/resources/js/memberJoinForm.js"></script>
<jsp:include page="../footer.jsp" />