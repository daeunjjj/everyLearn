<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/common/header.css">
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
					<a href="">강의</a> <a href="/el/class/qna">커뮤니티</a> <a href="">에브리런</a> <a
						href="">이벤트</a>
				</div>
				<div class="search-wrapper">
					<div class="search">
						<input type="text" class="click-search"> <span
							class="searchIcon"><i class="bi-search"></i></span>
					</div>
				</div>

				<c:if test="${loginMember == null}">
					<div class="member">
						<a href="/el/member/login" class="login">로그인</a> <a href="/el/member/join" class="join">회원가입</a>
					</div>
				</c:if>

				<c:if test="${loginMember != null}">
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

				</c:if>
				

		</nav>
	</header>

</body>
</html>