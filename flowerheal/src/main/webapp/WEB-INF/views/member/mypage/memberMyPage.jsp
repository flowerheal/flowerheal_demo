<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>

	
 .orderProductCheck .subInfoChange a{
	background: #FFD3B0;
	font-weight: bold;
  }  
	
	 .outline{
		outline:1px solid #D5D5D5;
	} 
	
	
	.subsList .row div {
		text-align: center;
	}
	
	@media screen and (max-width: 992px) {
		.TabletMode, .PcMode{
			display:none;
		}
	}
	
	


</style>

<!-- myPage_Common.jsp : 메뉴창, 공통css -->
<jsp:include page="myPage_Common.jsp" />
	<section class="row col-md-8 col-lg-9">
		<div class="col-lg-10 mt-3">
			<div class="row col-lg-8 outline p-2 my-3">
				<div class="col-11">${sessionScope.user.name}님, 환영합니다.</div>
			</div>
			<div class="row col-lg-8 outline p-2 my-3">
				<div class="col-4">아이디</div>
				<div class="col-7">${sessionScope.user.id}</div>
			</div>
						
			<div class="row outline p-2 my-3 subsList" >
				<div class="col-12">구독 현황</div>				
				<div class="row " id="subsItem">
					<!-- ajax로 호출 : replyList(memberId); -->
				</div>
			</div>
				
		
		</div>
	</section>
	</div>
</section>

<jsp:include page="../../footer.jsp" />

<script>
var memberId = "${sessionScope.user.id}";	//로긴아이디

$(function(){
	//구독목록 보이기
	subsList(memberId);
});

//요청페이지에 대한 댓글목록 가져오기
function subsList(id){
	let $id = id;
	let $url = "${pageContext.request.contextPath }/productRest/msselect"; 
	let str = "";
	
	$.ajax({
		type : "POST",    	 //http 전송 방식
		url  : $url,				 //요청 url
		data : {"id" : $id},
		dataType : "JSON",   //요청시 응답데이터 타입
		//응답 성공시 처리사항
		success:function(result){
			var Y_Num = 0;
			$.each(result,function(idx, rec){
				if(rec.subs_Check =="Y"){
					str += '<div class="row col-12 outline px-0" data-snum="'+rec.subs_num+'">';
					str += '<div class="row col-12">';
					str += '	<div class="col-4 px-0 TabletMode text-right" >상품명</div>';
					str += '	<div class="col-md-8 px-0" style="font-weight:bold; color:#FF9E81;">'+rec.subs_Pname+'</div>';
					str += '	</div>';
					str += '	<div class="row col-12">';
					str += '		<div class="col-4 px-0 PcMode text-right">시작일 ~ 종료일</div>';
					str += '		<div class="col-md-8 px-0" style="font-weight:bold;color:#4C4C4C;">'+rec.subs_Fdate+' ~ '+rec.subs_Edate+'</div>';
					str += '	</div>';
					str += '	<div class="row col-12">';
					str += '		<div class="col-4 px-0 text-right">배송예정일</div>';
					str += '		<div class="col-8 px-0" style="font-weight:bold;color:#4C4C4C;">'+rec.subs_Fdate+'</div>';
					str += '	</div>';
					str += '	<div class="row col-12 d-flex justify-content-end">';
					str += '		<button type="button" class="btn btn-sm btn mr-2 deliveryInfoBtn " style="background:#F59E85; color:#fff;">배송정보 변경</button>';
					str += '		<button type="button" class="btn btn-sm btn mx-3 subsCancleBtn" style="background:#F59E85; color:#fff;">구독 취소</button>';
					
					str += '	</div>';
					str += '</div>';
					Y_Num += 1;
				}
			});

			if(result[0]==null || Y_Num == 0){
				str += '<div class="row col-12 px-0">';
				str += '<div class="col-12 px-0">';
				str += '	<i class="fas fa-shopping-basket" style="font-size:14rem;"></i>';
				str += '</div>';
				str += '<div class="col-12 px-0">';
				str += '	구독 중인 상품이 없습니다.';
				str += '</div>';
				str += '</div>';
			}
			


			
			//구독목록 삽입
			$("#subsItem").html(str);


			//구독 취소 버튼 기능
			$(".subsCancleBtn").on("click",subsCancleBtnF);
			
		},//end of success
		//응답 실패시 처리사항
		error:function(xhr, status, err){			
			console.log("code:"+xhr.status);
			console.log("message:"+xhr.responseText );
			console.log("status:"+status);
			console.log("err:"+err);
		}	
				
	});//End of $.ajax
					
}//End of subsList()

//구독 취소 버튼 기능
function subsCancleBtnF(){
	let $subs_num = $(this).closest("div[data-snum]").data("snum"); //구독고유번호
	let $url = "${pageContext.request.contextPath }/productRest/subs/cancel/"+$subs_num; 
	let str = "";
	if(confirm("구독을 취소하시겠습니까?")){
	 	$.ajax({
			type : "PUT",    	 //http 전송 방식
			url  : $url,				 //요청 url
			//data : {"id" : $id},
			dataType : "text",   //요청시 응답데이터 타입
			//응답 성공시 처리사항
			success:function(result){
				subsList(memberId);
			},
			//응답 실패시 처리사항
			error:function(xhr, status, err){			
				console.log("code:"+xhr.status);
				console.log("message:"+xhr.responseText );
				console.log("status:"+status);
				console.log("err:"+err);
			}	
					
		});//End of $.ajax 
	}

}


</script>