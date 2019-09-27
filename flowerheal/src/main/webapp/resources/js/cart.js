

$( document ).ready(function() {
	//===== button 활성화 =====
	$("#keepShoppingBtn").on("click",keepShoppingBtnF); //상품변경버튼
	$("#orderBtn").on("click",orderBtnF); //상품결제페이지 이동버튼
	
	
});

function keepShoppingBtnF()
{
	//alert("상품페이지로 이동합니다");
	document.location.href = "/flowerheal/product/productList";
}

function orderBtnF(){
	
	
	if($("#price").text() == "0원"){
		alert("장바구니가 비어있습니다.");
		return false;
	}
	
	let $id = memberId;
	//alert("결제페이지로 이동합니다");
	$.ajax({
		type : "POST",
		url : "cartToOrder",
		data : {"id":$id},
		success:function(result){	
		console.log(result);
			var form = document.createElement("form");
			form.action = "/flowerheal"+result;
			form.method = "POST";

			var $input = document.createElement("input");
			$input.setAttribute("type", "hidden");
			$input.setAttribute('name', "user_id");
			$input.setAttribute("value", $id);
			form.appendChild($input);


			document.body.appendChild(form);
			form.submit();
				
		},
			//응답 실패시 처리사항
		error:function(xhr, status, err){		
			console.log("code:"+xhr.status);
			console.log("message:"+xhr.responseText );
			console.log("status:"+status);
			console.log("err:"+err);
		}	
	});

}

