<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<link rel="stylesheet" href="/el/resources/css/notice/write.css">
<link rel="stylesheet" href="/el/resources/css/emp-comm/common.css">
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">

<!-- 파비콘 -->
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>


<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>공지사항</h1>

            <div id="line"></div>

            <div class="main-wrap">

                <form method="post" id="write-fr" enctype="multipart/form-data">
                    </div>
                    <div id="title"><input type="text" name="title" required value="${ n.title }"></div>
                    <div id="content"><textarea name="content" required>${ n.content }</textarea></div>
                    <div id="file"><input class="form-control form-control-sm" id="formFileSm" type="file" name="thumbFile" value=" ${ n.thumbFile } "></div>
                    <div id="write"><button type="submit" class="btn btn-light" id="submit-btn">수정하기</button></div>
                </form>		

			</div>

        </main>

    </div>

</body>
</html>