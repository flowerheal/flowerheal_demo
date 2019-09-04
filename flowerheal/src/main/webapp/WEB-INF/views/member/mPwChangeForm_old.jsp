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
		margin: 0 auto;
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
<form:form modelAttribute="pdto" action="mPwChange" >

		<div class="form-row">
			<div class="col-md-6 mb-3">
				<label for="id">아이디</label>
				<input class="form-control" type="email" name="id" id="id" value="${mdto.id}" required readonly>
			</div>
 			<div class="col-md-6 mb-3">
				<form:label path="nowPw">기존 비밀번호</form:label>
				<form:password path="nowPw" placeholder="기존 비밀번호" cssClass="form-control"/>
				<div class="invalid-feedback"><form:errors path="nowPw"></form:errors>기존 비밀번호 에러메세지</div>
			</div>
			<div class="col-md-6 mb-3">
				<label for="newPw">새로운 비밀번호</label>
				<form:password path="newPw" placeholder="기존 비밀번호" cssClass="form-control"/>
				<div class="invalid-feedback"><form:errors path="newPw"></form:errors>새로운 비밀번호 에러메세지</div>
			</div>
			<div class="col-md-6 mb-3">
				<label for="pwdChk">새로운 비밀번호 재확인</label>
				<input type="password" class="form-control" name="pwdChk" id="pwdChk" required>
				<div class="invalid-feedback">동일한 비밀번호가 아닙니다.</div>
			</div>
		</div>
		<button class="btn btn-primary" id="mPwChangeBtn">수정</button>
		<button class="btn btn-primary" id="cancleBtn">취소</button>
</form:form>
</section>


<script>
$(function(){});
/* 	window.addEventListener("load", init, false);
	function init() {
		$("input").on('focus', function () {
			$(this).removeClass("is-invalid");
		});
		$("input").on('blur', check); //입력사항 유효성 검사
		$("#mPwChangeBtn").on('click', mPwChangeBtnF); //수정하기 버튼
	}

	//입력사항 유효성 검사

	function check() {
		let id = this.id;
		var errMsg = this.nextElementSibling;
		switch (id) {

			case "nowPw":
				if (this.value == "" || this.value==null) {
					errMsg.innerText = "기존 비밀번호를 입력하세요"
					$(this).addClass("is-invalid");

				} else if(this.value!="${mdto.pw}"){
					errMsg.innerText = "기존 비밀번호와 일치하지 않습니다"
					$(this).addClass("is-invalid");

				}else {
					$(this).removeClass("is-invalid");
					$(this).addClass("is-valid");

				}
				break;

				case "newPw":
					var pwdReg = /^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z$&+,:;=?@#|'<>.^*()%!-]{6,10}$/;
					if(this.value=="" || !pwdReg.test(this.value)){
						$(this).addClass("is-invalid");

					}else{
						$(this).removeClass("is-invalid");
						$(this).addClass("is-valid");

					}
				break;


			case "pwdChk":
				var pwValue = document.getElementById("newPw").value;
				// var errMsg = this.nextElementSibling;

				if (pwValue == "") {
					errMsg.innerText = "비밀번호를 먼저 입력해주세요."
					$(this).addClass("is-invalid");
					document.getElementById("pw").focus();

				} else if (this.value == "" || pwValue != this.value) {
					errMsg.innerText = "입력한 비밀번호를 다시 입력해주세요."
					$(this).addClass("is-invalid");

				} else {
					$(this).removeClass("is-invalid");
					$(this).addClass("is-valid");

				}
				break;


			default:
				break;
		}
	}


	function mPwChangeBtnF() {
		var invalid = document.getElementsByClassName("is-invalid");
		if(invalid.length>0){
			alert('회원 정보수정 입력값이 부족합니다.');
			return;
		}else{
			alert('회원 정보수정이 정상적으로 처리되었습니다.');
			document.getElementById('mPwChangeForm').submit();
		}

}
 */



		// var okCnt = 0;

		// var tel = document.getElementById("tel").value;
		// var regionTag = document.getElementById("region");
		// var regionValue = regionTag.options[regionTag.selectedIndex].value;
		// var gender = $('input[name="gender"]:checked').val();
		// var nickname = document.getElementById("nickname").value;

		// console.log(tel)
		// //3) 전화번호 체크
		// var phoneReg = /(\d{3}).*(\d{3}).*(\d{4})/;
		// if (phoneReg.test(tel)) {
		// 	okCnt++;
		// }
		// //4) 지역 체크
		// if (regionValue != null && regionValue != "" && regionValue != 0) {
		// 	okCnt++;
		// }
		// //5) 성별 체크
		// if (!(gender == "" || gender == null)) {
		// 	okCnt++;
		// }
		// //6) 별칭 체크
		// if (!(nickname == "" || nickname == null)) {
		// 	okCnt++;
		// }
		// if (okCnt == 4) {
		// 	alert('회원 정보수정이 정상적으로 처리되었습니다.');
		// 	document.getElementById('mPwChangeForm').submit();
		// } else {
		// 	alert('회원 정보수정 입력값이 부족합니다.');
		// }
	//}


</script>
<jsp:include page="../footer.jsp" />