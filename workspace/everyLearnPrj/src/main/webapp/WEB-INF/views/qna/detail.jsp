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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<link rel="stylesheet" href="/el/resources/css/qna/detail.css">
<link rel="stylesheet" href="/el/resources/css/emp-comm/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


</head>
<body>

<main>
<%@ include file="/WEB-INF/views/notice/notice-header.jsp" %>

        <div class="banner">
            <span>everyLearn Q&A</span>
        </div>

        <div class="main"> 

            <div id="btn"> <!-- 관리자만 보이는 버튼 -->
            	<c:if test="${ loginAdmin.getNo() != null }">
                	<a href="/el/qna/answerAdminWrite" class="btn btn-outline-secondary me-md-2" type="button" id="btn1">답변</a>
                	<button class="btn btn-outline-secondary me-md-2" type="button" id="btn1">삭제</button>
               	</c:if>
            </div>
			
			<div id="category">${ q.category }</div>
            <div class="title"><span id="title">${ q.title }</span><span class="material-symbols-outlined">lock</span></div>

            <div class="info-nick"><span id="nick">${ q.nick }   |   ${ q.enrollDate }  </span></div>

	            <div class="content">
	            	<img alt="" src="/el/resources/upload/${ q.thumb }">
                   <textarea id="content">${ q.content }</textarea>
	            </div>
          </div>
          
          	<div id="line"></div>
<!-- 관리자 답변 여부 Y 일 때 노출 -->
<c:if test="${ q.answerYn eq 'Y' }">
            <div class="answer-area">   
                <div class="answer" id="answer-title"><span>ㄴ RE : ${ q.title }</span></div>
                <div class="answer" id="answer-info"><span>관리자 | ${ q.enrollDate } | 답변 완료</span></div>
                
           		<div class="answer-content">
           			
           			<img alt="" src="/el/resources/upload/${ q.thumb }">
                   <textarea id="content">${ q.content }</textarea>
           		
           		</div>
            </div>
</c:if>
<!-- ------------------ -->

           <div class="back-sticky">
               <button id="back-btn" onclick="location.href='/el/qna/list' "><span class="material-symbols-outlined">undo</span></button>
           </div>

           <nav class="navbar sticky-bottom bg-light">
               <div class="container-fluid">
               <a class="navbar-brand" href="#"><span class="material-symbols-outlined">arrow_upward</span></a>      
               </div>
           </nav>

        </div>
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>   
    </main>

</body>
</html>