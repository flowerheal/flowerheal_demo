window.addEventListener("load", init, false);
function init() {
	$("input").on('blur', check); // input 사항 유효성 검사

	$("#hasId").on('click', hasIdF); //아이디 중복검사 버튼
	$("#joinBtn").on('click', joinBtnF); //회원가입 버튼
	
	var errMsg = null;	// 이메일 팝업에서도 이 변수에 접근해야해요.
}


function hasIdF() {
	var wantId = $("#id").val();
	var allData = { "wantId": wantId };
	var emailReg = /^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/;
	errMsg = this.parentElement.nextElementSibling;
	console.log(errMsg)

	if(checkArray[0]){
		return false;
	}
	
	if (wantId == null || wantId == "") {
		errMsg.innerText = "아이디를 입력하세요."
		$("#id").addClass("is-invalid");
		errMsg.style="display:block";
		checkArray[0] = false;

	} else if (wantId != "" && !emailReg.test(wantId)) {
		errMsg.innerText = "아이디 형식이 바르지 않습니다."
		$("#id").addClass("is-invalid");
		errMsg.style="display:block";
		checkArray[0] = false;

	} else {
		$.ajax({
			type: "POST",
			url: "checkId",
			data: allData,
			success: function (str) {
				switch (str) {
					case "YES":
						//$("#id").removeClass("is-invalid").addClass("is-valid");
						// errMsg.style="display:none";
						// checkArray[0] = true;
						
						// 이메일체크에서도 클릭하면 '이메일인증을 진행해주세요' 텍스트를 표시해줌
						errMsg.innerText = "이메일 인증을 진행해주세요.";
						$("#id").addClass("is-invalid");
						errMsg.style="display:block";
						// emailCheck();	
						emailPopup();
						break;
					case "NULL":
						errMsg.innerText = "아이디를 입력하세요."
						$("#id").addClass("is-invalid");
						errMsg.style="display:block";
						//$(errMsg).css("display:block");
						checkArray[0] = false;
						break;
					case "NO":
						errMsg.innerText = "이미 존재하는 이메일입니다."
						$("#id").addClass("is-invalid");
						errMsg.style="display:block";
						//$(errMsg).css("display:block");
						checkArray[0] = false;
						break;
				}

			},
			error: function (request, status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}

		});
	}
}

function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}

/* ========== 이메일 인증 팝업창 뛰우기 ==========*/
function emailPopup(){
	// window.open("URL GET방식 호출" , "팝업창 이름", "창 CSS");
	// 만들 팝업창 x축 위치 조정
	var popupX = (window.screen.width / 2) - (480 / 2);
	// 만들 팝업창 y축 위치 조정
	var popupY= (window.screen.height / 2) - (170 / 2);
	
	let $userEmail = $("#id").val();
	var pop = 
	window.open("/flowerheal/popup/emailCheck/" + $userEmail,"pop","width=480,height=170, scrollbars=yes, resizable=yes left="+ popupX +"px '"+", top="+ popupY+"px '"); 
}
/* ========== 이메일 인증 팝업창 뛰우기 ==========*/

/* ========== 이메일 인증 form에 입력받기 ==========*/
function emailCallBack(){
	$("#id").removeClass("is-invalid").addClass("is-valid");
	errMsg.style="display:none";
	checkArray[0] = true;
}
/* ========== 이메일 인증 form에 입력받기 ==========*/

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
		var char = sth.charAt(i).charCodeAt(0);
		if (0x1100 <= char && char <= 0x11FF) status = true;
		if (0x3130 <= char && char <= 0x318F) status = true;
		if (0xAC00 <= char && char <= 0xD7A3) status = true;
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


var checkArray = [false,false,false,false];
function check() {
	let id = this.id;
	var errMsg = this.nextElementSibling;
	switch (id) {
//==== 필수 입력사항 ====
		//1) 이메일 주소 체크 
		case "id":
			var emailReg = /^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/;
			errMsg = this.parentElement.nextElementSibling;
			console.log(errMsg)
			if (this.value == "") {
				errorLogic(errMsg,"아이디를 입력하세요.",this,0);
				$(this).focus();
				return;

			} else if (this.value != "" && !emailReg.test(this.value)) {
				errorLogic(errMsg,"아이디 형식이 바르지 않습니다.",this,0);
				$(this).focus();

			} else if (this.value != "" && emailReg.test(this.value)) {
				errorLogic(errMsg,"이메일 인증을 진행해주세요",this,0);
			}

			break;

		//2) 비밀번호 체크
		case "pw":
			var pwdReg = /^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z$&+,:;=?@#|'<>.^*()%!-]{6,10}$/;
			if (this.value == "" ||this.value==null){
				errorLogic(errMsg,"비밀번호를 입력하세요.",this,1);
			} else if(!pwdReg.test(this.value)) {
				errorLogic(errMsg,"조건에 맞지 않는 비밀번호입니다.",this,1);
			} else {
				okLogic(errMsg,this,1);
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
				okLogic(errMsg,this,2);

			}
			break;

		//4) 이름체크	
		case "name":
			var input = $('#name').val().replace(/ /gi, '');	//공백 입력 방지
			$('#name').val(input);
			nameVal = this.value;
			if (this.value == "" || this.value == null) {
				errorLogic(errMsg,"이름을 입력하세요",this,3);
			}else if(!onlyHangul(nameVal)){
				errorLogic(errMsg,"한글만 입력 가능합니다.",this,3)
			}else if(onlyHangul(nameVal)){
				okLogic(errMsg,this,3);
			}
			break;


//==== 선택 입력사항 ====
		//5) 전화번호 체크
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
				checkArray[4] = true;
			} else if (!phoneReg.test(telNumOnly)) {
				errorLogic(errMsg,"올바른 전화번호 형식이 아닙니다.",this,4);
			} else {
				okLogic(errMsg,this,4);
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
		console.log(checkArray);
		alert('입력사항을 다시 확인해주세요.');
		return;
	} else {
		$("#mdto").submit();
	}
}

