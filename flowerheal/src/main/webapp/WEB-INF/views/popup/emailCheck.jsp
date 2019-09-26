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
		// get방식에서 인증을 누르면 @PostMapping으로 다시 해당페이지를 불러주는데 이 때 controller에서
		// model.addAttribute("code", "0") 이라는 값을 넣어주고 부모창의 함수를 호출 한 후 close()로 팝업창을 닫아준다.
		function init(){
			if(${code} == "0"){
				opener.emailCallBack();		// 부모(memberJoinForm.js)에 만들어진 emailCallBack() 함수를 호출해줍니다.
				window.close();
			}
		}
		
		
		// 회원가입에서 구현해보면서 느낀점인데 회원가입폼에서 이메일유효성체크를받아서 회원가입을 시키고싶었습니다.
		// 그래서 주소팝업과 같이 팝업창을 이용해서 인증을 구현했는데 이게 보안상에 문제가 있는 방식이였습니다.
		// 해당 팝업창에서 크롬 F12 자바스크립을 열게되면 ${code}로 받아오는 숫자가 그대로 자바스크립에 노출되어서
		// 실무에서는 이용불가능한 구현방법이 되겠습니다.
		// 실무에서 구현한다면 랜덤으로 보안키를 설정하여 해당 URL 링크를 누르면 DB member 컬럼에 '인증유무'를 하나 만들어서
		// 기본값은 'N'이며 링크를 누르면 'Y' 변경해주는 mapper(SQL)를 호출해주시고, 만약에 인증이 안되어있다면
		// 본인인증 후 이용가능한 기능에서는 회원 인증유무가 Y가 아니라면 이메일인증을 하도록
		// 유도하는 방식을 써야한다고 생각합니다.
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