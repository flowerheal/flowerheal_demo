<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp" />
<style>
.pagination {
  display: -ms-flexbox;
  display: flex;
  padding-left: 0;
  list-style: none;
  border-radius: 0.25rem;
}

.page-link {
  position: relative;
  display: block;
  padding: 0.5rem 0.75rem;
  margin-left: -1px;
  line-height: 1.25;
  color: #007bff;
  background-color: #fff;
  border: 1px solid #dee2e6;
}

.page-link:hover {
  z-index: 2;
  color: #0056b3;
  text-decoration: none;
  background-color: #e9ecef;
  border-color: #dee2e6;
}

.page-link:focus {
  z-index: 2;
  outline: 0;
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.page-item:first-child .page-link {
  margin-left: 0;
  border-top-left-radius: 0.25rem;
  border-bottom-left-radius: 0.25rem;
}

.page-item:last-child .page-link {
  border-top-right-radius: 0.25rem;
  border-bottom-right-radius: 0.25rem;
}

.page-item.active .page-link {
  z-index: 1;
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
}

.page-item.disabled .page-link {
  color: #6c757d;
  pointer-events: none;
  cursor: auto;
  background-color: #fff;
  border-color: #dee2e6;
}

.pagination-lg .page-link {
  padding: 0.75rem 1.5rem;
  font-size: 1.25rem;
  line-height: 1.5;
}

.pagination-lg .page-item:first-child .page-link {
  border-top-left-radius: 0.3rem;
  border-bottom-left-radius: 0.3rem;
}

.pagination-lg .page-item:last-child .page-link {
  border-top-right-radius: 0.3rem;
  border-bottom-right-radius: 0.3rem;
}

.pagination-sm .page-link {
  padding: 0.25rem 0.5rem;
  font-size: 0.875rem;
  line-height: 1.5;
}

.pagination-sm .page-item:first-child .page-link {
  border-top-left-radius: 0.2rem;
  border-bottom-left-radius: 0.2rem;
}

.pagination-sm .page-item:last-child .page-link {
  border-top-right-radius: 0.2rem;
  border-bottom-right-radius: 0.2rem;
}


</style>

<div class="container">
	<div class="row my-3">
		<div class="col">
			<div class="row justify-content-center">
				<p class="h4">게시글 목록</p>
			</div>
			<!-- 게시글목록 Grid -->
			<div class="row col-form-label-lg h6">
				<div class="col col-md-1 text-center">번호</div>
				<div class="col col-md-6 text-center">제목</div>
				<div class="col col-md-2 text-center">작성자</div>
				<div class="col col-md-2 text-center">작성일</div>
				<div class="col col-md-1 text-center">조회</div>
			</div>
			<c:forEach var="rec" items="${list}">
				<div class="row col-form-label">
					<div class="col col-md-1 text-center">${rec.bnum }</div>
					<div class="col col-md-6 text-left"><a class="text-decoration-none" href="#">${rec.btitle }</a></div>
					<div class="col col-md-2 text-left">${rec.bnickname }</div>
					<div class="col col-md-2 text-center">${rec.bcdate }</div>
					<div class="col col-md-1 text-right">${rec.bhit }</div>
				</div>
			</c:forEach>
			<!-- 글쓰기 버튼 -->
			<div class="row justify-content-end my-2">
				<button type="button" class="btn btn-sm btn-outline-secondary" id="writeBtn">글쓰기</button>
			</div>
			<!-- 페이징	Pagination -->
			<div class="row justify-content-center m-3">
				<nav aria-label="...">
					<ul class="pagination">
						<!-- 처음/이전페이지 이동 -->
						<c:choose>
							<c:when test="${pc.prev }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/bbs/list/1"
									tabindex="-1" aria-disabled="true"> ◀◀ </a></li>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/bbs/list?reqPage=${pc.startPage-1}"
									tabindex="-1" aria-disabled="true"> ◀ </a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1" aria-disabled="true">◀◀</a></li>
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1" aria-disabled="true">◀</a></li>
							</c:otherwise>
						</c:choose>

						<!-- 페이지 -->
						<c:forEach var="pageNum" begin="${pc.startPage }"	end="${pc.endPage }">
							<c:choose>
							<c:when test="${fc.searchType == null}">
							<c:if test="${pc.rc.reqPage != pageNum}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/bbs/list?reqPage=${pageNum}">
										${pageNum } </a></li>
							</c:if>
							<c:if test="${pc.rc.reqPage == pageNum}">
								<li class="page-item active" aria-current="page"><a
									class="page-link"
									href="${pageContext.request.contextPath }/bbs/list?reqPage=${pageNum}">
										${pageNum } <span class="sr-only">(current)</span>
								</a></li>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${pc.rc.reqPage != pageNum}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/bbs/list?reqPage=${pageNum}&searchType=${fc.searchType}&keyword=${fc.keyword}">
										${pageNum } </a></li>
							</c:if>
							<c:if test="${pc.rc.reqPage == pageNum}">
								<li class="page-item active" aria-current="page"><a
									class="page-link"
									href="${pageContext.request.contextPath }/bbs/list?reqPage=${pageNum}">
										${pageNum } <span class="sr-only">(current)</span>
								</a></li>
							</c:if>
						</c:otherwise>

						</c:choose>


						</c:forEach>

						<!-- 다음/끝페이지 이동 -->
						<c:choose>
							<c:when test="${pc.next }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/bbs/list?reqPage=${pc.endPage+1}"
									tabindex="-1" aria-disabled="true"> ▶ </a></li>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/bbs/list?reqPage=${pc.finalEndPage}"
									tabindex="-1" aria-disabled="true"> ▶▶ </a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="#">▶</a></li>
								<li class="page-item disabled"><a class="page-link"
									href="#">▶▶</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>

			<!-- 검색 select -->
			<div class="row justify-content-center">
				<form:form modelAttribute="fc"
									 cssClass="col-md-8 d-flex justify-content-center">

					<select name="searchType" id="searchType">
						<option value="TC" <c:if test="${pc.searchType eq 'TC'}">selected</c:if>>제목+내용</option>
						<option value="T"  <c:if test="${pc.searchType eq 'T'}">selected</c:if>>제목</option>
						<option value="C"	 <c:if test="${pc.searchType eq 'C'}">selected</c:if>>내용</option>
						<option value="N"  <c:if test="${pc.searchType eq 'N'}">selected</c:if>>작성자</option>
						<option value="I"  <c:if test="${pc.searchType eq 'I'}">selected</c:if>>아이디</option>
					</select>
					<input type="text" id = "keyword" class="mx-1"
											value="${pc.keyword }"
											placeholder="검색어를 입력하세요" />
					<input type="button"
								 class="btn btn-sm btn-outline-secondary mx-1"
								 id="searchBtn" value="검색">

				</form:form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />
<script>
	$(function () {
		console.log(document.URL)




		// 검색버튼 클릭 시
		$("#searchBtn").on("click", function () {
			//검색어 입력값이 없으면
			if ($("#keyword").val().trim().length == 0) {
				alert("검색어를 입력하세요");
				$("#keyword").focus();
				return false;
			}

			// var $reqPage;
			// if ('${fc.reqPage}' == "") {
			// 	$reqPage = 1;
			// } else {
			// 	$reqPage = '${pc.rc.reqPage}';
			// }


			var $searchType = $("#searchType option:selected").val();
			var $keyword = $("#keyword").val().trim();
			var $url = "${pageContext.request.contextPath }/bbs"+
									"/list?reqPage=" + 1 + "&searchType=" + $searchType + "&keyword=" + $keyword;
			$("form").attr("action", $url);
			$("form").submit();
		});
		$("#writeBtn").on("click", function () {
			var user = "${sessionScope.user == null ? null : sessionScope.user.id }";
			//로그인 전이면 로그인 화면으로 이동
			if(user == null || user==""){
				document.location.href="${pageContext.request.contextPath }/login/login"
				return;
			}
			//로그인 후면 글쓰기 화면으로 이동
			document.location.href="${pageContext.request.contextPath }/bbs/write";
		});
	});

</script>