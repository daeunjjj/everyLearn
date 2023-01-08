<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


<link rel="stylesheet" href="/el/resources/css/emp-comm/list.css">
<link rel="stylesheet" href="/el/resources/css/emp-comm/common.css">

</head>
<body>

<%@ include file="/WEB-INF/views/common/emp-header.jsp" %>

<main>
	  	<div class="comm-banner">
	  		<span id="span1">Employment COMMUNITY</span>
	  		<span id="span2">채용 커뮤니티</span>
	  	</div>

	  <div id="container">
	  	

        <div id="main">

            <div class="th">번호</div>
            <div class="th">카테고리</div>
            <div class="th">제목</div>
            <div class="th">닉네임</div>
            <div class="th">작성일시</div>
            <div class="th">조회수</div>

		<c:forEach items="${list}" var="c">
            <div class="td">${ c.no }</div>
            <div class="td">${ c.category }</div>
            <div class="td" id="title"><a href="/el/emp-comm/detail?no=${ c.no }" id="title-a">${c.title}</a></div>
            <div class="td">${ c.nick }</div>
            <div class="td">${ c.enrollDate }</div>
            <div class="td">${ c.hit }</div>
		</c:forEach>
            

		<c:if test="${ loginMember != null }">
            <div id="main-bot">
                <a href="/el/emp-comm/write" class="btn btn-light" id="write">작성하기</a>
            </div>
		</c:if>	

             <div id="page-area" class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
	 				<div id="page-area2" class="btn-group me-2" role="group" aria-label="First group">
	                
		                <c:if test="${page.startPage != 1}">
							<a href="${page.startPage - 1}" class="btn btn-outline-secondary" id="a1"><</a>
						</c:if>
			            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<c:if test="${page.currentPage != i and i <= page.lastPage}">
								<a href="/el/emp-comm/list/${i}" class="btn btn-outline-secondary" id="a1">${i}</a>
							</c:if>
							<c:if test="${page.currentPage == i and i <= page.lastPage}">
								<a href="/el/emp-comm/list/${i}" class="btn btn-outline-secondary" id="a1">${i}</a>
							</c:if>
						</c:forEach>    
			            <c:if test="${page.endPage < page.lastPage}">
							<a href="${page.endPage + 1}" class="btn btn-outline-secondary" id="a1">></a>
						</c:if>    
					 </div>
				</div>
            </div>

            <div id="searchBar">
	                <select name="spell" id="search">
	                    <option value="title">제목</option>
	                    <option value="content">내용</option>
	                </select>
	                <input type="text" name="searchbar" id="search2" placeholder="Search" autocomplete="off" />
	                <button type="submit" class="search-button">
	                    <span class="material-symbols-outlined" id="dodbogi">search</span>
	                </button>
            </div>

        </div>

    </div>
    
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>