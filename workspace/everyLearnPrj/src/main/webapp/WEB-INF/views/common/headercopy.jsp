<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/common/headercopy.css">
</head>
<body>

	<header id="header">
		<div class="container-wrapper">
			<div id="container-top">
				<ul class="page">
					<li class="choose-tap"><a href="#">강의</a></li>
					<li><a href="#">채용</a></li>
				</ul>
				<ul class="teacher">
					<li><a href="http://127.0.0.1:8888/el/teacher/main">런문가 되기</a></li>
				</ul>
			</div>
		</div>
		<nav id="navbar">
			<div class="logoTop">
				<a href=""><img src="/el/resources/img/logo/logo.svg" alt="로고"></a>
			</div>
			<div id="nav-container">
				<div class="nav-list">
					<a href="">강의</a> <a href="">커뮤니티</a> <a href="">에브리런</a> <a
						href="">이벤트</a>
				</div>
				<div class="search-wrapper">
					<div class="search">
						<input type="text" class="click-search"> <span
							class="searchIcon"><i class="bi-search"></i></span>
					</div>
				</div>

				<!--** 로그인 전 -->

				<div class="member">
					<a href="#" class="login">로그인</a> <a href="#" class="join">회원가입</a>
				</div>

				<!--**회원 로그인 후 -->
 				<div class="member">
					<div class="dropdown">
							<div class="drop" id="mem-wrap"><img id="member-stu" src="/el/resources/img/member/stu.png" alt=""><a href="#" id="memName">에브리님</a></div>
							<span class="dropbtn_icon"></span>
							
						<div class="dropdown-content">
							<a href="#">알림</a>
							<a href="#">내 강의</a>
							<a href="#">작성글</a>
							<a href="#">로그아웃</a>
						</div>
					</div>
					
					<img id="cartimg" src="/el/resources/img/member/cartimg.png" alt="">
					<img id="memberimg" src="/el/resources/img/member/memberimg.png" alt="">

				</div> 

				<!--**강사 로그인 후 -->
				<div class="member">
					<div class="dropdown">
							<div class="drop" id="mem-wrap"><img id="member-tea" src="/el/resources/img/member/tea.png" alt=""><a href="#" id="memName">에브리님</a></div>
							<span class="dropbtn_icon"></span>
							
						<div class="dropdown-content">
							<a href="#">알림</a>
							<a href="#">내 강의</a>
							<a href="#">작성글</a>
							<a href="#">로그아웃</a>
						</div>
					</div>
					
					<img id="cartimg" src="/el/resources/img/member/teacher.png" alt="">
					<img id="memberimg" src="/el/resources/img/member/memberimg.png" alt="">


				</div>

				


			
		</nav>
	</header>

</body>
</html>