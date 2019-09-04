<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">

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
				<label for="pwdChk">새로운 비밀번호 확인</label>
				<input type="password" class="form-control" name="pwdChk" id="pwdChk">
				<div class="invalid-feedback">동일한 비밀번호가 아닙니다.</div>
			</div>
		</div>
		<input type="button" class="btn btn-primary" id="mPwChangeBtn" value="수정">
		<input type="button" class="btn btn-primary" id="cancleBtn" value="취소">
		<!-- <form:button class="btn btn-primary" id="cancleBtn">취소</form:button> -->
		
</form:form>
</section>


<jsp:include page="../footer.jsp" />
<!-- <script>
	var checkArray = new Array();
	function errorLogic(errMsg,errMsgText,input,i){
	errMsg.innerText = errMsgText;
	$(input).addClass("is-invalid");
	checkArray[i]=false;
}
function okLogic(input,i){
	$(input).removeClass("is-invalid").addClass("is-valid");
	checkArray[i] = true;
}

$(function(){
	$("#mPwChangeBtn").on("click",function(e){
		e.preventDefault(); //해당요소의 기본 이벤트 막기
		var errMsg = null;
		var nowPw = $("#nowPw"); 		//현재 비밀번호
		var newPw = $("#newPw"); 		//새로운 비밀번호
		var pwdChk = $("#pwdChk");  //새로운 비밀번호 확인
		//비밀번호 정규표현식
		var pwdReg = /^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z$&+,:;=?@#|'<>.^*()%!-]{6,10}$/;

		var realNowPw = "${mdto.pw}"; //DB에 저장되어있는 이 계정의 실제 현재 비밀번호


		//현재 비밀번호
		if(nowPw.val().length==0){ //입력란이 비어있을 때
			errMsg = nowPw.next()[0];
			errorLogic(errMsg,"기존 비밀번호를 입력하세요","#nowPw",0);
		}else if(!pwdReg.test(nowPw.val())){
			errorLogic(errMsg,"기존 비밀번호를 입력하세요","#nowPw",0);
		}
	});
});

</script> -->
<script>
	window.addEventListener("load", init, false);
function init() {
	$("input").on('blur', check); 	//모든 입력사항 유효성 검사
	$("input").on('change', check); 	//모든 입력사항 유효성 검사
	$("#mPwChangeBtn").on('click', mPwChangeBtnF); //비밀번호 수정 버튼

}


function errorLogic(errMsg,errMsgText,input,i){
	errMsg.innerText = errMsgText;
	$(input).addClass("is-invalid");
	checkArray[i]=false;
}
function okLogic(input,i){
	$(input).removeClass("is-invalid").addClass("is-valid");
	checkArray[i] = true;
}


var checkArray = new Array();
function check() {
	let id = this.id;
	var errMsg = this.nextElementSibling;
	switch (id) {

		//2) 비밀번호 체크
		case "nowPw":
			var pwdReg = /^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z$&+,:;=?@#|'<>.^*()%!-]{6,10}$/;
			if (this.value == "" ||this.value==null){
				errorLogic(errMsg,"비밀번호를 입력하세요.",this,1);
			} else if(!pwdReg.test(this.value)) {
				errorLogic(errMsg,"조건에 맞지 않는 비밀번호입니다.",this,1);
			} else {
				okLogic(this,1);
			}
			break;

		//3) 비밀번호 재확인 체크 
		case "pwdChk":
			var pwValue = document.getElementById("pw").value;
			//var errMsg = this.nextElementSibling;

			if (pwValue == "") {
				errorLogic(errMsg,"비밀번호를 먼저 입력해주세요.",this,2);
				document.getElementById("pw").focus();

			} else if (this.value == "" || pwValue != this.value) {
				errorLogic(errMsg,"입력한 비밀번호를 다시 입력해주세요.",this,2);

			} else {
				okLogic(this,2);

			}
			break;

		default:
			break;
	}
}



// 클릭했을 때 최종 db 전송 유효성검사
function isBoolean(currentValue) {
	return currentValue;
}
function joinBtnF() {
	if (!checkArray.every(isBoolean)) {
		alert('입력값이 부족합니다');
	} else {
		$("#mdto").submit();
	}
}


</script>