<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>채용 공고</title>
<link rel="stylesheet" href="/el/resources/css/emp/post-list.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
</head>

<body>

<%@ include file="/WEB-INF/views/common/emp-header.jsp"%>

<main id="container">
	<div class="emp-container">
		<div class="emp">
			<div class="emp-wrapper">
				<ul class="announcement">
				<c:forEach items="${list}" var="list" begin="0" end="${fn:length(list)}" step="1">
					<li>
						<div class="announcement-wrapper">
							<a href="/el/emp/position?no=${list.no}">
								<figure class="img-wrapper">
									<img src="/el/resources/upload/${list.thumb}" alt="img">
								</figure>
								<div class="emp-info">
									<div>
										<div class="emp-name">${list.companyName}</div>
										<a href="/el/emp/position?no=${list.no}" class="position">${list.title}</a>
									</div>
									<ul class="skill">
										<li>${list.sector}</li>
									</ul>
									<div class="etc">
										<span>${list.career} | </span> <span>${list.address}</span>
									</div>
								</div>
							</a>
						</div>
					</li>
				</c:forEach>
			</div>
		</div>
	</ul>
	<nav class="page-area">
		<ul>
		<c:if test="${pv.currentPage != 1}">
				<li>
					<c:if test="${empty keyword}">
						<a id="before" href="${httpServletRequest.getRequestURI()}?pno=${pv.currentPage-1}">이전</a>
					</c:if>
					<c:if test="${!empty keyword}">
						<a id="before" href="${httpServletRequest.getRequestURI()}?pno=${pv.currentPage-1}&keyword=${keyword}">이전</a>
					</c:if>
				</li>
		</c:if>
		<c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">
				<li>
					<c:if test="${empty keyword}">
						<a class="numBtn" href="${httpServletRequest.getRequestURI()}?pno=${num}">${num}</a>
					</c:if>
					<c:if test="${!empty keyword}">
						<a class="numBtn" href="${httpServletRequest.getRequestURI()}?pno=${num}&keyword=${keyword}">${num}</a>
					</c:if>
				</li>
		</c:forEach>
		<c:if test="${pv.currentPage != pv.maxPage && pv.maxPage != 0}">
				<li>
					<c:if test="${empty keyword}">
						<a id="after" href="${httpServletRequest.getRequestURI()}?pno=${pv.currentPage+1}">다음</a>                       		
					</c:if>
					<c:if test="${!empty keyword}">
						<a id="after" href="${httpServletRequest.getRequestURI()}?pno=${pv.currentPage+1}&keyword=${keyword}">다음</a> 
					</c:if>
				</li>
		</c:if>
		</ul>
	</nav>
</div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>

</html>