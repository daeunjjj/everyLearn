<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<link rel="stylesheet" href="/el/resources/css/notice/detail.css">
	<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">
    <link rel="stylesheet" href="/el/resources/css/common/reset.css">
    
 	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<main>
<%@ include file="/WEB-INF/views/notice/notice-header.jsp" %>
  
        <div class="banner">
            <span>everyLearn NOTICE!</span>
        </div>

        <div class="container"> 
        
        	<div id="btn">
                <button class="btn btn-outline-secondary me-md-2" type="button">수정</button>
                <button class="btn btn-outline-secondary me-md-2" type="button">삭제</button>
            </div>

            <div class="title"><span id="title">[엄청 중요한 공지] 제목입니다</span></div>
                <div class="info-nick"><span id="nick">관리자   |   22.11.29    |   11</span></div>
                <div class="content">
                            어쩌구 저쩌구 내용 쓰는 칸
                    <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                    <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                            <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                    <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                            <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                    <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                            <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                    <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                            <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                    <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                            <br>
                            어쩌구 저쩌구 내용 쓰는 칸
                    <br>
                            어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸
                            <br> <br> <br> <br>
                            어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸
                            어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸
                            어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸
                            어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸
                            어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸어쩌구 저쩌구 내용 쓰는 칸
                            <br> <br> <br> <br> <br> <br> <br> <br>
                            <br> <br> <br> <br>
                </div>
            </div>

            <div class="back-sticky">
                <button id="back-btn"><span class="material-symbols-outlined">undo</span></button>
            </div>

            <nav class="navbar sticky-bottom bg-light">
                <div class="container-fluid">
                  <a class="navbar-brand" href="#"><span class="material-symbols-outlined">arrow_upward</span></a>      
                </div>
            </nav>

        </div>

    </main>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    


</body>
</html>