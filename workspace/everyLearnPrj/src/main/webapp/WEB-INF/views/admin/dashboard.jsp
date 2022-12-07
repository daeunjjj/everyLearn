<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/dashboard.css">
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
                    <div class="todo-items">
                        <div>강사신청</div>
                        <span>0</span>
                    </div>
                    <div class="todo-items">
                        <div>기업신청</div>
                        <span>0</span>
                    </div>
                    <div class="todo-items">
                        <div>강의신청</div>
                        <span>0</span>
                    </div>
                    <div class="todo-items">
                        <div>신고글</div>
                        <span>0</span>
                    </div>
                    <div class="todo-items">
                        <div>결제취소</div>
                        <span>0</span>
                    </div>
                    <div class="todo-items">
                        <div>문의</div>
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