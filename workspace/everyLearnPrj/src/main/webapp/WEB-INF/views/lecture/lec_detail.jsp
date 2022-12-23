<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/0c7f523053.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/el/resources/css/lecture/lec_review.css" />
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main id="container">
	<div class="wrap">
        <div class= "lec-intro">
            <div id="lec-pic"><img src="/el/resources/img/lecture/lecpic2.png"></div>
            <div id="lec-int">
                <div id="lec-cate">${lvo.category }</div>
                <div id="lec-name">${lvo.className}</div>
                <div id="lec-stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>(4.9 / 5.0)</div>
                <div id="lec-recom">이 강의를 ${lvo.recomm }명이 조회했습니다!</div>
                <div id="lec-teacher"><i class="fa-regular fa-user"></i>${lvo.teacherNo }</div>
            </div>
        </div>
        <div class= "navi">
            <div><a href="/el/lecture/detail?bno=${lvo.no }">강의소개</a></div>
            <div><a href="/el/lecture/detail/review?bno=${lvo.no }&pno=1">수강평</a></div>
        </div>
        <div class = "lec-main">
            <div id="lec-content">
            	
            	${lvo.classContent}
            </div>
            <div id="lec-payment">
                <div id="pay-wrap">
                    <div id="pay-price">${lvo.price} 원</div>
                    <div id="pay-zzim"><i class="fa-regular fa-heart fa-2x"></i></div>
                    <div id="pay-cart">장바구니에 담기</div>
                    <div id="pay-real">결제하기</div>
                </div>
            </div>
        </div>

    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </main>
</body>
</html>