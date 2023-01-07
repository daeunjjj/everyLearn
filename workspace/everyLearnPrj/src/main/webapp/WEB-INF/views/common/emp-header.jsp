<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/common/header.css">
<script>
	(function() {
    var link = document.createElement('link');
    link.type = 'image/x-icon';
    link.rel = 'shortcut icon';
    link.href = '/el/resources/img/logo/favicon-16x16.png';
    document.getElementsByTagName('head')[0].appendChild(link);
	}());
</script>
</head>
<body>


	<header id="header">
		<div class="container-wrapper">
			<div id="container-top">
				<ul class="page">
					<li class="choose-tap"><a href="/el/main">강의</a></li>
					<li><a href="/el/emp/main">채용</a></li>
				</ul>
				<ul class="teacher">
					<li><a href="/el/corp/mypage">기업서비스</a></li>
				</ul>
			</div>
		</div>
		<nav id="navbar">
			<div class="logoTop">
				<a href="/el/emp/main"><img src="/el/resources/img/logo/logo.svg" alt="로고" class="el-logo"></a>
			</div>
			<div id="nav-container">
				<div class="nav-list">
					<a href="/el/emp/job-post">채용공고</a><a href="/el/emp/resume">이력서</a><a href="">커뮤니티</a>
				</div>
				<div class="search-wrapper">
					<div class="search">
						<form action="/el/emp/job-post/search" method="GET">
							<div class="search-btn-wrapper">
								<input type="text" class="click-search" name="keyword"><button type="submit" class="search-btn"><img src="/el/resources/img/emp/search.svg" alt=""></button>
							</div>
						</form>
					</div>
				</div>

				<c:if test="${loginMember == null}">
					<div class="member">
						<a href="/el/member/login?type=emp" class="login">로그인</a> <a href="/el/member/join" class="join">회원가입</a>
					</div>
				</c:if>

				<c:choose>

				<c:when test="${loginMember != null }">

					<!--**회원 로그인 후 -->
					<div class="member">
						<div class="dropdown">
								<div class="drop" id="mem-wrap"><img id="member-stu" src="/el/resources/img/member/stu.png" alt=""><a href="#" id="memName">${loginMember.memberNick }님</a></div>
								<span class="dropbtn_icon"></span>
								
							<div class="dropdown-content">
								<a href="/el/member/alert">알림</a>
								<a href="/el/member/memberStudy">내 강의</a>
								<a href="/el/member/writeList">작성글</a>
								<a href="/el/member/logout">로그아웃</a>
							</div>
						</div>
						
						<img id="cartimg" src="/el/resources/img/member/cartimg.png" alt="">
						<img id="memberimg" src="/el/resources/img/member/memberimg.png" alt="" onclick="location.href='/el/member/alert'">

					</div>
				</c:when>
			<%-- 	 	<c:when test="${loginMember != null && loginMember.teaStatusYnNo == 1 }">
					<!-- 강사로그인 후 -->
					<div class="member">
						<div class="dropdown">
								<div class="drop" id="mem-wrap"><img id="member-tea" src="/el/resources/img/member/tea.png" alt=""><a href="#" id="memName">에브리님</a></div>
								<span class="dropbtn_icon"></span>
								
							<div class="dropdown-content">
								<a href="/el/member/alert">알림</a>
								<a href="">내 강의</a>
								<a href="/el/member/writeList">작성글</a>
								<a href="/el/member/logout">로그아웃</a>
							</div>
						</div>
						
						<img id="cartimg" src="/el/resources/img/member/teacher.png" alt="" onclick="/el/teacher/detail">
						<img id="memberimg" src="/el/resources/img/member/memberimg.png" alt="" onclick="location.href='/el/member/alert'">


					</div>

				</c:when>	 --%>

				</c:choose>
	
		</nav>
	</header>


</body>