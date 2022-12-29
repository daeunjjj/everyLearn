<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<link rel="stylesheet" href="/el/resources/css/faq/write.css">
<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">

<!-- 파비콘 -->
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>

<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>자주 묻는 질문</h1>

            <div id="line"></div>

            <div class="main-wrap">

                <form action="" method="post" id="write-fr">
                    <br>
                    <div id="category">
                        <select name="category" id="category-btn">
                            <option value="employment">개인 회원</option>
                            <option value="changeJobs">일반 회원</option>
                        </select>
                    </div>
                    <br>
                    <div id="title"><input type="text" name="title" required placeholder="제목"></div>
                    <div id="content"><textarea name="content" required placeholder="내용"></textarea></div>
                    <div id="write"><button type="submit" class="btn btn-light" id="submit-btn">수정하기</button></div>
                </form>		

			</div>

        </main>

    </div>

</body>
</html>