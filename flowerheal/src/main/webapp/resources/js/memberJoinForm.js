window.addEventListener("load", init, false);
function init() {
	$("input").on('blur', check); //지역, 성별 제외한 모든 입력사항 유효성 검사
	$("select").on('blur', check);	//지역 유효성 검사
	$("div#gender").on('click', check);	//성별 유효성 검사

	$("#hasId").on('click', hasIdF); //아이디 중복검사 버튼
	$("#joinBtn").on('click', joinBtnF); //회원가입 버튼

}


function hasIdF() {
	var wantId = $("#id").val();
	var allData = { "wantId": wantId };
	var emailReg = /^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/;
	var errMsg = this.nextElementSibling;
	console.log(errMsg)

	if (wantId == null || wantId == "") {
		errMsg.innerText = "아이디를 입력하세요."
		$("#id").addClass("is-invalid");
		checkArray[0] = false;

	} else if (wantId != "" && !emailReg.test(wantId)) {
		errMsg.innerText = "아이디 형식이 바르지 않습니다."
		$("#id").addClass("is-invalid");
		checkArray[0] = false;

	} else {
		$.ajax({
			type: "POST",
			url: "checkId",
			data: allData,
			success: function (str) {
				switch (str) {
					case "YES":
						$("#id").removeClass("is-invalid").addClass("is-valid");
						checkArray[0] = true;
						break;
					case "NULL":
						errMsg.innerText = "아이디를 입력하세요."
						$("#id").addClass("is-invalid");
						checkArray[0] = false;
						break;
					case "NO":
						errMsg.innerText = "이미 존재하는 아이디입니다."
						$("#id").addClass("is-invalid");
						checkArray[0] = false;
						break;
				}

			},
			error: function (request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}

		});
	}
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
	checkArray[i]=false;
}
function okLogic(input,i){
	$(input).removeClass("is-invalid").addClass("is-valid");
	checkArray[i] = true;
}


var checkArray = [false,false,false,false,false,false];
function check() {
	let id = this.id;
	var errMsg = this.nextElementSibling;
	switch (id) {
		//1) 이메일 주소 체크 
		case "id":
			var emailReg = /^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/;
			errMsg = this.nextElementSibling.nextElementSibling;
			if (this.value == "") {
				errorLogic(errMsg,"아이디를 입력하세요.",this,0);
				$(this).focus();

			} else if (this.value != "" && !emailReg.test(this.value)) {
				errorLogic(errMsg,"아이디 형식이 바르지 않습니다.",this,0);
				$(this).focus();

			} else if (this.value != "" && emailReg.test(this.value)) {
				errorLogic(errMsg,"아이디 중복검사를 진행해주세요",this,0);
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

		//4) 전화번호 체크
		case "tel":
			var phoneReg = /(\d{3}).*(\d{3}).*(\d{4})/;
			//var errMsg = this.nextElementSibling;
			var tel = this.value;
			var telNumOnly = "";
			for (var i = 0; i < tel.length; i++) {
				if (0 <= tel.charAt(i) && tel.charAt(i) <= 9) {
					telNumOnly += tel.charAt(i);
				}
			}


			if (telNumOnly == "" || telNumOnly == null) {
				errorLogic(errMsg,"전화번호를 입력하세요",this,3);

			} else if (!phoneReg.test(telNumOnly)) {
				errorLogic(errMsg,"올바른 전화번호 형식이 아닙니다.",this,3);

			} else {
				okLogic(this,3);
			}
			break;


		//5) 지역 체크
		case "region":
			if (this.value == "" || this.value == null || this.value == "0") {
				errorLogic(errMsg,"지역을 선택하세요.",this,4);

			} else {
				okLogic(this,4);
			}
			break;

		//6) 성별 체크	
		case "gender":
			var selectedGender = $('input:radio[name="gender"]:checked').val();
			if (!(selectedGender == null || selectedGender == "")) {
				console.log(this);
				okLogic(this,5);
			} else {
				console.log(this);
				errorLogic(errMsg,"성별을 선택하세요.",this,5);
			}

			break;

		//7) 별명체크	
		case "nickname":
			var input = $('#nickname').val().replace(/ /gi, '');			//공백 입력 방지
			$('#nickname').val(input);
			nickname = this.value;
			if (this.value == "" || this.value == null) {
				errorLogic(errMsg,"별명을 입력하세요.",this,6);
			} else {
				okLogic(this,6);
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
		alert('입력사항을 다시 확인해주세요.');
		return;
	} else {
		$("#mdto").submit();
	}
}

