<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/dashboard.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>대시보드</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <h2>알림</h2>
                <div class="todo-area">
                    <a href="/el/admin/member/teacher/list?pno=1&&category=status" class="todo-items">
                        <div>강사신청</div>
                        <span>${map.teacherRequestCnt}</span>
                    </a>
                    <a href="/el/admin/member/corporate/list?pno=1&category=status_yn&keyword=N" class="todo-items">
                        <div>기업신청</div>
                        <span>${map.corpRequestCnt}</span>
                    </a>
                    <a href="/el/admin/request/list?pno=1&category=check_yn&keyword=N" class="todo-items">
                        <div>요청</div>
                        <span>${map.requestCnt}</span>
                    </a>
                    <a href="/el/admin/report/list?pno=1&category=handle_yn&keyword=N" class="todo-items">
                        <div>신고</div>
                        <span>${map.reportCnt}</span>
                    </a>
                    <div class="todo-items">
                        <div>문의</div>
                        <span>0</span>
                    </div>
                    <div class="todo-items">
                        <div>공지</div>
                        <span>0</span>
                    </div>
                </div>
                <div class="stats-area">
    
                </div>
            </div>
        </main>
    </div>
</body>
</html>