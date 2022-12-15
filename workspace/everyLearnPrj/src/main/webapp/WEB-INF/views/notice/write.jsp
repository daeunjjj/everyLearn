<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<link rel="stylesheet" href="/el/resources/css/notice/write.css">
<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>공지사항</h1>

            <div id="line"></div>

            <div class="main-wrap">

                <form action="" method="post" id="write-fr">
                    </div>
                    <div id="title"><input type="text" name="title" required placeholder="제목"></div>
                    <div id="content"><textarea name="content" required placeholder="내용"></textarea></div>
                    <div id="file"><input class="form-control form-control-sm" id="formFileSm" type="file" name="f"></div>
                    <div id="write"><button type="submit" class="btn btn-light" id="submit-btn">작성하기</button></div>
                </form>		

			</div>

        </main>

    </div>

</body>
</html>