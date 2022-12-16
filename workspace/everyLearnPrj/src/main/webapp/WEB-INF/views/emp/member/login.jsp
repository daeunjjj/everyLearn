<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/emp/member/login.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
</head>
<body>

	<div class="container">
		<div class="wrapper">
			<section class="left">
				<div class="logo">
					<img src="/el/resources/img/emp/login.png" alt="emp-img">
				</div>
			</section>
			<section class="right">
				<div class="right-wrapper">
					<h1 class="title">로그인</h1>
					<form class="login-form">
						<div class="id-wrapper">
							<div class="login-title">
								<p>아이디(이메일)</p>
							</div>
							<input type="text" name="email" id="email"
								placeholder="everylearn@everylearn.com" class="id">
							<!-- <div class="input-id">
                                <span class="essential">아이디를 입력해 주세요.</span>
                            </div> -->
						</div>
						<div class="pwd-wrapper">
							<div class="login-title">
								<p>비밀번호</p>
							</div>
							<input type="password" placeholder="•••••••••••" name="password"
								id="password" class="password">
							<!-- 눈표시 -->
							<!-- <div class="input-id">
                                <span>비밀번호를 입력해 주세요.</span>
                            </div> -->
						</div>
						<button type="submit" class="btn" disabled>로그인</button>
					</form>
					<div class="choose">
						<a href="">비밀번호 재설정</a>
						<div class="div"></div>
						<a href="">회원가입</a>
					</div>
				</div>
			</section>
		</div>
		<footer>
			<p class="footer">©EveryLearn.All rights reserved.</p>
		</footer>
	</div>

</body>
</html>