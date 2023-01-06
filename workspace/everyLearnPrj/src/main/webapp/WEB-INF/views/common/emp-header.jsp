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
						<input type="text" class="click-search"> <span
							class="searchIcon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg></span>
					</div>
				</div>
				<div class="member">
					<a href="/el/member/login?type=emp" class="login">로그인</a><a href="/el/member/join" class="join">회원가입</a>
				</div>
			</div>
		</nav>
	</header>


</body>