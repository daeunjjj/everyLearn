<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<link rel="stylesheet" href="/el/resources/css/notice/list.css">
	<link rel="stylesheet" href="/el/resources/css/notice/common.css">
    <link rel="stylesheet" href="/el/resources/css/common/reset.css">
</head>
<body>

    <main>
        <div class="banner">
            <span>everyLearn NOTICE!</span>
        </div>


        <div class="container">
            <div class="list">
                <div class="td" id="no">11</div>
                <div class="td" id="title">제목입니다</div>
                <div class="td" id="nick">관리자</div>
                <div class="td" id="date">22.12.11</div>
                <div class="td" id="hit">33</div>

                <div class="td" id="no">10</div>
                <div class="td" id="title">제목입니다</div>
                <div class="td" id="nick">관리자</div>
                <div class="td" id="date">22.12.11</div>
                <div class="td" id="hit">33</div>

                <div class="td" id="no">9</div>
                <div class="td" id="title">제목입니다</div>
                <div class="td" id="nick">관리자</div>
                <div class="td" id="date">22.12.11</div>
                <div class="td" id="hit">33</div>

                <div class="td" id="no">8</div>
                <div class="td" id="title">제목입니다</div>
                <div class="td" id="nick">관리자</div>
                <div class="td" id="date">22.12.11</div>
                <div class="td" id="hit">33</div>

                <div class="td" id="no">7</div>
                <div class="td" id="title">제목입니다</div>
                <div class="td" id="nick">관리자</div>
                <div class="td" id="date">22.12.11</div>
                <div class="td" id="hit">33</div>

                <div class="td" id="no">6</div>
                <div class="td" id="title">제목입니다</div>
                <div class="td" id="nick">관리자</div>
                <div class="td" id="date">22.12.11</div>
                <div class="td" id="hit">33</div>

                <div id="main-bot">
                    <a href="/#/board/write" class="btn btn-light" id="write">작성하기</a>
                </div>
    
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

            


        </div>
        
    </main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
</body>
</html>


</body>
</html>