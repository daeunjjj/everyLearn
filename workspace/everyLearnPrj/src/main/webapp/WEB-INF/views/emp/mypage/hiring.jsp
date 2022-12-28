<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/emp/mypage/hiring.css">
</head>
<body>
  <div class="container">
    <%@ include file="/WEB-INF/views/emp/mypage/navbar.jsp"%>
    <div class="content">
        <div class="table-wrapper">
            <table class="list">
                <thead>
                    <tr>
                        <th width="5%">No</th>
                        <th width="55%">공고 제목</th>
                        <th width="10%">등록 날짜</th>
                        <th width="10%">채용 기한</th>
                        <th width="10%">채용 상태</th>
                        <th width="10%"></th>
                    </tr>
                </thead>
                <tbody>
               <c:forEach items="${list}" var="vo">
                    <tr>
                        <td>1</td>
                        <td>${vo.title}</td>
                        <td>${vo.enrollDate}</td>
                        <td>${vo.deadline}</td>
                        <td>${vo.status}</td>
                    </tr>
               </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
       
    </div>

</body>
</html>