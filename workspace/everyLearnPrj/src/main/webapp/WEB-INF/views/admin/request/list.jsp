<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원기능요청</title>
<link rel="stylesheet" href="/el/resources/css/admin/request/list.css">
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>회원요청</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="cate-area">
                    <a href="">강의</a>
                    <span>|</span>
                    <a href="">기능</a>
                    <span>|</span>
                    <a href="">응원</a>
                </div>
                <div class="title-area">
                    <div class="grid-area">
                        <div>번호</div>
                        <div>작성자</div>
                        <div>요청</div>
                        <div>내용</div>
                        <div>관리</div>
                    </div>
                </div>
                <div class="content-area">
                    <ul class="grid-area">
                        <li>1</li>
                        <li><a href="">user01</a></li>
                        <li>기능</li>
                        <li>평점 기능있으면 좋을 것 같아요.</li>
                        <li>
                            <button>삭제</button>
                        </li>
                    </ul>
                </div>
            </div>
        </main>
    </div>
</body>
</html>