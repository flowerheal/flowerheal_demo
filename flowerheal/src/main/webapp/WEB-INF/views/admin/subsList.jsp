<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" />

<div class="container my-5">
	<div class="row justify-content-center">
		<div class="col col-sm-12 text-center">
			<h1>구독 정보 리스트</h1>
		</div>
	</div>
	<div class="row border">
		<div class="col col-md-1 h4 text-center">번호</div>
		<div class="col col-md-2 h4">구독자이메일</div>
		<div class="col col-md-2 h4">구독 상품명</div>
		<div class="col col-md-2 h4 text-center">구독기간</div>
		<div class="col col-md-1 h4 text-center">횟수</div>
		<div class="col col-md-2 h4 text-center">배송예정일</div>
		<div class="col col-md-1 h4"></div>
	</div>

	<div id="subsList">
		<!-- ajax 구독리스트 호출 -->
	</div>
	
	<%-- <c:forEach items="${list}" var="sdto">
		<div class="row border">
			<div class="col col-md-1 text-center">${sdto.subs_num}</div>
			<div class="col col-md-2">${sdto.subs_Member_Id }</div>
			<div class="col col-md-2">${sdto.subs_Pname }</div>
			<div class="col col-md-2 text-center">${sdto.subs_Fdate }~
				${sdto.subs_Edate }</div>
			<div class="col col-md-1">${sdto.subs_Cnt}</div>
			<div class="col col-md-2 text-center">${sdto.subs_Ddate}</div>
			<div class="col col-md-1">
				<button class="btn btn-danger deliveryBtn"
					data-snum="${sdto.subs_num}">
					배송
				</button>
			</div>
		</div>
	</c:forEach> --%>
</div>


<script>
	
	$(function(){
		// 강제로 get 링크를 열었을 경우 홈페이지로 이동
		if("${msg}" != "IsAdmin"){
			$(".container").html("");
			alert("잘못된 접근입니다.");
			location.href = getContextPath();
			return;
		}
		
		// 구독리스트 호출

		if("${msg}" == "IsAdmin"){
			subsList();
		}
		
		
		
		// case 1) for문
		// 나라면 for문으로 length만큼 돌았을텐데...
		// for (let i = 0; i < deliveryBtn.length; ++i) {
		// 	deliveryBtn[i].addEventListener("click", deliveryBtnF, false);
		// }
	
		// case 2)
		// Array.from(변수).forEach(함수명?) 기능검색해보자.  유사배열
		// Array.from() 메서드는 유사 배열 객체(array-like object)나
		// 				반복 가능한 객체(iterable object)를 얕게 복사해새로운 Array 객체를 만듭니다.
		// forEach(function(item, index){ 이 item, index를 사용할려면 익명함수로 구현해야해네.
		//		item은 배열의 객체가 들어오고, index는 배열의 index
		// }
		
		
	});
	
	
	// 구독리스트 호출
	function subsList(){
		
		let $url = "${pageContext.request.contextPath}/productRest/adminSubsList";
		let str = "";
		$.ajax({
			type : "GET",    	 //http 전송 방식
			url  : $url,				 //요청 url
			dataType : "JSON",   //요청시 응답데이터 타입
			//응답 성공시 처리사항
			success:function(result){	
				
				$.each(result, function(idx, rec){
					if(rec.subs_Check == 'Y'){
					    str += '<div class="row border">';
					    str += '    <div class="col col-md-1 text-center">' + rec.subs_num + '</div>';
					    str += '    <div class="col col-md-2">' + rec.subs_Member_Id + '</div>';
					    str += '    <div class="col col-md-2">' + rec.subs_Pname + '</div>';
					    str += '    <div class="col col-md-2 text-center">' + rec.subs_Fdate + '~';
					    str += '        ' + rec.subs_Edate + '</div>';
					    str += '    <div class="col col-md-1 text-center">' + rec.subs_Cnt + '</div>';
					    str += '    <div class="col col-md-2 text-center">' + rec.subs_Ddate + '</div>';
					    str += '    <div class="col col-md-1">';
					    str += '        <button class="btn btn-danger deliveryBtn"';
					    str += '            data-snum="' + rec.subs_num + '">';
					    str += '            배송';
					    str += '        </button>';
					    str += '    </div>';
					    str += '</div>';
					}
				});
				
				// 구독 리스트 삽입
				$("#subsList").html(str);
				
				// 배송 버튼 배열로 받아오기
				var deliveryBtn = document.getElementsByClassName("deliveryBtn");
				
				
				Array.from(deliveryBtn).forEach(function(item) {
					console.log(item);
					item.addEventListener("click", deliveryBtnF, false);
				});
				
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
	
	
	
	// 배송 버튼 클릭 이벤트
	function deliveryBtnF(){
		if(!confirm("해당 상품을 배송하시겠습니까?")){
			return false;
		}
		// document.location.href = "${pageContext.request.contextPath}" + this.getAttribute("data-url");
		
		var snum = this.getAttribute("data-snum");
		let $url = "${pageContext.request.contextPath }/productRest/subs/delivery/" + snum; 

		$.ajax({
			type : "PUT",    	 //http 전송 방식
			url  : $url,				 //요청 url
			dataType : "text",   //요청시 응답데이터 타입
			//응답 성공시 처리사항
			success:function(result){	
				// 구독리스트 다시 호출
				subsList();
				
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
	
	function getContextPath(){
	    var offset=location.href.indexOf(location.host)+location.host.length;
	    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
	    return ctxPath;
	}
	
</script>



<jsp:include page="../footer.jsp" />
