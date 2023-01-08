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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="/el/resources/css/qna/adminWrite.css">
<link rel="stylesheet" href="/el/resources/css/emp-commu/common.css">
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>QNA</h1>

            <div id="line"></div>

            <div class="main-wrap">

                <form action="/el/qna/memberWrite" method="post" id="write-fr" enctype="multipart/form-data">
                	<br>
                    <div id="category">
                        <select name="category" id="category-btn">
                            <option value="1">강의</option>
                            <option value="2">결제</option>
                            <option value="3">채용</option>
                            <option value="4">기타</option>
                        </select>
                    </div>
                
                    </div>
                    <div id="title"><input type="text" name="title" required placeholder="제목"></div>
                    <div id="content"><textarea name="content" required placeholder="내용"></textarea></div>
                    <div id="file"><input class="form-control form-control-sm" id="input_file" multiple="multiple" type="file" name="f"></div>
                    <div id="write"><button type="submit" class="btn btn-light" id="submit-btn">작성하기</button></div>
                </form>		

			</div>

        </main>

    </div>



</body>
</html>