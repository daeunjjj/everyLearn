<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/el/resources/css/class_comm/sidebar.css">
    <script src="https://kit.fontawesome.com/c86765768f.js" crossorigin="anonymous"></script>    
</head>
<body>


    

        <div class="menu">
            <label for="expand-menu">
	            <div>메뉴</div>
            </label>
            <input type="checkbox" id="expand-menu" name="expand-menu">
            <ul>
                <li>
	                <a href="http://127.0.0.1:8888/el/class/qna" class="item">
	                	<div>질문 / 답변</div>
	                </a>
                </li>
                <li>
	                <a href="/el/class/study?orderBy=ENROLL_DATE DESC" class="item">
	                	<div>스터디</div>
	                </a>
                </li>
                <li>
	                <a href="/el/class/free?orderBy=ENROLL_DATE DESC" class="item">
	                	<div>자유게시판</div>
	                </a>
                </li>
                <li>
	                <a href="#" class="item">
	                	<div>블로그</div>
	                </a>
                </li>
            </ul>
        </div>



</body>



</html>