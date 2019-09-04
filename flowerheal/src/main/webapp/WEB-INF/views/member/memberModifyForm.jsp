<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/form.css" rel="stylesheet">

<jsp:include page="../header.jsp" />
	<section class="container">
		<form id="modifyForm" action="memberModify" method="POST">
			<div class="form-row">
				<div class="col-md-6 mb-3">
					<label for="id">아이디</label>
						<input class="form-control" type="email"	 name="id" id="id"
						value="${mdto.id}" required readonly>
				</div>
				<div class="col-md-6 mb-3">
					<label for="tel">전화번호</label> <input type="tel"
						class="form-control" name="tel" id="tel"
						value="${mdto.tel}" required>
					<div class="invalid-feedback">전화번호가 잘못 입력되었습니다.</div>
				</div>
				<div class="col-md-6 mb-3">
					<label for="region">지역</label> <select name="region" id="region"
						class="form-control">
						<option value="0">==지역선택==</option>
						<option value="서울" <c:if test="${mdto.region eq '서울'}">selected</c:if>>서 울</option>
						<option value="경기" <c:if test="${mdto.region eq '경기'}">selected</c:if>>경 기</option>
						<option value="대구" <c:if test="${mdto.region eq '대구'}">selected</c:if>>대 구</option>
						<option value="울산" <c:if test="${mdto.region eq '울산'}">selected</c:if>>울 산</option>
						<option value="기타" <c:if test="${mdto.region eq '기타'}">selected</c:if>>기 타</option>
					</select>
					<div class="invalid-feedback">지역을 선택하세요</div>
				</div>
				<div class="col-md-6 mb-3">
					<fieldset class="form-group">
						<label for="gender">성별</label>
						<div class="form-control">
							<div class="col">
								<span class="form-check">
									<input class="form-check-input" type="radio" name="gender" id="man"
									 value="남" required <c:if test="${mdto.gender eq '남'}">checked</c:if>>
									<label class="form-check-label" for="man"> 남성 </label>
								</span>
								<span class="form-check">
									<input class="form-check-input" type="radio" name="gender" id="woman"
									 value="여" required <c:if test="${mdto.gender eq '여'}">checked</c:if>>
									<label class="form-check-label" for="woman"> 여성 </label>
								</span>
							</div>
						</div>
					</fieldset>
					<div class="invalid-feedback">성별을 선택하세요</div>
				</div>
				<div class="col-md-6 mb-3">
					<label for="nickname">별명</label> <input type="text"
						class="form-control" name="nickname" id="nickname"
						value="${mdto.nickname}" required>
					<div class="invalid-feedback">별명을 입력하세요.</div>
				</div>
			</div>
			<button class="btn btn-primary" id="modifyInfoBtn">수정하기</button>
		</form>
	</section>


	<script>
		window.addEventListener("load",init,false);
		function init(){
			$("input").on('focus',function(){
				$(this).removeClass("is-invalid");
			})
			// $("input").on('blur',check); //지역, 성별 제외한 모든 입력사항 유효성 검사
			// $("select").on('blur',check);	//지역 유효성 검사
			$("#modifyInfoBtn").on('click',modifyInfoBtnF); //수정하기 버튼
		}
		
		// function check(){
		// 	let id = this.id;
		// 	switch(id){

		// 		case "tel":
		// 		var phoneReg = /(\d{3}).*(\d{3}).*(\d{4})/;

		// 			if(this.value=="" || !phoneReg.test(this.value)){
		// 				$(this).addClass("is-invalid");
						
		// 			}else{
		// 				$(this).removeClass("is-invalid");
		// 				$(this).addClass("is-valid");

		// 			}
		// 		break;
				
		// 		case "region":
		// 		case "nickname":
		// 			if(this.value==""||this.value==0){
		// 				$(this).addClass("is-invalid");
						
		// 			}else{
		// 				$(this).removeClass("is-invalid");
		// 				$(this).addClass("is-valid");

		// 			}
		// 		break;

		// 		default:
		// 		break;
		// 	}
		// }


    function modifyInfoBtnF() {
    	
      var okCnt = 0;

      var tel = document.getElementById("tel").value;
      var regionTag = document.getElementById("region");
			var regionValue = regionTag.options[regionTag.selectedIndex].value;			 
			var gender = $('input[name="gender"]:checked').val();			
      var nickname = document.getElementById("nickname").value;

			console.log(tel)
      //3) 전화번호 체크
      var phoneReg = /(\d{3}).*(\d{3}).*(\d{4})/;
      if (phoneReg.test(tel)) {
        okCnt++;
      }
      //4) 지역 체크
      if (regionValue != null && regionValue != "" && regionValue !=0) {
        okCnt++;
      }
      //5) 성별 체크
      if (!(gender == "" || gender == null)) {
        okCnt++;
      }
      //6) 별칭 체크
       if (!(nickname == "" || nickname == null)) {
    	  okCnt++;
      } 
      if (okCnt == 4) {
        alert('회원 정보수정이 정상적으로 처리되었습니다.');
        document.getElementById('modifyForm').submit();
      }else{
    	  alert('회원 정보수정 입력값이 부족합니다.');
      }
    }


	</script>
<jsp:include page="../footer.jsp" />