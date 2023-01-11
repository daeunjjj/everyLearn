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
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main id="container">
	<div class="wrap">
		
        <div class= "lec-intro">
            <div id="lec-pic"><img src="/el/resources/upload/${lvo.thumb}" width="500px" height="250px"></a></div>
            <div id="lec-int">
                <div id="lec-cate">${lvo.category }</div>
                <div id="lec-name">${lvo.className}</div>
                <div id="lec-stars">
				
				<!-- 별점 개수 조절 -->
				<c:choose>
								<c:when test="${lvo.revAvg <= 1.5 }">
								★
								</c:when>
								<c:when test="${lvo.revAvg <= 2.5 }">
								★★
								</c:when>
								<c:when test="${lvo.revAvg <= 3.5 }">
								★★★
								</c:when>
								<c:when test="${lvo.revAvg <= 4.5 }">
								★★★★
								</c:when>
								<c:otherwise>
								★★★★★
								</c:otherwise>
							</c:choose>
				
				( ${lvo.revAvg } / 5.0 )</div>
                <div id="lec-recom">이 강의를 ${lvo.recomm }명이 조회했습니다!</div>
                <div id="lec-teacher"><a id="teacher-detail" href="/el/teacher/detail?teacherNick=${lvo.teacherNo }">${lvo.teacherNo }</a></div>
            </div>
        </div>
        <div class= "navi">
            <div><a href="/el/lecture/detail?bno=${lvo.no }">강의소개</a></div>
            <div><a href="/el/lecture/detail/review?bno=${lvo.no }&pno=1">수강평</a></div>
        </div>
        <div class = "lec-main">
            <div id="lec-content">
            	
            	${lvo.classContent}
            	
            	<br><br><br>
            	
            	<img src="/el/resources/upload/${lvo.logo}" width="700px">
            </div>
            <div id="lec-payment">
                <div id="pay-wrap">
                    <div id="pay-price">${lvo.price} 원</div>
                    
                    <c:choose> 
	                    <c:when test="${checkWish == 0 }"> 
		                    <form action="/el/cart/addWish" method="post">
			                    <input type="hidden" name="classNo" value="${lvo.no }">
			                    <input type="hidden" name="memberNo" value="${loginMember.memberNo }">
		                    	<div id="pay-zzim"><input type="image" src="/el/resources/img/lecture/heart.png"/></div>
		                    </form>
	                  </c:when>
	                  <c:otherwise>
	                  	
	                    	<div id="pay-zzim"><a href="/el/cart/addWish" width="50px" height="50px"><img src="/el/resources/img/lecture/heartred.png" id="whywhy" width="50px" height="50px"/></a></div>
	                   
	                  </c:otherwise>
                    </c:choose>
                    <!--  <div id="pay-zzim"><a href="/el/cart/wish"><i class="fa-regular fa-heart fa-2x"></i></a></div>-->
                    <form action="/el/cart/addCart" method="post">
	                    <input type="hidden" name="classNo" value="${lvo.no }">
	                    <input type="hidden" name="memberNo" value="${loginMember.memberNo }">
	                    
	                <c:choose>
	                	<c:when test="${checkBuy != 0 }">
	                		<div><a href="#"><button type = "button" id="pay-cart">학습하러 가기</button></a></div>
	                	</c:when>
	                	<c:when test="${checkCart != 0 }">
	                		<div><a href="/el/cart/addCart"><button type ="button" id="pay-cart" onclick="checkCart()">장바구니로 이동</button></a></div>
	                	</c:when>
	                	<c:otherwise>
	                    	<div><input id="pay-cart" type="submit" value="장바구니에 담기"></div>
	                	</c:otherwise>
	                </c:choose>
                    </form>
                    
                </div>
            </div>
        </div>

    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
    
    <script>
    function checkCart(){
    	alert('이미 장바구니에 추가된 강의입니다.');
    }
    </script>
    </main>
</body>
</html>