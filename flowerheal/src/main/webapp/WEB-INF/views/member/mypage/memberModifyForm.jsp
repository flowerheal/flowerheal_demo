<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<style>


 .orderProductCheck .modifyBtn a{
	background: #FFD3B0;
	font-weight: bold;
  }  


	
	.modify{
	 width: 75%; 
	height: 4rem;
	margin: 0.5rem 0;
	
	font-size: 1.5rem !important;
    border:1px solid #FFBE9E !important;
   /*  border-radius: 2em;  outline 으로 해서 안되는거 같음*/ 
   /*  background-color: #FFA59C;  안먹음*/
	}
	
	/* .modify:hover{ 
	
	 background-color: #FFBE9E;
	 color:white !important;  /*글색깔*/
	}  */


</style>

<!-- myPage_Common.jsp : 메뉴창, 공통css -->
<jsp:include page="myPage_Common.jsp" />
		
		<form:form modelAttribute="mdto" action="memberModify" id="modifyForm"
							cssClass="row col-md-8 col-lg-9">
			<div class="form-row bl-5">
				<input type="hidden"	name="id" id="id" value="${mdto.id}" />
				<div class="col-md-10 col-lg-9 my-3 h3 text-center">개인정보 수정</div>
				<div class="col-md-10 col-lg-9 my-3 h5 text-center">필수 입력사항</div>
				<div class="col-md-10 col-lg-9 mb-3">
					<form:label path="name">이름</form:label>
					<form:input type="text"
											class="form-control onlyHangul"
											path="name"
											value="${mdto.name}" required="required"/>
					<div class="invalid-feedback"><form:errors path="name" cssClass="errMsg"></form:errors></div>
				</div>
				<div class="col-md-10 col-lg-9 my-3 h5 text-center">선택 입력사항</div>
				<div class="col-md-10 col-lg-9 mb-3">
					<form:label path="tel">전화번호</form:label>
					<form:input type="tel"
											class="form-control"
											path="tel"
											value="${mdto.tel }"
											onkeyup="inputTelNumber(this);"/>
					<div class="invalid-feedback"><form:errors path="tel" cssClass="errMsg"></form:errors></div>
				</div>
			<div class="col-md-10 col-lg-9 mb-3">
				<form:label path="address">주소</form:label>
					<div class="row" id="addressForm">
						<div class="row col-12 p-0 d-flex justify-content-start">
							<input type="text" class="col-5 form-control ml-0 mr-2" value="${mdto.zipNo}" id="zipNo" name="zipNo" readOnly onClick="goPopup();"/>
							<input type="button" class="col-5 form-control" style="color: #fff; background-color: #FFBE9E;" value="주소 검색" onClick="goPopup();"/>
						</div>
						<input type="text" class="col-12 form-control mb-1" value="${mdto.roadAddrPart1}" id="roadAddrPart1" name="roadAddrPart1" readOnly/>
						<input type="text" class="col-12 form-control" value="${mdto.addrDetail}" id="addrDetail" name="addrDetail"/>					
					</div>
				<div class="invalid-feedback"><form:errors path="address" cssClass="errMsg"></form:errors></div>
			</div>
		</div>
		
		
			<button type="button" class="btn modify" style="color: #fff;  background-color: #FFBE9E;" id="modifyInfoBtn">수정하기</button>
			
			
		</form:form>
	</div>
</section>
<jsp:include page="../../footer.jsp" />
<script src="${pageContext.request.contextPath }/resources/js/address.js"></script>


	<script>
		window.addEventListener("load",init,false);
		function init(){
/* 			$("input").on('focus',function(){
				$(this).removeClass("is-invalid");
			}); */
			$("input").on('load', check); // input 사항 유효성 검사
			$("input").on('blur', check); // input 사항 유효성 검사
			$("#modifyInfoBtn").on('click',modifyInfoBtnF); //수정하기 버튼
		}


		function inputTelNumber(obj) {

			var number = obj.value.replace(/[^0-9]/g, "");
			var tel = "";

			// 서울이라는 변수를 선언
			var seoul = 0;

			// 서울 지역번호(02)가 들어가는 경우 1을 삽입
			if (number.substring(0, 2).indexOf('02') == 0) {
				seoul = 1;
			}

			// 문자열을 자르는 기준에서 서울의 값을 뺄쌤(-)한다.
			// 값이 1일경우 -1이 될것이고, 값이 0일경우 변화가 없다.
			if (number.length < (4 - seoul)) {
				return number;
			} else if (number.length < (7 - seoul)) {
				tel = number.substr(0, (3 - seoul))
					+ "-" + number.substr(3 - seoul);

			} else if (number.length < (11 - seoul)) {
				tel = number.substr(0, (3 - seoul))
					+ "-" + number.substr((3 - seoul), 3)
					+ "-" + number.substr(6 - seoul);

			} else {
				tel = number.substr(0, (3 - seoul))
					+ "-" + number.substr((3 - seoul), 4)
					+ "-" + number.substr((7 - seoul), 4);
			}
			obj.value = tel;
		}





		function onlyHangul(sth) {
			var status = false;
			// 한 글자씩 화면에 출력
			for (var i = 0; i < sth.length; i++) {
				var letter = sth.charAt(i).charCodeAt(0);
				if (0x1100 <= letter && letter <= 0x11FF) status = true;
				if (0x3130 <= letter && letter <= 0x318F) status = true;
				if (0xAC00 <= letter && letter <= 0xD7A3) status = true;
				else status = false;
			}
			return status;
		}


		function errorLogic(errMsg,errMsgText,input,i){
			errMsg.innerText = errMsgText;
			$(input).addClass("is-invalid");
			errMsg.style="display:block";
			checkArray[i]=false;
		}
		function okLogic(errMsg,input,i){
			$(input).removeClass("is-invalid").addClass("is-valid");
			errMsg.style="display:none";
			checkArray[i] = true;
		}


		
		var checkArray = [true,true];
		function check() {
			let id = this.id;
			var errMsg = this.nextElementSibling;
			switch (id) {
		//==== 필수 입력사항 ====

				//1) 이름체크	
				case "name":
					var input = $('#name').val().replace(/ /gi, '');	//공백 입력 방지
					$('#name').val(input);
					nameVal = this.value;
					if (this.value == "" || this.value == null) {
						errorLogic(errMsg,"이름을 입력하세요",this,0);
					}else if(!onlyHangul(nameVal)){
						errorLogic(errMsg,"한글만 입력 가능합니다.",this,0)
					}else if(onlyHangul(nameVal)){
						okLogic(errMsg,this,0);
					}
					break;


		//==== 선택 입력사항 ====
				//2) 전화번호 체크
				case "tel":
					var phoneReg = /(\d{3}).*(\d{3}).*(\d{4})/;
					var tel = this.value;
					var telNumOnly = "";
					for (var i = 0; i < tel.length; i++) {
						if (0 <= tel.charAt(i) && tel.charAt(i) <= 9) {
							telNumOnly += tel.charAt(i);
						}
					}

					if (telNumOnly == "" || telNumOnly == null) {
						checkArray[1] = true;
					} else if (!phoneReg.test(telNumOnly)) {
						errorLogic(errMsg,"올바른 전화번호 형식이 아닙니다.",this,1);
					} else {
						okLogic(errMsg,this,1);
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
		function modifyInfoBtnF() {
			if (!checkArray.every(isBoolean)) {
				console.log(checkArray);
				alert('입력사항을 다시 확인해주세요.');
				return;
			} else {
				document.getElementById('modifyForm').submit();
			}
		}



	</script>