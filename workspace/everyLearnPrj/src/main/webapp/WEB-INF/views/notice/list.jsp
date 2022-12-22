<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    
<link rel="stylesheet" href="/el/resources/css/notice/list.css">
<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
</head>
<body>

    <main>
    <%@ include file="/WEB-INF/views/notice/notice-header.jsp" %>
        <div class="banner">
            <span>everyLearn NOTICE!</span>
        </div>


        <div class="container">
            <div class="list">
            
            <!-- 반복 -->
            <c:forEach var="n" items="${ voList }">
                <div class="td" id="no">${ n.no }</div>
                <div class="td" id="title">${ n.title }</div>
                <div class="td" id="nick">${ n.admin }</div>
                <div class="td" id="date">${ n.enrollDate }</div>
                <div class="td" id="hit">${ n.hit }</div>
			</c:forEach>
            <!-- 반복 -->   

                <div id="main-bot">
                    <a href="/#/board/write" class="btn btn-light" id="write">작성하기</a>
                </div>
    
                <div id="page-area" class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
                    <div id="page-area2" class="btn-group me-2" role="group" aria-label="First group">
	                    <a href="/el/notice/list?pno=${ pv.currentPage - 1 }" class="btn btn-outline-secondary"><</a>
	                    
						<c:forEach var="num" begin="${ pv.startPage }" end="${ pv.endPage }">
							<a href="/el/notice/list?pno=${num}" class="btn btn-outline-secondary">${ num }</a>
						</c:forEach>
						
						<a href="/el/admin/master/list?pno=${ pv.currentPage + 1 }" class="btn btn-outline-secondary">></a>
                    </div>
                </div>
            </div>

            


        </div>
        
    </main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
</body>
</html>


</body>
</html>