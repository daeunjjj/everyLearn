<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 아이디 찾기</title>
<link rel="stylesheet" href="/el/resources/css/admin/find/result/id.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
</head>
<body>
    <div class="container">
        <div class="main">
            <div class="logo-wrap">
                <img src="/el/resources/img/admin/logo2.png" alt="로고" width="100%" height="100%">
            </div>
            <div>
                <div class="find-wrap">
                    <div class="title">
                        <h1>아이디(이메일) 찾기</h1>
                        <p>인증한 휴대폰 번호로 가입된 계정입니다.</p>
                    </div>
                    <div class="result-wrap">
						<c:if test="${empty voList }">
							<div>가입하신 정보가 없습니다.</div>
						</c:if>
						<c:forEach items="${voList}" var="list">
							<h3>아이디(이메일)</h3>
	                        <div>${list.id }</div>
	                        <span>가입일 : ${list.enrollDate}</span>
						</c:forEach>
                    </div>
                    <button onclick="location.href='/el/admin/login'">로그인</button>
                </div>
            </div>

        </div>
    </div>
</body>
</html>