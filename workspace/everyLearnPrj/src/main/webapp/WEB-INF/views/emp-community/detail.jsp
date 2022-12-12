<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

 
<link rel="stylesheet" href="/el/resources/css/emp-community/detail.css">
<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	
 	<main>
        <div class="container">
            <div class="detailBar">
                <div id="category">취업준비</div>
                <div id="btn">
                    <button class="btn btn-outline-secondary me-md-2" type="button">목록</button>
                    <button class="btn btn-outline-secondary me-md-2" type="button">수정</button>
                    <button class="btn btn-outline-secondary me-md-2" type="button">삭제</button>
                </div>
            </div>
            <div class="title"><span id="title">제목입니다</span></div>
            <div class="info"><span id="nick">취준생   |   22.11.29    |   11</span></div>
            <div class="content">
		                어쩌구 저쩌구 내용 쓰는 칸
		        <br>
		                어쩌구 저쩌구 내용 쓰는 칸
		        <br>
		                어쩌구 저쩌구 내용 쓰는 칸
            </div>
            <div class="etc">
                <span class="material-symbols-outlined" id="favorite">favorite</span>
                <span id="number">0</span>

                <span class="material-symbols-outlined" id="more">more_horiz</span>

            </div>
            <div class="comment">comment</div>
        </div>
    </main>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>