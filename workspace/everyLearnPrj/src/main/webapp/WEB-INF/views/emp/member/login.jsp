<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/emp/member/login.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>

	<div class="container">
		<div class="wrapper">
			<section class="left">
				<div class="logo">
					<a href="/el/emp/main"><img src="/el/resources/img/emp/login.png" alt="emp-img"></a>
				</div>
			</section>
			<section class="right">
				<div class="right-wrapper">
					<h1 class="title">로그인</h1>
					<form action="/el/corp/login" method="POST" class="login-form">
						<div class="id-wrapper">
							<div class="login-title">
								<p>아이디(이메일)</p>
							</div>
							<input type="text" name="id" id="id"
								placeholder="everylearn@everylearn.com" class="id" oninput="activeBtn();" onblur="validateId();">
								<div id="input-id" class="x-icon" style="display: none;">
									<div><svg width="12" height="12" fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.686 2.686a.635.635 0 0 1 .897 0L8 7.103l4.417-4.417a.635.635 0 0 1 .897.897L8.897 8l4.417 4.417a.635.635 0 1 1-.897.897L8 8.897l-4.417 4.417a.635.635 0 1 1-.897-.897L7.103 8 2.686 3.583a.635.635 0 0 1 0-.897z" fill="#e50000"></path></svg></div>
									<span class="essential">아이디를 입력해 주세요.</span>
								</div>
						</div>
						<div class="pwd-wrapper">
							<div class="login-title">
								<p>비밀번호</p>
							</div>
							<input type="password" placeholder="•••••••••••" name="pwd"
								id="pwd" class="password" oninput="activeBtn();" onblur="validatePwd();">
							<!-- 눈표시 -->
							<div id="input-pwd" class="x-icon" style="display: none;">
								<div><svg width="12" height="12" fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.686 2.686a.635.635 0 0 1 .897 0L8 7.103l4.417-4.417a.635.635 0 0 1 .897.897L8.897 8l4.417 4.417a.635.635 0 1 1-.897.897L8 8.897l-4.417 4.417a.635.635 0 1 1-.897-.897L7.103 8 2.686 3.583a.635.635 0 0 1 0-.897z" fill="#e50000"></path></svg></div>
								<span class="essential">비밀번호를 입력해 주세요.</span>
							</div>
						</div>
						<button type="submit" class="btn" id="loginBtn" disabled onclick="loginBtn();">로그인</button>
					</form>
					<div class="choose">
						<a href="">비밀번호 재설정</a>
						<div class="div"></div>
						<a href="/el/corp/join">회원가입</a>
					</div>
				</div>
			</section>
		</div>
		<footer>
			<p class="footer">©EveryLearn.All rights reserved.</p>
		</footer>
	</div>

	<c:if test="${msg != null }">
		<script>
            Swal.fire('아이디(이메일) 또는 비밀번호를 확인해주세요.');
		</script>
	</c:if>

	<script src="/el/resources/js/emp/login.js"></script>
</body>
</html>