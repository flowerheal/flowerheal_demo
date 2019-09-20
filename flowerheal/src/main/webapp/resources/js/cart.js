

$( document ).ready(function() {
	//===== button 활성화 =====
	$("#keepShoppingBtn").on("click",keepShoppingBtnF); //상품변경버튼
	$("#orderBtn").on("click",orderBtnF); //상품결제페이지 이동버튼
	
	
});

function keepShoppingBtnF()
{
	alert("상품페이지로 이동합니다");
	document.location.href = "/flowerheal/product/productList";
}

function orderBtnF()
{
	alert("결제페이지로 이동합니다");
}

