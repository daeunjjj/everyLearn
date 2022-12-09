<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/lecture/qnawrite.css" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	
	<div class="wrap">
		<div class= "lec-intro">
			<div id="lec-pic"><img src="/el/resources/img/lecture/lecpic2.png"></div>
			<div id="lec-int">
			<div id="lec-cate">드로잉</div>
			<div id="lec-name">아이패드로 일상 그리기, 프로크리에이트를 이용한 드로잉 클래스</div>
			<div id="lec-stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>(4.9 / 5.0)</div>
			<div id="lec-recom">이 강의를 775명이 추천합니다!</div>
			<div id="lec-teacher"><i class="fa-regular fa-user"></i>강사이름</div>
			</div>
		</div>
		<div class= "navi">
			<div><a href="/el/lecture/mylist">강의 목차</a></div>
			<div><a href="/el/lecture/detail/review">수강평</a></div>
			<div><a href="/el/lecture/qnalist">질문과답변</a></div>
		</div>

		<div class="write-top">
			<div id="qnatop">질문과답변</div>
		</div>
		<div class="write-wrap">
			<div id="title">제목 <input type="text" name="title"></div>
            <div id="content">내용 <textarea name="content" ></textarea></div>
			<div id="submit-btn"><input type="submit" value="작성"></div>


		</div>
	
	</div>
	
	
	
	
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>