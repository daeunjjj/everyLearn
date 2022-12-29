<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="stylesheet" href="/el/resources/css/emp/mypage/deadLine.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>
  <div class="container">
    <%@ include file="/WEB-INF/views/emp/mypage/navbar.jsp"%>
    <div class="content">
        <div class="title">
            <h1>채용 마감</h1>
        </div>
        <div class="table-container">
            <div class="table-wrapper">
                <table class="list">
                    <thead>
                        <tr>
                            <th width="5%">No</th>
                            <th width="50%">공고 제목</th>
                            <th width="15%">등록 날짜</th>
                            <th width="15%">채용 기한</th>
                            <th width="15%">채용 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="vo">
                        <tr>
                            <td>${vo.no}</td>
                            <td><a href="/el/corp/position?no=${vo.no}">${vo.title}</a></td>
                            <td>${vo.enrollDate}</td>
                            <td>${vo.deadline}</td>
                            <td>${vo.status}</td>
                        </tr>
                   </c:forEach>
                    </tbody>
                </table>
            </div>
            <nav class="page-area">
                <ul>
                <c:if test="${pv.currentPage != 1}">
                    <li>
                        <a id="before" href="/el/corp/deadLine?pno=${pv.currentPage-1}">이전</a>
                    </li>
                </c:if>
                <c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">
                    <li>
                        <a class="numBtn" href="/el/corp/deadLine?pno=${num}">${num}</a>
                    </li>
                </c:forEach>
                <c:if test="${pv.currentPage != pv.maxPage && pv.maxPage != 0}">
                    <li>
                        <a id="after" href="/el/corp/deadLine?pno=${pv.currentPage+1}">다음</a>                       		
                    </li>
                </c:if>
                </ul>
            </nav>
        </div>
    </div>
       
    </div>

</body>
</html>