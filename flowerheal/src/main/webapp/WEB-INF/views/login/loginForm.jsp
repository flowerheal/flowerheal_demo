<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">


<style>


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

.socialMedia ul li:nth-child(2) {
	display: none;
}

.socialMedia li img.icon_sns_mobile {
	width: 3.7rem;
	padding: 0.5rem 0.3rem;
}

.socialMedia h3 {
	font-size: 3em;
}

.socialMedia .row .btn {
	height: 3rem;
	font-size: 0.9rem;
	margin: 0.5rem;
	padding: 0.2rem;
}



/* 태블릿 - 768px 이상 */
@media screen and (min-width: 768px) {

	/*소셜 계정으로 로그인*/
	.socialMedia {
		width: 500px !important;
		font-size: 1em;
	}
	.socialMedia .row {
		margin: 0.2rem auto;
	}
	.socialMedia h3 {
		margin: 0 auto;
	}
	.socialMedia ul li:nth-child(1) {
		display: none;
	}
	.socialMedia ul li:nth-child(2) {
		display: flex;
		flex-flow: row wrap;
		justify-content: center;
	}
	.socialMedia li img.icon_sns {
		width: 40%;
		padding: 0.3rem;
	}
	.socialMedia .row .btn {
		font-size: 1.1rem;
		width: 10rem;
	}
}

@media screen and (min-width: 992px) {
	form {
		width: 754px;
	}

}
</style>
<jsp:include page="../header.jsp" />
<section class="container">
	<form class="row col-11 col-md-11 col-lg-6 memberLogin"
				id="loginForm" action="memberLogin"
				method="POST">
		<h4 class="col justify-content-center">회원 로그인</h4>
		<div class="form-row">
			<div class="col-md-6 col-lg-8 mb-3">
				<label for="id">아이디</label>
				<input class="form-control" type="email"
							 name="id" id="id" placeholder="가입시 입력한 이메일 주소" required>
				<div class="invalid-feedback">올바른 이메일 형식이 아닙니다.</div>
			</div>
			<div class="col-md-6 col-lg-8 mb-3">
				<label for="pw">비밀번호</label>
				<input class="form-control" type="password"
							 name="pw" id="pw" placeholder="비밀번호" required>
				<div class="invalid-feedback">올바른 비밀번호 형식이 아닙니다.</div>
			</div>
			<input type="button"
						 class="btn col-md-6 col-lg-8 btn-outline-secondary btn-lg my-2"
						 value="로그인" id="loginBtn" >
		</div>
	</form>
	<div class="form row socialMedia">
		<h4 class="col">소셜 계정으로 로그인</h4>
		<ul class="row">
			<li>
				<img class="icon_sns_mobile col-6"
						 src="${pageContext.request.contextPath }/resources/img/icons/ico_naver_mobile.png"
						 alt="naverMobile">
				<img class="icon_sns_mobile col-6"
						 src="${pageContext.request.contextPath }/resources/img/icons/ico_kakao_mobile.png"
						 alt="kakaoMobile">
				<img class="icon_sns_mobile col-6"
						 src="${pageContext.request.contextPath }/resources/img/icons/ico_facebook_mobile.png"
						 alt="facebookMobile">
				<img class="icon_sns_mobile col-6"
						 src="${pageContext.request.contextPath }/resources/img/icons/ico_google_mobile.png"
						 alt="googleMobile">
			</li>
			<li>
				<img class="icon_sns"
						 src="${pageContext.request.contextPath }/resources/img/icons/ico_naver.png"
						 alt="naver">
			  <img class="icon_sns"
						 src="${pageContext.request.contextPath }/resources/img/icons/ico_kakao.png"
						 alt="kakao">
				<img class="icon_sns"
						 src="${pageContext.request.contextPath }/resources/img/icons/ico_facebook.png"
						 alt="facebook">
				<img class="icon_sns"
						 src="${pageContext.request.contextPath }/resources/img/icons/ico_google.png"
						 alt="google">
			</li>
		</ul>
		<div class="row">
			<button class="btn mJoinBtn col-4 btn-outline-secondary btn-lg">회원가입</button>
			<button class="btn col-5 btn-outline-secondary btn-lg">비밀번호 찾기</button>
		</div>
	</div>
</section>
<script>
	window.addEventListener("load", init, false);
	var chk = new Array();
	function init() {

		$("input#id").keyup(function(){
			checkId();
			return;
		});
		$("input#pw").keyup(function(){
			checkPw();
			return;
		});

		$("#loginBtn").on('click', loginBtnF);
		$(".mJoinBtn").on('click',function(){
				document.location.href="${pageContext.request.contextPath }/member/memberJoinForm";
			});
		
	}
	
	// 엔터키가 누르면 로그인 유효성검사 및 로그인
	$('body').keypress(function(event){
	     if ( event.which == 13 ) {
	    	 	$("#loginBtn").click();
	    	 	return false;
	     }
	});


	function checkId() {
		let id = this.id;
 		var emailReg = /^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/;
		var errMsg = id.nextElementSibling;

		if (id.value == "" || id.value == null) {
			errMsg.innerText = "아이디를 입력하세요."
			$("#id").addClass("is-invalid");
			chk[0] = false;
		} else if (id.value != "" && !emailReg.test(id.value)) {
			errMsg.innerText = "아이디 형식이 바르지 않습니다."
			$("#id").addClass("is-invalid");
			chk[0] = false;
		} else {
			$("#id").removeClass("is-invalid");
			$("#id").addClass("is-valid");
			chk[0] = true;
		}
	}
	function checkPw() {
		let pw = this.pw;	
		var pwdReg = /^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z$&+,:;=?@#|'<>.^*()%!-]{6,10}$/;
		if (pw.value == "" || !pwdReg.test(pw.value)) {
			$("#pw").addClass("is-invalid");
			chk[1] = false;
		} else {
			$("#pw").removeClass("is-invalid");
			$("#pw").addClass("is-valid");
			chk[1] = true;
		}

	}

	function loginBtnF() {
		var cnt = 0;
		for (var i = 0; i < 2; i++) {
			if (chk[i] == false || chk[i] == null) {
				alert("로그인 정보를 다시 확인해주십시오");
				cnt = 0;
				return;
			} else {
				cnt++;
			}
		}

		var $id = $('input#id').val();
		var $pw = $('input#pw').val();
		var allData = { "id": $id, "pw":$pw };
		if (cnt == 2) {
			$.ajax({
				type : "POST",    	 
				url  : "memberLogin",
				data : allData,
				//응답 성공시 
				success:function(str){		
					
					if(str=="OK"){
						var back_url = "${sessionScope.referer}";
						var join_url = "http://localhost:9080/flowerheal/member/memberJoin";
						var login_url = "http://localhost:9080/flowerheal/login/loginForm";
						var order_url = "http://localhost:9080/flowerheal/product/orderPage";
						var order_url2 = "http://localhost:9080/flowerheal/product/order";
						console.log(back_url);
						console.log(join_url);
						if(back_url==null || back_url==join_url 	|| back_url==order_url2 	||
							 back_url==login_url	||  back_url==order_url){
							$(location).attr('href', "${pageContext.request.contextPath }");
						}else{
							$(location).attr('href', back_url);
						}
					} else if (str=="NO"){
						alert("회원정보가 일치하지 않습니다.");
						$('input#id').val("").focus();
						$('input#pw').val("");
						$("input#id, input#pw").removeClass("is-valid");
						chk = [false,false];
					} 
				},
				//응답 실패시 
				error:function(xhr, status, err){			
					console.log("code:"+xhr.status);
					console.log("message:"+xhr.responseText );
					console.log("status:"+status);
					console.log("err:"+err);
				}			
			});
		}
	}
</script>
<jsp:include page="../footer.jsp" />