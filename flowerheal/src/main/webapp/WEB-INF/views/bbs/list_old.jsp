<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" />
<div class="container">
	<div class="row my-3">
		<div class="col">
			<div class="row justify-content-center">
				<p class="h4">게시글 목록</p>
			</div>
		<!-- 게시글목록 Grid -->
			<div class="row">
				<div class="col col-md-1 text-center">번호</div>
				<div class="col col-md-6 text-center">제목</div>
				<div class="col col-md-2 text-center">작성자</div>
				<div class="col col-md-2 text-center">작성일</div>
				<div class="col col-md-1 text-center">조회</div>
			</div>
			<c:forEach var="rec" items="${list}">
				<div class="row">
					<div class="col col-md-1 text-center">${rec.bnum }</div>
					<div class="col col-md-6 text-left">${rec.btitle }</div>
					<div class="col col-md-2 text-left">${rec.bnickname }</div>
					<div class="col col-md-2 text-center">${rec.bcdate }</div>
					<div class="col col-md-1 text-right">${rec.bhit }</div>
				</div>
			</c:forEach>

			<!-- 페이징	Pagination -->
			<div class="row justify-content-center my-3">
				<nav aria-label="...">
					<ul class="pagination">
						<!-- 처음/이전페이지 이동 -->
						<c:choose>
							<c:when test="${pc.prev }">
								<li class="page-item">
									<a class="page-link"
										 href="${pageContext.request.contextPath }/bbs/list/1"
										 tabindex="-1" aria-disabled="true">
										 ◀◀
									</a>
								</li>
								<li class="page-item">
									<a class="page-link"
										 href="${pageContext.request.contextPath }/bbs/list/${pc.startPage-1}"
										 tabindex="-1" aria-disabled="true">
										 ◀
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">◀◀</a></li>
								<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">◀</a></li>
							</c:otherwise>
						</c:choose>

						<!-- 페이지 -->
						<c:forEach var="pageNum" begin="${pc.startPage }"	end="${pc.endPage }">
							<c:if test="${pc.rc.reqPage != pageNum}">
								<li class="page-item">
									<a class="page-link"
										 href="${pageContext.request.contextPath }/bbs/list/${pageNum}">
										 ${pageNum }
									</a>
								</li>
							</c:if>
							<c:if test="${pc.rc.reqPage == pageNum}">
								<li class="page-item active" aria-current="page">
									<a class="page-link"
										 href="${pageContext.request.contextPath }/bbs/list/${pageNum}">
										 ${pageNum } <span class="sr-only">(current)</span>
									</a>
								</li>
							</c:if>
						</c:forEach>

						<!-- 다음/끝페이지 이동 -->
						<c:choose>
							<c:when test="${pc.next }">
								<li class="page-item">
									<a class="page-link"
										 href="${pageContext.request.contextPath }/bbs/list/${pc.endPage+1}"
										 tabindex="-1" aria-disabled="true">
										 ▶
									</a>
								</li>
								<li class="page-item">
									<a class="page-link"
										 href="${pageContext.request.contextPath }/bbs/list/${pc.finalEndPage}"
										 tabindex="-1" aria-disabled="true">
										 ▶▶
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="#">▶</a></li>
								<li class="page-item disabled"><a class="page-link"	href="#">▶▶</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
				
			<!-- 검색 select -->
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />