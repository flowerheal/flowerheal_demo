<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
 .orderProductCheck .mPwChangeBtn a{
	background: #FFD3B0;
	font-weight: bold;
} 


	 .modify{
		 /* width: 75%;  */
		height: 3rem;
		margin: 0.5rem 0;
		
		font-size: 1.3rem !important;
	    border:1px solid #FFBE9E !important;
	   /*  border-radius: 2em;  outline 으로 해서 안되는거 같음*/ 
	   /*  background-color: #FFA59C;  안먹음*/
		}
	
	 .modify:hover{ 
	
	 background-color: #FFBE9E;
	 color:white !important;  /*글색깔*/
	}  
 




</style>

<!-- myPage_Common.jsp : 메뉴창, 공통css -->
<jsp:include page="myPage_Common.jsp" />
		
		<form:form modelAttribute="pdto" action="mPwChange" 
							cssClass="row col-md-8 col-lg-9">
			<div class="form-row">
				<div class="col-md-10 col-lg-9 my-3 h3 text-center">비밀번호 수정</div>
				<div class="col-md-10 col-lg-9 mb-3">
					<form:label path="id">아이디</form:label>
					<form:input type="email"
											class="form-control"
											path="id"
											value="${mdto.id}" readOnly="readOnly"/>
					<div class="invalid-feedback"><form:errors path="id" cssClass="errMsg"></form:errors></div>
				</div>
				<div class="col-md-10 col-lg-9 mb-3">
					<form:label path="nowPw">기존 비밀번호</form:label>
					<form:input type="password"
											class="form-control"
											path="nowPw"/>
					<div class="invalid-feedback"><form:errors path="nowPw" cssClass="errMsg"></form:errors></div>
				</div>
			<div class="col-md-10 col-lg-9 mb-3">
				<form:label path="newPw">새 비밀번호</form:label>
				<form:input type="password"
											class="form-control"
											path="newPw"/>
					<div class="invalid-feedback"><form:errors path="newPw" cssClass="errMsg"></form:errors></div>
				</div>
		</div>
		<div class="row btnDiv">
				<input type="button" class="btn modify" id="mPwChangeBtn" value="수정">
				<input type="button" class="btn modify" id="cancleBtn" value="취소">
		</div>
		</form:form>
	</div>
</section>

<jsp:include page="../../footer.jsp" />

<script>
	var mypageURL = "${pageContext.request.contextPath }/member/mypage/memberMyPage/"+`${sessionScope.user.id}`;
	$(function(){
	
	$("#cancleBtn").on("click",function(){ // 취소 : 마이페이지로 돌아가기
		$(location).attr('href', mypageURL);
	});
	$("input").on('blur', check); 	//모든 입력사항 유효성 검사
	$("#mPwChangeBtn").on('click', mPwChangeBtnF); //비밀번호 수정 버튼

});


function errorLogic(errMsg,errMsgText,input,i){
	errMsg.innerText = errMsgText;
	$(input).addClass("is-invalid");
	checkArray[i]=false;
}
function okLogic(input,i){
	$(input).removeClass("is-invalid").addClass("is-valid");
	checkArray[i] = true;
}


var checkArray = [false,false];
function check() {
	let id = this.id;
	var errMsg = this.nextElementSibling;
	switch (id) {

		//1) 현재 비밀번호 체크
		case "nowPw":
			var pwdReg = /^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z$&+,:;=?@#|'<>.^*()%!-]{6,10}$/;
			if (this.value == "" ||this.value==null){
				errorLogic(errMsg,"비밀번호를 입력하세요.",this,0);
			} else if(!pwdReg.test(this.value)) {
				errorLogic(errMsg,"조건에 맞지 않는 비밀번호입니다.",this,0);
			} else {
				okLogic(this,0);
			}
			break;

		//2) 비밀번호 재확인 체크 
		case "newPw":
			var pwdReg = /^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z$&+,:;=?@#|'<>.^*()%!-]{6,10}$/;
			if (this.value == "" ||this.value==null){
				errorLogic(errMsg,"비밀번호를 입력하세요.",this,1);
			} else if(!pwdReg.test(this.value)) {
				errorLogic(errMsg,"조건에 맞지 않는 비밀번호입니다.",this,1);
			} else {
				okLogic(this,1);
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
function mPwChangeBtnF() {
	var $id = `${sessionScope.user.id}`;
	var $nowPw = $("#nowPw").val();
	var $newPw = $("#newPw").val();
	var allData = { "id": $id, "nowPw":$nowPw, "newPw":$newPw };
	
	if (!checkArray.every(isBoolean)) {
		alert('입력값이 부족합니다');
	} else {
		

		
		$.ajax({
			type : "POST",    	 
			url  : "mPwChange",
			data : allData,
			//응답 성공시 
			success:function(str){		
				
				if(str=="OK"){
					$(location).attr('href', mypageURL);
				} else if (str=="WRONGPW"){
					alert("비밀번호가 일치하지 않습니다.");
					$("#nowPw").val("");
					$("#newPw").val("");
					$("#nowPw, #newPw").removeClass("is-valid");
					checkArray = [false,false];
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