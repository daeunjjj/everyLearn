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
<link rel="stylesheet" href="/el/resources/css/emp/mypage/applicant.css">
</head>
<body>
  <div class="container">
    <%@ include file="/WEB-INF/views/emp/mypage/navbar.jsp"%>
    <div class="content">
        <div class="title">
            <h1>${ev.title}</h1>
        </div>
        <div class="table-container">
            <div class="table-wrapper">
                <table class="list">
                    <thead>
                        <tr>
                            <th width="10%">No</th>
                            <th width="25%">이름</th>
                            <th width="20%">전화번호</th>
                            <th width="20%">이메일</th>
                            <th width="25%"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="vo">
                            <tr>
                                <td>${vo.no}</td>
                                <td>${vo.name}</td>
                                <td>${vo.phone}</td>
                                <td>${vo.email}</td>
                                <td><a href="/el/emp/applicant?applyNo=${vo.no}"><button>상세보기</button></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
       
    </div>

</body>
</html>