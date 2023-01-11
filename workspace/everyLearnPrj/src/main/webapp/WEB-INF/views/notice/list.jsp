<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    
<link rel="stylesheet" href="/el/resources/css/notice/list.css">
<link rel="stylesheet" href="/el/resources/css/emp-comm/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">

<!-- 파비콘 -->
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>

    <main>
    <%@ include file="/WEB-INF/views/notice/notice-header.jsp" %>
        <div class="banner">
            <span>everyLearn NOTICE!</span>
        </div>


        <div class="container">
            <div class="list">
            
            	<div class="th">번호</div>
                <div class="th">제목</div>
                <div class="th"></div>
                <div class="th">작성일</div>
                <div class="th">조회수</div>
            
            <!-- 반복 -->
            <c:forEach var="n" items="${ list }">
                <div class="td" id="no">${ n.no }</div>
                <div class="td" id="title"><a href="/el/notice/detail?no=${ n.no }" id="title-a">${n.title}</a></div>
                <div class="td" id="nick">${ n.admin }</div>
                <div class="td" id="date">${ fn:substring(n.enrollDate,0,8) }</div>
                <div class="td" id="hit">${ n.hit }</div>
			</c:forEach>
            <!-- 반복 -->   
    
                <div id="page-area" class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
	 				<div id="page-area2" class="btn-group me-2" role="group" aria-label="First group">
	                
		                <c:if test="${page.startPage != 1}">
							<a href="${page.startPage - 1}" class="btn btn-outline-secondary" id="a1"><</a>
						</c:if>
			            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<c:if test="${page.currentPage != i and i <= page.lastPage}">
								<a href="/el/notice/list/${i}" class="btn btn-outline-secondary" id="a1">${i}</a>
							</c:if>
							<c:if test="${page.currentPage == i and i <= page.lastPage}">
								<a href="/el/notice/list/${i}" class="btn btn-outline-secondary" id="a1">${i}</a>
							</c:if>
						</c:forEach>    
			            <c:if test="${page.endPage < page.lastPage}">
							<a href="${page.endPage + 1}" class="btn btn-outline-secondary" id="a1">></a>
						</c:if>    
					 </div>
				</div>
            </div>

            


        </div>
        

        
    </main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
</body>
</html>
