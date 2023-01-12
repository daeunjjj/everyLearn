<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<link rel="stylesheet" href="/el/resources/css/qna/list.css">
<link rel="stylesheet" href="/el/resources/css/emp-comm/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">

</head>
<body>

<main>
<%@ include file="/WEB-INF/views/notice/notice-header.jsp" %>
    <div class="banner">
        <span>everyLearn Q&A</span>
    </div>


    <div class="container">
        <div class="list">

            <div class="th">번호</div>
            <div class="th">카테고리</div>
            <div class="th">제목</div>
            <div class="th">작성자</div>
            <div class="th">작성일</div>
            <div class="th">상태</div>


		<c:forEach items="${list}" var="c">
			<div class="td" id="no">${ c.no }</div>
            <div class="td" id="category">${ c.category }</div>
            
            <div class="td">
           	<c:if test="${ c.mno == loginMember.memberNo }">
            	<a href="/el/qna/detail?no=${ c.no }" id="title-a">${c.title}</a>
            	<span class="material-symbols-outlined">lock</span>
            </c:if>
            
            <c:if test="${ loginAdmin.getNo() != null }">
            	<a href="/el/qna/detail?no=${ c.no }" id="title-a">${c.title}</a>
            </c:if>
            
            <c:if test="${ c.mno != loginMember.getMemberNo() && loginAdmin.getNo() == null }">
            	작성자와 관리자만 볼 수 있는 글입니다.
              	<span class="material-symbols-outlined">lock</span>
            </c:if>
         
            </div>
            
            <div class="td" id="nick" name="nick">${ c.nick }</div>
            <div class="td" id="enrollDate" name="enrollDate">${ fn:substring(c.enrollDate,0,8) }</div>
            <c:if test="${ c.answerYn eq 'N' }">
            	<div class="td" id="answerNo" name="answerYn">답변 중</div>
            </c:if>
            
            <c:if test="${ c.answerYn eq 'Y' }">
            	<div class="td" id="answerYes" name="answerYn">답변 완료</div>
            </c:if>
		
		</c:forEach>

<!-- 
			<div class="td" id="no">15</div>
            <div class="td">결제</div>
            <div class="td" id="title">
            	저.. 수료 가능할까요?
              <span class="material-symbols-outlined">lock</span>
            </div>
            <div class="td" id="nick">nick01</div>
            <div class="td" id="date">23.01.13</div>
            <div class="td" id="status1">답변 중</div>         

			<div class="td" id="no">14</div>
            <div class="td">결제</div>
            <div class="td" id="title">
            	제목입니다
              <span class="material-symbols-outlined">lock</span>
            </div>
            <div class="td" id="nick">nick03</div>
            <div class="td" id="date">22.12.11</div>
            <div class="td" id="status1">답변 중</div>	


            <div class="td" id="no">11</div>
            <div class="td">결제</div>
            <div class="td" id="title">
            	제목입니다
              <span class="material-symbols-outlined">lock</span>
            </div>
            <div class="td" id="nick">nick9</div>
            <div class="td" id="date">22.12.11</div>
            <div class="td" id="status1">답변 중</div>
      

            <div class="td" id="no">10</div>
            <div class="td">결제</div>
            <div class="td" id="title">
            <a href="/el/qna/detail" id="q">구ㅡㅇ금합니다</a>
            <span class="material-symbols-outlined">lock</span></div>
            <div class="td" id="nick">nick01</div>
            <div class="td" id="date">22.12.11</div>
            <div class="td" id="status">답변완료</div>

            <div class="td" id="no">9</div>
            <div class="td">결제</div>
            <div class="td" id="title">제목입니다
            <span class="material-symbols-outlined">lock</span></div>
            <div class="td" id="nick">nick01</div>
            <div class="td" id="date">22.12.11</div>
            <div class="td" id="status">답변완료</div>
 -->
            
		<c:if test="${ loginMember != null }">
            <div id="main-bot">
                <a href="/el/qna/memberWrite" class="btn btn-light" id="write">작성하기</a>
            </div>
		</c:if>	

             <div id="page-area" class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
	 				<div id="page-area2" class="btn-group me-2" role="group" aria-label="First group">
	                
		                <c:if test="${page.startPage != 1}">
							<a href="${page.startPage - 1}" class="btn btn-outline-secondary" id="a1"><</a>
						</c:if>
			            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<c:if test="${page.currentPage != i and i <= page.lastPage}">
								<a href="/el/qna/list/${i}" class="btn btn-outline-secondary" id="a1">${i}</a>
							</c:if>
							<c:if test="${page.currentPage == i and i <= page.lastPage}">
								<a href="/el/qna/list/${i}" class="btn btn-outline-secondary" id="a1">${i}</a>
							</c:if>
						</c:forEach>    
			            <c:if test="${page.endPage < page.lastPage}">
							<a href="${page.endPage + 1}" class="btn btn-outline-secondary" id="a1">></a>
						</c:if>    
					 </div>
				</div>
            </div>

        


    </div>
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>   
</main>



</body>
</html>