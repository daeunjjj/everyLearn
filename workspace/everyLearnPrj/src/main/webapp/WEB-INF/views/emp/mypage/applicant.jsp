<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="stylesheet" href="/el/resources/css/emp/mypage/applicant.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>
  <div class="container">
    <%@ include file="/WEB-INF/views/emp/mypage/navbar.jsp"%>
    <div class="content">
        <div class="table-wrapper">
            <table class="list">
                <thead>
                    <tr>
                        <th width="10%">No</th>
                        <th width="50%">공고 제목</th>
                        <th width="20%">지원자 수</th>
                        <th width="20%">채용 상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>java개발자 모집</td>
                        <td>5명</td>
                        <td>채용중</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>java개발자 모집</td>
                        <td>2명</td>
                        <td>채용 마감</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>java개발자 모집</td>
                        <td>7명</td>
                        <td>채용 마감</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
       
    </div>

</body>
</html>