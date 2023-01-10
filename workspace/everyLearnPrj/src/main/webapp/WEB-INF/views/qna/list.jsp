<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

            <div class="th" id="no">번호</div>
            <div class="th">카테고리</div>
            <div class="th" id="title">제목</div>
            <div class="th" id="nick">작성자</div>
            <div class="th" id="date">작성일</div>
            <div class="th" id="hit">상태</div>



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



			<div class="td" id="no">13</div>
            <div class="td">결제</div>
            <div class="td" id="title">
            	제목입니다
              <span class="material-symbols-outlined">lock</span>
            </div>
            <div class="td" id="nick">nick02</div>
            <div class="td" id="date">22.12.11</div>
            <div class="td" id="status1">답변 중</div>


			<div class="td" id="no">12</div>
            <div class="td">결제</div>
            <div class="td" id="title">
            	제목입니다
              <span class="material-symbols-outlined">lock</span>
            </div>
            <div class="td" id="nick">nick11</div>
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
            <a href="/el/qna/detail">구ㅡㅇ금합니다</a>
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

            <div class="td" id="no">8</div>
            <div class="td">결제</div>
            <div class="td" id="title">제목입니다
            <span class="material-symbols-outlined">lock</span></div>
            <div class="td" id="nick">nick01</div>
            <div class="td" id="date">22.12.11</div>
            <div class="td" id="status">답변완료</div>

            <div class="td" id="no">7</div>
            <div class="td">결제</div>
            <div class="td" id="title">제목입니다
            <span class="material-symbols-outlined">lock</span></div>
            <div class="td" id="nick">nick01</div>
            <div class="td" id="date">22.12.11</div>
            <div class="td" id="status">답변완료</div>

            <div class="td" id="no">6</div>
            <div class="td">결제</div>
            <div class="td" id="title">제목입니다
            <span class="material-symbols-outlined">lock</span></div>
            <div class="td" id="nick">nick01</div>
            <div class="td" id="date">22.12.11</div>
            <div class="td" id="status">답변완료</div>

            <div id="main-bot">
                <a href="/el/qna/memberWrite" class="btn btn-light" id="write">작성하기</a>
            </div>

            <div id="page-area" class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
                <div id="page-area2" class="btn-group me-2" role="group" aria-label="First group">
                <a href="/#/board/list?p=1" class="btn btn-outline-secondary" id="page-btn"><</a>
                <a href="/#/board/list?p=1" class="btn btn-outline-secondary" id="page-btn">1</a>
                <a href="/#/board/list?p=2" class="btn btn-outline-secondary" id="page-btn">2</a>
                <a href="/#/board/list?p=3" class="btn btn-outline-secondary" id="page-btn">3</a>
                <a href="/#/board/list?p=4" class="btn btn-outline-secondary" id="page-btn">4</a>
                <a href="/#/board/list?p=5" class="btn btn-outline-secondary" id="page-btn">5</a>
                <a href="/#/board/list?p=1" class="btn btn-outline-secondary" id="page-btn">></a>
                </div>
            </div>
        </div>

        


    </div>
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>   
</main>



</body>
</html>