<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.subInfoChange a{
	background: lightpink;
}
.outline{
	outline: 1px solid gray;
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
						
			<div class="row outline p-2 my-3 subsList">
				<div class="col-12">구독 현황</div>
				<div class="row" id="subsItem">
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
	replyList(memberId);
});

//요청페이지에 대한 댓글목록 가져오기
function replyList(id){
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
			$.each(result,function(idx, rec){
				str += '<div class="row col-12 outline px-0">';
				str += '<div class="row col-12">';
				str += '	<div class="col-3 px-0 TabletMode">상품명</div>';
				str += '	<div class="col-md-8 px-0">'+rec.subs_Pname+'</div>';
				str += '	</div>';
				str += '			<div class="row col-12">';
				str += '		<div class="col-4 px-0 PcMode">시작일 ~ 종료일</div>';
				str += '					<div class="col-md-8 px-0">'+rec.subs_Fdate+' ~ '+rec.subs_Edate+'</div>';
				str += '	</div>';
				str += '		<div class="row col-12">';
				str += '		<div class="col-4 px-0">배송예정일</div>';
				str += '		<div class="col-7 px-0">19년 9월 8일</div>';
				str += '		</div>';
				str += '		<div class="row col-12">';
				str += '			<button type="button" class="btn btn-sm btn-primary mr-2" id="deliveryInfoBtn">배송정보 변경</button>';
				str += '			<button type="button" class="btn btn-sm btn-primary mx-3" id="subsCancleBtn">구독 취소</button>';
				str += '			</div>';
				str += '			</div>';

			});
			
			//구독목록 삽입
			$("#subsItem").html(str);
			
			//페이지 삽입
			//showPageList(result.pc);
			
			//댓글목록 이벤트처리
			//doActionEvent();

		},
		//응답 실패시 처리사항
		error:function(xhr, status, err){			
			console.log("code:"+xhr.status);
			console.log("message:"+xhr.responseText );
			console.log("status:"+status);
			console.log("err:"+err);
		}	
				
	});//End of $.ajax
	
	//페이지번호 클릭시 이벤트 처리
	//id값이 paging인 하위요소 li a 에 클릭이벤트가 발생하면
/* 	$("#paging").on("click","li a", function(e){
		//현재 이벤트의 기본동작을 중단.
		e.preventDefault(); 
		
		//현재 이벤트가 상위 및 현재 레벨에 걸린 다른 이벤트가 동작 않도록 중단
		e.stopImmediatePropagation();
		
		page = $(this).attr("href");
		replyList(page); 
	});*/
					
}//End of replyList()	
</script>