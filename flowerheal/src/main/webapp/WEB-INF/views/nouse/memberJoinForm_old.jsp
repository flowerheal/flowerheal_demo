<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin: 0 auto;
		display: flex;
		flex-flow: column;
		font-size: 1.2rem;
	}

	.form-group .col {
		display: flex;
	}

	.form-group .col .form-check {
		width: 50%;
	}
</style>
<jsp:include page="../header.jsp" />
<section class="container">
	<form id="joinForm" action="memberJoin" method="POST">
		<div class="form-row">
			<div class="col-md-6 mb-3">
				<label for="id">아이디</label>
				<input class="form-control" type="email" name="id" id="id" placeholder="ex)aaa@bbb.com"
				 required>
				<input type="button" id="hasId" value="이메일 중복 확인">
				<div class="invalid-feedback">이메일 에러메세지</div>
			</div>
			<div class="col-md-6 mb-3">
				<label for="pw">비밀번호</label>
				<input type="password" class="form-control" name="pw" id="pw"
					placeholder="비밀번호는 6자리이상" required>
				<div class="invalid-feedback">비밀번호 에러메세지</div>
			</div>
			<div class="col-md-6 mb-3">
				<label for="pwdChk">비밀번호 재확인</label>
				<input type="password" class="form-control" name="pwdChk" id="pwdChk"
					required>
				<div class="invalid-feedback">비밀번호 재확인 에러메세지</div>
			</div>
			<div class="col-md-6 mb-3">
				<label for="tel">전화번호</label> <input type="tel" class="form-control" name="tel" id="tel"
					onkeyup="inputTelNumber(this);" placeholder="'-'를 빼고 입력하세요" required>
				<div class="invalid-feedback">전화번호가 잘못 입력되었습니다.</div>
			</div>
			<div class="col-md-6 mb-3">
				<label for="region">지역</label>
				<select name="region" id="region" class="form-control">
					<option value="0">==지역선택==</option>
					<option value="서울">서 울</option>
					<option value="경기">경 기</option>
					<option value="대구">대 구</option>
					<option value="울산">울 산</option>
					<option value="기타">기 타</option>
				</select>
				<div class="invalid-feedback">지역을 선택하세요</div>
			</div>
			<div class="col-md-6 mb-3">
				<fieldset class="form-group">
					<label for="gender">성별</label>
					<div class="form-control" id="gender">
						<div class="col">
							<span class="form-check">
								<input class="form-check-input" type="radio" name="gender" id="man"
									value="남" required>
								<label class="form-check-label" for="man"> 남성 </label>
							</span>
							<span class="form-check">
								<input class="form-check-input" type="radio" name="gender" id="woman"
									value="여" required>
								<label class="form-check-label" for="woman"> 여성 </label>
							</span>
						</div>
					</div>
				</fieldset>
				<div class="invalid-feedback">성별을 선택하세요</div>
			</div>
			<div class="col-md-6 mb-3">
				<label for="nickname">별명</label> <input type="text" class="form-control" name="nickname" id="nickname"
					placeholder="별명을 입력하세요." required>
				<div class="invalid-feedback">별명을 입력하세요.</div>
			</div>
		</div>
		<input type="button" class="btn btn-primary" id="joinBtn" value="회원 가입">
	</form>
</section>


<script src="${pageContext.request.contextPath }/resources/js/memberJoinForm.js"></script>
<jsp:include page="../footer.jsp" />