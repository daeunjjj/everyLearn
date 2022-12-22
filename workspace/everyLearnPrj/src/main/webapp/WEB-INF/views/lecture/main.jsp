<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://kit.fontawesome.com/0c7f523053.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/el/resources/css/lecture/main.css" />
</head>

<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	
		<div class="wrap">
			<ul class="sidebar">
				<li><a href="/el/lecture/main">전체 강의</a></li>
				<li><a href="/el/lecture/main/drawing">드로잉</a></li>
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
		            <div id="lec-list">
		                <div id="lec-pic"><a href="#"><img src="/el/resources/img/lecture/lecpic.png"></a></div>
		                <div id="lec-int"><a href="#">아이패드로 일상 그리기, 프로크리에이트를 이용한 드로잉 클래스</a></div>
		                <div id="lec-teacher"><i class="fa-regular fa-user">강사이름</i></div>
		            </div>
	            
	            <c:forEach items="${list}" var="list">
		            <div id="lec-list">
		                <div id="lec-pic"><a href="/el/lecture/detail?bno=${list.no }">사진</a></div>
		                <div id="lec-int"><a href="/el/lecture/detail?bno=${list.no }">${list.className}</a></div>
		                <div id="lec-teacher"><i class="fa-regular fa-user">${list.teacherNo}</i></div>
		            </div>
		        </c:forEach>
	            
	        </div>
	    </div>
	    
	    <!-- 페이징 -->
	    <div id="page-area" class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
                <div id="page-area2" class="btn-group me-2" role="group" aria-label="First group">
	                <a href="/#/board/list?p=1" class="btn btn-outline-secondary"><</a>
	                <a href="/#/board/list?p=1" class="btn btn-outline-secondary">1</a>
	                <a href="/#/board/list?p=2" class="btn btn-outline-secondary">2</a>
	                <a href="/#/board/list?p=3" class="btn btn-outline-secondary">3</a>
	                <a href="/#/board/list?p=4" class="btn btn-outline-secondary">4</a>
	                <a href="/#/board/list?p=5" class="btn btn-outline-secondary">5</a>
	                <a href="/#/board/list?p=1" class="btn btn-outline-secondary">></a>
                </div>
       	</div>
	</div>
			
	
	
	
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>