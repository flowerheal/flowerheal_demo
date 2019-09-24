<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>[꽃미힐미] 이메일 인증번호입력</title>

<script src="${pageContext.request.contextPath }/webjars/jquery/3.4.1/dist/jquery.js"></script>
</head>
<body onload="init();">
	<h1>인증 번호를 입력해주세요.</h1>
	
	<div class="container">
		<form method="post" name="checkForm">
			<input type="text" name="code" id="code"/>
			<input type="button" class="btn btn-info" value="이메일인증" onClick="check();" />
		</form>
	</div>
	
	<script>
		function init(){
			if(${code} == "0"){
				opener.emailCallBack();		// 부모(memberJoinForm.js)에 만들어진 emailCallBack() 함수를 호출해줍니다.
				window.close();
			}
		}
		
		function check(){
			var form = document.checkForm;
			var code = ${code};
			
			console.log(form);
			console.log(code);
			
			if(!form.code.value){
				alert("인증번호를 입력하세요");
				return false;
			} else if(form.code.value != code){
				alert("틀린 인증번호입니다. 인증번호를 다시 입력해주세요.")
				return false;
			} else if(form.code.value == code){
				alert("이메일 인증이 완료되었습니다.");
				form.submit();
			}
			
		}
	</script>
	
</body>
</html>