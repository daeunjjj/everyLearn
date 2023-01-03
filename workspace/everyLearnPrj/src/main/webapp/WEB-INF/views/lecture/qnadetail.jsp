<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/lecture/qnaDetail.css" />
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
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
		<div id="qnawrap">
		<div class="write-top">
			<div id="qnatop">질문과답변</div>
		</div>
		<div class="written-wrap">
			<div id="title-top">
				<div id="title-wr">질문이 있어요 질문질묹질문</div>
				<div id="nick-wr">닉네임</div>
				<div id="date-wr">작성일자</div>
			</div>
			
			<div id="content-wrap">
				<div id="buttons">
					<div><button id="btn">수정</button></div>
					<div><button id="btn">삭제</button></div>
				</div>
				<div id="content-wr">내용~~~~~~~~~~~~~</div>
				
			</div>

			<div class="comment-wrap">
				<div class="comment-wr">
					<div id="comment-content">댓글내용</div>
					<div id="comment-nick">닉네임</div>
					<div id="comment-date">2022.12.10</div>
					<div><button id="btn">수정</button></div>
					<div><button id="btn">삭제</button></div>
				</div>
				<div class="comment-wr">
					<div id="comment-content">댓글내용</div>
					<div id="comment-nick">닉네임</div>
					<div id="comment-date">2022.12.10</div>
					<div><button id="btn">수정</button></div>
					<div><button id="btn">삭제</button></div>
				</div>
				<div class="comment-write">
					<div><textarea id="write-area" placeholder="내용을 입력해주세요."></textarea></div>
					<div id="write-btn"><input type="submit" value="작성" id="btn"></div>
				</div>

			</div>
			
			<div id="list-btn"><a href="/el/lecture/qnalist"><button id="btn">목록</button></a></div>


		</div>
	</div>
	
	</div>
	
	
	
	
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>