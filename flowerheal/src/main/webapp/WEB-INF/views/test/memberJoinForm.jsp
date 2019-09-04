<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
		<form:form modelAttribute="memberDTO" action="${pageContext.request.contextPath}/test/memberJoin">
		
		아이디 : <form:input type="text" path="id"/><form:errors path="id" cssClass="errMsg"></form:errors><br/>
		별칭 : <form:input type="text" path="nickname"/><form:errors path="nickname" cssClass="errMsg"></form:errors><br/>
		나이 : <form:input type="text" path="age"/><form:errors path="age" cssClass="errMsg"></form:errors><br/>

		<form:select path="region">
			<option value="">---지역---</option>
			<form:options items="${region}" itemValue="code" itemLabel="label"></form:options>
		</form:select>
		<button type="button" id="joinBtn">가입하기</button>

	</form:form>

	<script>
		window.addEventListener("load",init,false);
		function init(){
			let joinBtn = document.getElementById("joinBtn");
			joinBtn.addEventListener("click",joinBtnF,false);
		}
		function joinBtnF(){
			document.getElementById("memberDTO").submit();
		}
	</script>
</body>
</html>