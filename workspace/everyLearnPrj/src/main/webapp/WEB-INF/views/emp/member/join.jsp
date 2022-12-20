<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/emp/member/join.css">
</head>
<body>

	<div class="container">
		<header class="header">
			<div class="header-wrapper">
				<h1>
					<img src="/el/resources/img/logo/logo.svg" alt="">EveryLearn
				</h1>
			</div>
		</header>
		<main class="main">
			<div class="content">
				<h2 class="title">기업 회원가입</h2>
				<form action="/el/emp/join" method="post" class="login-form">
					<div class="wrapper">
						<div class="join-title">
							<p>아이디(이메일)</p>
						</div>
						<input type="text" name="id" id="id"
							placeholder="everylearn@everylearn.com" class="input">
						<!-- <div class="input-id">
                            <span class="essential">아이디를 입력해 주세요.</span>
                        </div> -->
					</div>
					<div class="wrapper">
						<div class="join-title">
							<p>비밀번호</p>
						</div>
						<input type="password" placeholder="•••••••••••" name="pwd"
							id="pwd" class="input">
						<!-- 눈표시 -->
						<!-- <div class="input-id">
                            <span>비밀번호를 입력해 주세요.</span>
                        </div> -->
					</div>
					<div class="wrapper">
						<div class="name-top">
							<div class="join-title">
								<p>이름</p>
							</div>
							<input type="text" name="name" id="name" placeholder="홍길동"
								class="input">
						</div>
					</div>
					<div class="wrapper">
						<div class="join-title">
							<p>소속</p>
						</div>
						<input type="text" name="team" id="team" placeholder="인사팀"
							class="input">
					</div>
					<div class="wrapper">
						<div class="join-title">
							<p>휴대폰 번호</p>
						</div>
						<input type="text" name="phone" id="phone"
							placeholder="01012345678" class="input">
					</div>
					<div>
						<div class="choose">
							<label><input type="checkbox" name="all" id="all">전체</label>
						</div>
						<div class="line"></div>
						<div class="choose">
							<label><input type="checkbox" name="consent" id="consent">[필수]이용약관
								동의</label>
						</div>
						<div class="choose">
							<label><input type="checkbox" name="consent" id="consent">[필수]개인정보
								수집 및 이용 동의</label>
						</div>
						<div class="choose">
							<label><input type="checkbox" name="consent" id="consent">[선택]마케팅
								수신 동의</label>
						</div>
					</div>
					<button type="submit" class="btn" disabled>로그인</button>
				</form>
				<div class="login">
					<span>이미 계정이 있으신가요?</span> <a href="">로그인</a>
				</div>
			</div>
		</main>
		<footer class="footer">
			<p class="footer-p">©EveryLearn.All rights reserved.</p>
		</footer>
	</div>

</body>
</html>