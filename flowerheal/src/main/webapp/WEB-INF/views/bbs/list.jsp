<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<jsp:include page="../header.jsp"/>
<link href="${pageContext.request.contextPath }/resources/css/list.css" rel="stylesheet">
<script>
/* 	$(document).on("ready",function(){
		
	}); */

	$(function() {
		
		//검색버튼 클릭시
		$("#searchBtn").on("click",function(){
			//검색어 입력값이 없으면
			if($("#keyword").val().trim().length == 0){
				alert('검색어를 입력하세요!');
				$("#keyword").focus();
				return false;
			}
/* 			var $reqPage = 1;
			//var $reqPage = ${pc.rc.reqPage}; */
			var $searchType = $("#key1 option:selected").val();
			var $keyword = $("#keyword").val().trim();
			var $url  = "${pageContext.request.contextPath }/bbs/list/1/";
					$url += $searchType+"/"+$keyword;
/* 			console.log($searchType);
			console.log($keyword);
			console.log($url);
 */			
 			document.location.href=$url;
 /* 			$("form").attr("action",$url);
			$("form").submit();  */
		});
		
		//글쓰기 버튼 클릭시
		$("#writeBtn").on("click",function(){
			
			var user = "${sessionScope.user == null ? null : sessionScope.user.id}";
			
			//로그인전이면 로그인화면으로 이동
			if(user == null || user == "") {
				if(confirm("로그인 하시겠습니까?")){
					document.location.href="${pageContext.request.contextPath }/login/loginForm";
				}

				return;
			}
			//로그인후면 글쓰기화면으로 이동
			document.location.href="${pageContext.request.contextPath }/bbs/write";
			
		});
		
	});

</script>
<div class="container">
	<!-- 게시글목록 Grid -->
	<div class="row justify-content-center mx-auto my-3 py-3">
		<div class="col col-md-10 p-0">
			<div class="row justify-content-center mt-3">
				<div class="alert alert-warning" role="alert">
  <h4 class="alert-heading row justify-content-center ">공지 / 이벤트 게시판</h4>
 
</div>
			</div>
			<div id="mobileList">
				<div class="row my-1 listHeader">
					<div class="col-6 text-center">제목</div>
					<div class="col-4 text-center">작성자</div>
					<div class="col-2 text-center">조회</div>
				</div>
				<div class="lists">
					<c:forEach var="rec" items="${list }">
					<div class="row">
						<div style="display: none">${rec.bnum }</div>
						<div class="col-6 text-left">
							<!-- 들여쓰기 -->
							<a class="text-decoration-none font-weight-bolder"
								href="${pageContext.request.contextPath }/bbs/read/${pc.rc.reqPage}/${rec.bnum}/${pc.searchType}/${pc.keyword}">
							<c:choose>
								<c:when test="${rec.bindent<4 }">
									<c:forEach begin="1" end="${rec.bindent }">&nbsp;</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach begin="1" end="5">&nbsp;&nbsp;</c:forEach>						
								</c:otherwise>
							</c:choose>
							<!-- re.gif -->
							<c:if test="${rec.bindent>0 }">
								<img src="${pageContext.request.contextPath }/resources/img/reply.gif" alt="#" />
							</c:if>
							${rec.btitle }</a>
							<div class="col"><small>${rec.bcdate }</small></div>
							
						</div>
						<div class="col-4 text-center">${rec.bname }</div>
						<div class="col-2 text-right">${rec.bhit }</div>
					</div>
					</c:forEach>
				</div>
			</div>


			<div id="desktopList">
				<div class="row my-1 listHeader">
					<div class="col col-md-2 text-center">번호</div>
					<div class="col col-md-4 text-center">제목</div>
					<div class="col col-md-2 text-center">작성자</div>
					<div class="col col-md-3 text-center">작성일</div>
					<div class="col col-md-1 text-center">조회</div>
				</div>
				<div class="lists">
					<c:forEach var="rec" items="${list }">
					<div class="row">
						<div class="col col-md-2 text-center">${rec.bnum }</div>
						<div class="col col-md-4 text-left">
							<!-- 들여쓰기 -->
							<c:choose>
								<c:when test="${rec.bindent<4 }">
									<c:forEach begin="1" end="${rec.bindent }">&nbsp;&nbsp;</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach begin="1" end="5">&nbsp;&nbsp;</c:forEach>						
								</c:otherwise>
							</c:choose>
							<!-- re.gif -->
							<c:if test="${rec.bindent>0 }">
								<img src="${pageContext.request.contextPath }/resources/img/reply.gif" alt="#" />
							</c:if>
							<a class="text-decoration-none font-weight-bolder pl-1"
								 href="${pageContext.request.contextPath }/bbs/read/${pc.rc.reqPage}
											/${rec.bnum}/${pc.searchType}/${pc.keyword}">${rec.btitle }</a></div>
						<div class="col col-md-2 text-center">${rec.bname }</div>
						<div class="col col-md-3 text-center">${rec.bcdate }</div>
						<div class="col col-md-1 text-right">${rec.bhit }</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<!-- 글쓰기 버튼 -->
			<c:choose>
				<c:when test="${sessionScope.user.id==null ||sessionScope.user.title =='MEMBER'}">
				</c:when>
				<c:otherwise>
					<div class="row justify-content-end my-3">
						<button type=button class="btn btn-outline-warning" id="writeBtn">글쓰기</button>
					</div>
				</c:otherwise>
			</c:choose>
			<!-- 페이징 Pagination-->
			<div class="row justify-content-center my-3">
				<nav aria-label="...">
				  <ul class="pagination pagination-sm">
				  	<!-- 처음  / 이전 페이지이동 -->
						<c:choose>
							<c:when test="${pc.prev }">	  
						    <li class="page-item ">
						      <a class="page-link" href="${pageContext.request.contextPath }/bbs/list/1" tabindex="-1" aria-disabled="true">◀</a>
						    </li>
		
						    <li class="page-item ">
						      <a class="page-link" href="${pageContext.request.contextPath }/bbs/list/${pc.startPage-1}" tabindex="-1" aria-disabled="true">◁</a>
						    </li>
				    	</c:when>
				    	<c:otherwise>
						    <li class="page-item disabled">
						      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">◀</a>
						    </li>
		
						    <li class="page-item disabled">
						      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">◁</a>
						    </li>				    					    	
				    	</c:otherwise>
				    </c:choose>
				    
				    <c:forEach var="pageNum" begin="${pc.startPage }" end="${pc.endPage }">
				    <!-- 현재페이지와 요청페이지가 다르면 -->
				    <c:if test="${pc.rc.reqPage != pageNum }">
				    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/bbs/list/${pageNum}/${pc.searchType}/${pc.keyword}">${pageNum }</a></li>
				    </c:if>
				    <!-- 현재페이지와 요청페이지가 같으면 -->
				    <c:if test="${pc.rc.reqPage == pageNum }">
				    <li class="page-item active" aria-current="page">
				      <a class="page-link" href="${pageContext.request.contextPath }/bbs/list/${pageNum}/${pc.searchType}/${pc.keyword}">${pageNum } <span class="sr-only">(current)</span></a>
				    </li>
				    </c:if>
				    </c:forEach>
				    
				  	<!-- 다음  / 끝 페이지이동 -->				    
						<c:choose>
							<c:when test="${pc.next }">	 
						    <li class="page-item">
						      <a class="page-link" href="${pageContext.request.contextPath }/bbs/list/${pc.endPage+1}">▷</a>
						    </li>
		
						    <li class="page-item">
						      <a class="page-link" href="${pageContext.request.contextPath }/bbs/list/${pc.finalEndPage}">▶</a>
						    </li>
						  </c:when>
						  <c:otherwise>
						    <li class="page-item disabled">
						      <a class="page-link" href="#">▷</a>
						    </li>
		
						    <li class="page-item disabled">
						      <a class="page-link" href="#">▶</a>
						    </li>						  
						  </c:otherwise>
						</c:choose>
				  </ul>
				</nav>		
			</div>
			<!-- 검색 select-->	
			<div class="row">
				<form class="mx-auto">
				<div class="form-group row">
					<div class="col col-sm-4 px-0">
					<select id="key1" name="searchType" class="form-control form-control-sm">
						<option value="TC"
							<c:out value="${pc.searchType == 'TC' ? 'selected' : ''}"/>>제목+내용</option>
						<option value="T"
							<c:out value="${pc.searchType == 'T' ? 'selected' : ''}"/>>제목</option>
						<option value="C"
							<c:out value="${pc.searchType == 'C' ? 'selected' : ''}"/>>내용</option>
						<option value="N"
							<c:out value="${pc.searchType == 'N' ? 'selected' : ''}"/>>작성자</option>
						<option value="I"
							<c:out value="${pc.searchType == 'I' ? 'selected' : ''}"/>>아이디</option>
					</select>
					</div>
					<div class="col col-sm-6 px-1">
					<input type="text" name="keyword" id="keyword" class="form-control form-control-sm"
								 value="${pc.keyword }" placeholder="검색어를 입력하세요"/>
					</div>
					
					<div class="col col-sm-2 px-0">							 
						<button class="btn btn-sm btn-outline-secondary align-baseline" type="button" id="searchBtn">검색</button>
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"/>

















