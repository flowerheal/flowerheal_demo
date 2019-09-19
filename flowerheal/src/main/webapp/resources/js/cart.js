

$( document ).ready(function() {
	//===== button 활성화 =====
	$("#keepShoppingBtn").on("click",keepShoppingBtnF); //상품변경버튼
	$("#orderBtn").on("click",orderBtnF); //상품결제페이지 이동버튼
	
	//총합계가격 계산
	
});

function keepShoppingBtnF()
{
	alert("상품페이지로 이동합니다");
}

function orderBtnF()
{
	alert("결제페이지로 이동합니다");
}

//삭제버튼(ajax)


//패키지 변경(이걸 어덯게 하지...)