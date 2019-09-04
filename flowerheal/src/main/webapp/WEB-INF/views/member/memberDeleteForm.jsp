<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">


<style>
	/* 모바일 : 768px 이하*/
	h4 {
		text-align: center;
	}

/* 	section.container {
		margin: 2rem 0;
	} */

	/* 로그인 폼 : S:ROOM 회원 로그인 */
	form#loginForm {
		display: flex;
		flex-flow: column wrap;
		margin: 1rem auto;
	}

	form div,
	form input {
		font-size: 1.25rem;
	}



	/*소셜 계정으로 로그인*/
	.socialMedia {
		flex-flow: column wrap;
		justify-content: center;
	}

	.socialMedia .row {
		padding: 0 0.7rem;
		margin: 0;
		flex-flow: row;
		justify-content: center;
	}

	.socialMedia ul li {
		margin: 0;
		list-style: none;
	}

	.socialMedia li img.icon_sns_mobile {
		width: 3.7rem;
		padding: 0.5rem 0.3rem;
	}

	.socialMedia h3 {
		font-size: 3em;
	}

	.socialMedia img.icon_sns {
		display: none;
	}

	.socialMedia .row .btn {
		height: 3rem;
		margin: 0.5rem;
	}


	/* 에러메세지 */


	/* 태블릿 - 768px 이상 */
	@media screen and (min-width: 768px) {
		/* 로그인 폼 : S:ROOM 회원 로그인 */


		/*소셜 계정으로 로그인*/
		.socialMedia {
			width: 500px;
			font-size: 1em;

		}

		.socialMedia .row {
			margin: 0.2rem auto;
		}

		.socialMedia h3 {
			margin: 0 auto;
		}


		.socialMedia img.icon_sns_mobile {
			display: none;
		}

		.socialMedia img.icon_sns {
			display: flex;
		}

	}

	/* PC - 992px 이상*/
	@media screen and (min-width: 992px) {
		form {
			width: 754px;
		}

		/* hover 기능 추가  */
/* 		input[type=button]:hover,
		input[type=submit]:hover {
			background-color: olive;
			border: 1px solid grey;
			color: white;
		} */

		/* #saveEmail:hover,
  input[type=button]:hover,
  input[type=submit]:hover{
    cursor: pointer;
  } */
	}
</style>
<jsp:include page="../header.jsp" />
<section class="container">
	<div class="row memberLogin">
		<form id="deleteForm" action="memberDelete" method="POST">
			<h4 class="col">회원 탈퇴</h4>
			<div class="form-row">
				<div class="col-md-6 col-lg-8 mb-3">
					<label for="id">아이디</label>
					<input class="form-control" type="email" name="id" id="id" value="${mdto.id}" readonly>
				</div>
				<div class="col-md-6 col-lg-8 mb-3">
					<label for="pw">비밀번호</label>
					<input type="password" class="form-control" name="pw" id="pw"
					 placeholder="가입 시 입력한 비밀번호"	required>
					<div class="invalid-feedback" id="errPw">비밀번호 에러메세지</div>
				</div>
				<input type="button" class="btn col-md-6 col-lg-8 btn-outline-secondary btn-lg my-2"
				 value="회원탈퇴" id="deleteBtn">
			</div>
		</form>
	</div>
</section>
<script>
	window.addEventListener("load", init, false);
	var chk = new Array();
	function init() {
		$("input").on('focus', function () {
			$(this).removeClass("is-invalid");
		})
		$("#deleteBtn").on('click', deleteBtnF);
	}

	function deleteBtnF() {
		var pw = $("#pw").val();

		if(pw==null || pw==""){
			$("#errPw").text('비밀번호를 입력하세요');
			$("#pw").addClass("is-invalid");
		}else if(pw != '${mdto.pw}'){
			$("#errPw").text('비밀번호가 일치하지 않습니다');
			$("#pw").addClass("is-invalid");
		}else{
			if(confirm('탈퇴하시겠습니까?')){
				$("#deleteForm").submit();
			}
		}
	}

</script>
<jsp:include page="../footer.jsp" />