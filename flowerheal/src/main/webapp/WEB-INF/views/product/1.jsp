<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.submit_checkout {
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	z-index: 7000;
	background: black;
	height: 4rem; 
}
.btn-black{
	width: 100%;
	color:white !important;
	font-size: 1.5rem !important;
}
.btn-black:hover{
 background: black !important;
}
.form-row{
	width: 100%;
}
.form-row input{
	width: 100%;
	margin-bottom: 1rem;
}
</style>



<jsp:include page="../header.jsp" />
<section class="container">
<div class="row">
	<div class="col-md-7">
	  <img src="${pageContext.request.contextPath }/resources/img/product/product1/product1_banner.jpg"
	       width="100%" height="auto" alt="#" />
	</div>
<div class="col-md-5">
	<form action="addToCart" class="row col-9 col-md-11 col-lg-6">
		<div class="form-row">
			<div class="col-12">
				<input type="text" id="datepicker" />
			</div>
			<div class="col-12">

							<select name="region" id="region" class="form-control">
								<option value="0">==지역선택==</option>
								<option value="서울">서울특별시</option>
								<option value="인천">인천광역시</option>
								<option value="대전">대전광역시</option>
								<option value="광주">광주광역시</option>
								<option value="대구">대구광역시</option>
								<option value="울산">울산광역시</option>
								<option value="부산">부산광역시</option>
								<option value="경기">경기도</option>
								<option value="강원">강원도</option>
								<option value="충북">충청북도</option>
								<option value="충남">충청남도</option>
								<option value="전북">전라북도</option>
								<option value="전남">전라남도</option>
								<option value="경북">경상북도</option>
								<option value="경남">경상남도</option>
								<option value="제주">제주도</option>
								<option value="기타">기 타</option>
							</select>

<!-- 						<span class="errMsg" id="errRegion">지역을 선택하세요</span> -->

			</div>
		</div>
	</form>
<!-- 	<form:form modelAttribute="mdto" action="memberJoin"
						 cssClass="row col-9 col-md-11 col-lg-6">
		<h4 class="col justify-content-center">회원가입</h4>
		<div class="form-row">
	
			<div class="col-md-6 col-lg-8 mb-3">
				<form:label path="region">지역</form:label>
				<form:select path="region" class="form-control">
				<form:option value="0">---지역---</form:option>
				<form:option value="1">---지역---</form:option>
				<form:option value="2">---지역---</form:option>
				<form:option value="3">---지역---</form:option>
				</form:select>
				<div class="invalid-feedback"><form:errors path="region" cssClass="errMsg"></form:errors></div>
			</div>
	
		</div> -->
		<!-- 카트에 담기 버튼(하단 고정) -->
		<div class='row submit_row submit_checkout'>
			<button type='button' class='btn btn-black'>카트에 담기</button>
		</div>
		
		
		
<!-- 	</form:form> -->
	
</div>
</div>

<!-- 상품 상세 내용 -->
<div class="row">
	<div class="col-md-12">
		  <img src="${pageContext.request.contextPath }/resources/img/product/blank.png"
		       width="100%" height="150%" alt="#" />
	</div>
</div>

</section>
<jsp:include page="../footer.jsp" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
// Cannot read property 'msie' of undefined 에러 나올때
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
</script>
<script>
$(function() {
    $( "#datepicker" ).datepicker({
    dateFormat: 'yy.mm.dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: false,
    changeYear: false,
    yearSuffix: '년'
    }).datepicker("setDate", new Date());
});
</script>

