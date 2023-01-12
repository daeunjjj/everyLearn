<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>everyLearn</title>

<script src="https://kit.fontawesome.com/0c7f523053.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/el/resources/css/lecture/main.css" />
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>

<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	
		<div class="wrap">
			<ul class="sidebar">
				<li><a href="/el/lecture/main?pno=1">전체 강의</a></li>
				<li><a href="/el/lecture/main/drawing?pno=1">드로잉</a></li>
				<li><a href="/el/lecture/main/cook">요리 / 베이킹</a></li>
				<li><a href="/el/lecture/main/workout">운동</a></li>
				<li><a href="/el/lecture/main/music">음악</a></li>
				<li><a href="/el/lecture/main/itTech">IT / 개발</a></li>
				<li><a href="/el/lecture/main/language">언어</a></li>
				<li><a href="/el/lecture/main/finance">금융 /재테크</a></li>
			</ul>
	
			<div class="lecture-main">
		        <div class="search">
					<form action="/el/lecture/main/search" method="get">
			            <input type="text" id="search-inputbox" name="keyword" placeholder="강의를 검색하세요" style="width: 250px">
						<button class="btn_submit" type="submit"><i class="fa fa-search"></i></button>
						<!--<i class="fa fa-search"></i>*/-->
					</form>
				</div>
		        <div class="list-wrap">
		            
	            
	            <c:forEach items="${list}" var="list">
		            <div id="lec-list">
		                <div id="lec-pic"><a href="/el/lecture/detail?bno=${list.no }"><img src="/el/resources/upload/${list.thumb}" width="300px" height="140px"></a></div>
		                <div id="lec-int"><a href="/el/lecture/detail?bno=${list.no }">${list.className}</a></div>
		                <div id="lec-teacher"><a id="teacher-detail" href="/el/teacher/detail?teacherNick=${list.teacherNo }"><i class="fa-regular fa-user"></i>${list.teacherNo }</a></div>
		            </div>
		        </c:forEach>
	            
	        </div>
	    </div>
	    
	    <!-- 페이징 -->
	    <div id="page-area" class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
                <div id="page-area2" class="btn-group me-2" role="group" aria-label="First group">
	                <a id = "before" href="/el/lecture/main?pno=${pv.currentPage-1}" class="btn btn-outline-secondary"><</a>
	                                    
                    <c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">
                        <a href="/el/lecture/main?pno=${num }" class="btn btn-outline-secondary">${num}</a>
					</c:forEach>
			
	                <a href="/el/lecture/main?pno=${pv.currentPage+1}"class="btn btn-outline-secondary">></a>
                </div>
       	</div>
	</div>
			
	
	
	
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>


</html>