
/* ========== 도로명주소검색 팝업창 뛰우기 ==========*/
function goPopup(){
	// window.open("URL GET방식 호출" , "팝업창 이름", "창 CSS");
	// 만들 팝업창 x축 위치 조정
	var popupX = (window.screen.width / 2) - (570 / 2);
	console.log(popupX)
	// 만들 팝업창 y축 위치 조정
	var popupY= (window.screen.height / 2) - (420 / 2);
	console.log(popupY)
	var pop = 
	window.open("/flowerheal/popup/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes left="+ popupX +"px '"+", top="+ popupY+"px '"); 
}
/* ========== 도로명주소검색 팝업창 뛰우기 ==========*/


/* ========== 검색값 form에 입력받기 ==========*/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	// 우편주소 > 상세주소 > 사용자입력 주소
	// console.log(zipNo);	
	// console.log(roadFullAddr);
	// console.log(addrDetail);
	
	// id="zipNo" 태그의 text값을 넣는다.
	$("#zipNo").val(zipNo);
	
	// id="roadAddrPart1" 태그의 text값을 넣는다.
	$("#roadAddrPart1").val(roadAddrPart1);
	
	// id="addrDetail" 태그의 text값을 넣는다.
	$("#addrDetail").val(addrDetail);
	$("#addrDetail").attr("readOnly",false);
}
/* ========== 검색값 form에 입력받기 ==========*/
