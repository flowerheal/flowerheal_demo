// *===== 배송비 로직 주석처리함 =====*
$( document ).ready(function() {
	//===== button 활성화 =====
	$("#addToCartBtn").on("click",addToCartBtnF); //카트에 담기 버튼
	$("#orderPageBtn").on("click",orderPageBtnF); //주문하기 버튼
	$(".product_SubsCnt_Btn").on("click",product_SubsCnt_BtnF); //구독기간 설정버튼

//====== 금액 계산 로직 : 디폴트 ======
	let $option0 = parseInt($("#option0").val()); //꽃다발 & 화분 가격
	let $option1 = parseInt($("#option1").val()); //구성품 1 가격
	let $option2 = parseInt($("#option2").val()); //구성품 2 가격
	// let $productCost = parseInt($option0 + $option1 + $option2); // 상품 가격
	// $("#productCost").val($productCost); //가격 input 란에 삽입
	
	// //배송비 : 2500원 / 3만원 이상 배송비 무료
	// let $postCost = 0;
	// 	if($productCost>=30000){ 
	// 		$postCost = 0;
	// 	}else{
	// 		$postCost = 2500;
	// 	}
	// $("#postCost").val($postCost);	//배송비 input 란에 삽입

	// 숫자.toLocaleString() 
	// let $product_Price = parseInt($option0 + $option1 + $option2); // 상품 가격
	let $product_Price = parseInt($option0 + $option1 + $option2).toLocaleString(); // 상품 가격
	
	$("#product_Price").val($product_Price); //금액 input 란에 삽입
	
	// let test = addComma(1234567891);
	// $("#product_Price").val(test); //금액 input 란에 삽입
	
	// 정규식을 이용한 , 원화표시
	function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		  return num.toString().replace(regexp, ',');
	}
	
	// ',' 콤마를 제거해주는 함수
	function removeComma(num){
		return num = num.replace(/\,/g,'');
	}
	
	
	//====== 금액 계산 로직 : 체크박스 선택에 따를 가격 변동 ======
$("input:checkbox").each(function(){
	$(this).on("click",function(){
		if(!$(this).is(":checked")){
			$product_Price = removeComma($product_Price);
			$product_Price = parseInt($product_Price) - parseInt($(this).val()); //checked 안한 경우	
		}else{
			$product_Price = removeComma($product_Price);
			$product_Price = parseInt($product_Price) + parseInt($(this).val()); //다시 checked한 경우
		}

		// $("#productCost").val($productCost);//바뀐 가격 input 란에 삽입
		// //바뀐 가격에 따른 배송비
		// if($productCost>=30000){
		// 		$postCost = 0;
		// 	}else{
		// 		$postCost = 2500;
		// 	}
		// $("#postCost").val($postCost);	//배송비 input 란에 삽입
		// $product_Price = $productCost+$postCost; //금액 = 바뀐가격 + 바뀐가격에 따른 배송비
		
		console.log($product_Price);
		$product_Price = addComma($product_Price);
		console.log($product_Price);
		$("#product_Price").val($product_Price); 		 //금액 input 란에 삽입

	});
});
});

