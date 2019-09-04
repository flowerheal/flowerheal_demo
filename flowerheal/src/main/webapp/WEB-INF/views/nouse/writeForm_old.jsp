<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Customize CSS -->
<style>
	.form-row,
	.form-group,
	.btn-primary {
		display: flex;
		flex-flow: column wrap;
		align-items: center;
	}

	.btn-primary {
		margin: auto;
	}

	form {
		width: 80%;
		margin: 3rem auto;
		display: flex;
		flex-flow: column;
		font-size: 1.2rem;
	}

	form .col {
		display: flex;
	}

/* 	.form-group .col .form-check {
		width: 50%;
	} */
/* 	.form-group span{
	 margin: 0 3rem !important;
	} */
	
	form .row{
		margin-top: 0.5rem !important;
		margin-bottom: 0.5rem !important;
		justify-content: center;
	}
	
	form .row label{
    margin: auto 0;
	}
	form .row .btn{
	  margin-left: 0.5rem !important;
	  margin-right: 0.5rem !important;
	}
	
	
	@media (min-width: 576px) {
		form .row label{
		  text-align: center;
		}
	}
	
	
</style>
<jsp:include page="../header.jsp" />
<section class="container">
<form:form modelAttribute="bbsDTO">
	<div class="row">
    <label class="col-sm-3" for="fname">제목</label>
    <input class="col-sm-8 col-lg-6" type="text" id="fname" name="firstname" placeholder="Your name..">
	</div>
	<div class="row">
    <label class="col-sm-3" for="lname">작성자</label>
    <input class="col-sm-8 col-lg-6" type="text" id="lname" name="lastname" placeholder="Your last name..">
	</div>
	<div class="row">
    <label class="col-sm-3" for="subject">내용</label>
    <textarea class="col-sm-8 col-lg-6" id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>
	</div>
	<div class="row">
    <input class="btn btn-outline-dark" type="button" value="등록">
    <input class="btn btn-outline-dark" type="button" value="취소">
    <input class="btn btn-outline-dark" type="button" value="목록">
	</div>
</form:form>
<%-- 	<form:form modelAttribute="mdto" action="memberJoin">

		<div class="form-row">
			<div class="col-md-6 mb-3">
				<form:label path="id">아이디</form:label>
				<form:input type="email" class="form-control" path="id" placeholder="ex)aaa@bbb.com" required = "required"/>
				<input type="button" id="hasId" value="이메일 중복 확인">
				<div class="invalid-feedback"><form:errors path="id" cssClass="errMsg"></form:errors></div>
			</div>
			<div class="col-md-6 mb-3">
				<form:label path="pw">비밀번호</form:label>
				<form:password class="form-control" path="pw" placeholder="비밀번호는 6자리이상"/>
				<div class="invalid-feedback"><form:errors path="pw" cssClass="errMsg" required = "required"></form:errors></div>
			</div>
			<div class="col-md-6 mb-3">
				<label for="pwdChk">비밀번호 재확인</label>
				<input type="password" class="form-control" name="pwdChk" id="pwdChk" required = "required"/>
				<div class="invalid-feedback">비밀번호 재확인 에러메세지</div>
			</div>
			<div class="col-md-6 mb-3">
				<form:label path="tel">전화번호</form:label>
				<form:input type="tel" class="form-control" path="tel"
					onkeyup="inputTelNumber(this);" placeholder="'-'를 빼고 입력하세요" required = "required" />
				<div class="invalid-feedback"><form:errors path="tel" cssClass="errMsg"></form:errors></div>
			</div>
			<div class="col-md-6 mb-3">
				<form:label path="region">지역</form:label>
				<form:select path="region" class="form-control">
				<option value="0">---지역---</option>
				<form:options items="${region}" itemValue="code" itemLabel="label"></form:options>
				</form:select>
				<div class="invalid-feedback"><form:errors path="region" cssClass="errMsg"></form:errors></div>
			</div>
			<div class="col-md-6 mb-3">
				<fieldset class="form-group">
					<form:label path="gender" class="form-check-label">성별</form:label>
					<div class="form-control" id="gender">
						
								<form:label class="form-check-label" path="gender">성별</form:label>
							<div class="row form-check d-flex justify-content-center">
								<form:radiobuttons path="gender" class="form-check-input" items="${gender}" itemValue="code" itemLabel="label" />
							</div>
<!-- 							<span class="form-check">
								<input class="form-check-input" type="radio" name="gender" id="woman"
									value="여">
								<label class="form-check-label" for="woman"> 여성 </label>
							</span> -->
						</div>
					
				</fieldset>
				<div class="invalid-feedback">성별을 선택하세요</div>
			</div>
			<div class="col-md-6 mb-3">
				<form:label path="nickname">별명</form:label>
				<form:input type="text" class="form-control" path="nickname" placeholder="별명을 입력하세요.(2자리~10자리)" required = "required"/>
				<div class="invalid-feedback"><form:errors path="nickname" cssClass="errMsg"></form:errors></div>
			</div>
		</div>
		<input type="button" class="btn btn-primary" id="joinBtn" value="회원 가입">
	</form:form> --%>
</section>


<script src="${pageContext.request.contextPath }/resources/js/memberJoinForm.js"></script>
<jsp:include page="../footer.jsp" />