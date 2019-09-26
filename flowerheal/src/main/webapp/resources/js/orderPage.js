// *===== 구성버튼 누르면 열기&닫기 =====*
var acc = document.getElementsByClassName("accordion");

for (var i = 0; i < acc.length-1; i++) {
	var panel = acc[i].nextElementSibling;

	//===== accordion active 디폴트 =====
	if (acc[i].classList.contains("active")) {
		if(acc[i].classList.contains("payMethod")){
			panel.style.display = "flex";
		}else{
			panel.style.display = "block";
		}
	} else {
		panel.style.display = "none";
	}


	//===== accordion 클릭이벤트 =====
  acc[i].addEventListener("click", function() {
		this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (this.classList.contains("active")) {
			if(this.classList.contains("payMethod")){
				panel.style.display = "flex";
			}else{
				panel.style.display = "block";
			}
    } else {
			panel.style.display = "none";
    }
  });
}

// *===== 이름에 띄어쓰기 금지 =====*
function noSpace(inputName) {
	var input = $(inputName).val().replace(/ /gi, '');	//공백 입력 방지
	$(inputName).val(input);
	return inputName;
}

// *===== 전화번호에 하이픈 자동으로 넣기 =====*
function inputTelNumber(obj){

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





$(function() {	
	loadAddressF(); // 최근 배송지 불러오는 ajax
	$("#saveAddressMsg").on("click",agreementMsgF); // 기본배송지로 설정 클릭 이벤트
	$("#subsEmailMsg").on("click",agreementMsgF); 	// 이메일 수신여부 클릭 이벤트
	$("#agreementMsg").on("click",agreementMsgF); 	// 이용약관 클릭 이벤트
	$(".payMethod_Btn").on("click",payMethod_BtnF); // 결제수단 설정버튼
	$(".addressFrom_Btn").on("click",addressFrom_BtnF); // 배송지 버튼별 이벤트
	$(".addressFrom_Btn#recentAddress").on("click",loadAddressF); // 배송지 버튼별 이벤트
	$("#paymentBtn").on("click",paymentBtnF); // 결제하기 버튼 : 최종 유효성 검사
	
});


//*===== 이메일 수신여부 클릭 이벤트 =====*
function agreementMsgF(){
	$(this).toggleClass("active");
	if($(this).hasClass("active")){
		$(this).prev().prop('checked', true);
		$(this).children("i").removeClass("far").addClass("fas")
	}else{
		$(this).prev().prop('checked', false);
		$(this).children("i").removeClass("fas").addClass("far")
	}
	
	console.log(this);	
//	if ($('input:checkbox[name="isSaveAddr"]').is(":checked") == true){
//		alert("체크박스 true");
//	} else{
//		alert("체크박스 false");
//	}
}

//*===== 결제수단 설정버튼 =====*
function payMethod_BtnF(){
	$(".payMethod_Btn.active").removeClass("active");
	$(this).toggleClass("active");
	let $payMethod_Btn = $(this).val();
	$("input#payment").val($payMethod_Btn);
}



//*===== 결제하기 버튼 : 최종 유효성 검사 =====*
function paymentBtnF(){
	
	var orderNameTag = $('#name').val();														//이름 입력 여부
	var orderTelTag = $('#tel').val();															//전화번호 입력 여부
	var addressTag = $('#roadAddrPart1').val();											//주소 입력 여부
	var paymentHiddenTag = $('input#payment').val();								//결제수단 선택 여부
	var agreementBtn = $('input[id="agreementBtn"]:checked').val(); //이용약관 클릭 여부
	var subsEmailBtn = $('input[id="subsEmailBtn"]:checked').val(); //이메일 수신여부 클릭 여부
	var phoneReg = /(\d{3}).*(\d{3}).*(\d{4})/;		//전화번호 표준
	
	
	// 결제페이지에 넘어올 때 가격이 문자열 "30,000" 으로 콤마가 붙어서 오는데 콤마를 제거해준 값을 다시 input값에 넣어준다.
	var removeComma = $("#subs_Price").val();
	if(removeComma != null){
		removeComma = removeComma.replace(/\,/g,''); // 30,000 String 형태를 30000 콤마 제거 후 Int형으로 넣음
		$("#subs_Price").val(removeComma);		
	}
	
	if(orderNameTag==""){
		alert("이름을 입력해주세요.");
		return;
	}
	if(orderTelTag==""){
		alert("전화번호를 입력해주세요.");
		return;
	}else if(!phoneReg.test(orderTelTag)){
		alert("전화번호를 형식에 맞게 입력해주세요.");
		return;
	}
	if(addressTag==""){
		alert("주소를 입력해주세요.");
		return;
	}
	if(paymentHiddenTag==""){
		alert("결제수단을 선택해주세요.");
		return;
	}

	if(agreementBtn !="on"){
		alert("이용약관에 동의해주세요.");
		return;
		
	}else{
		// 이메일 수신여부
		if(subsEmailBtn == "on"){
			$('input[id="subs_Email"]').val('Y');
		}else{
			$('input[id="subs_Email"]').val('N');
		}
		
		// 기본배송지 결정여부
		if ($('input:checkbox[id="saveAddressBtn"]').is(":checked") == true){
			$('input[id="isSaveAddr"]').val('Y');
		} else{
			$('input[id="isSaveAddr"]').val('N');
		}
		
		$("form").submit();
		
	}
	
}