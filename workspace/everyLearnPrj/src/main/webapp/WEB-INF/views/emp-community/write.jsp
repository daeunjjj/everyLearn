<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/emp-community/write.css">
<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<div id="container">
        <form action="" method="post" id="write-fr">
            <div><button type="button" class="btn-close" aria-label="Close" id="reset"></button></div>
            <div id="category">
                <select name="category" id="category-btn">
                    <option value="employment">취업준비</option>
                    <option value="changeJobs">이직준비</option>
                    <option value="honeyTip">꿀&nbsp&nbsp&nbsp&nbsp&nbsp팁</option>
                    <option value="smallTalk">아무&nbsp&nbsp말</option>
                </select>
            </div>
            <div id="title"><input type="text" name="title" required placeholder="제목"></div>
            <div id="content"><textarea name="content" required placeholder="내용"></textarea></div>
            <div id="file"><input class="form-control form-control-sm" id="formFileSm" type="file" name="f"></div>
            <div id="write"><button type="submit" class="btn btn-light" id="submit-btn">작성하기</button></div>
        </form>
    </div>
    
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>