<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원가입 - EveryLearn</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="/el/resources/css/emp/member/join.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

	<div class="container">
		<header class="header">
			<div class="header-wrapper">
				<a href="/el/emp/main" class="img">
					<img src="/el/resources/img/logo/logo.svg">
				</a>
			</div>
		</header>
		<main class="main">
			<div class="content">
				<h2 class="title">기업 회원가입</h2>
				<form action="/el/corp/join" method="POST" class="login-form" onsubmit="return join(this);">
					<div class="wrapper">
						<div class="join-title">
							<p>아이디(이메일)</p>
						</div>
						<input type="text" name="id" id="id"
							placeholder="everylearn@everylearn.com" class="input" oninput="activeBtn();" onblur="validateId();">
						<div id="input-id" class="x-icon" style="display: none;">
							<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
							<span class="essential">아이디를 입력해 주세요.</span>
            </div>
						<div id="use-id" class="x-icon" style="display: none;">
							<div><img src="/el/resources/img/emp/v-icon.svg" alt=""></div>
							<span class="okId">사용가능한 아이디입니다.</span>
            </div>
					</div>
					<div class="wrapper">
						<div class="join-title">
							<p>비밀번호</p>
						</div>
						<input type="password" placeholder="영문/숫자/특수문자 포함 8자리 이상" name="pwd"
							id="pwd" class="input" oninput="activeBtn();" onkeyup="validatePwd();">
						<!-- 눈표시 -->
						<div id="input-pwd" class="x-icon" style="display: none;">
							<div><svg width="12" height="12" fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.686 2.686a.635.635 0 0 1 .897 0L8 7.103l4.417-4.417a.635.635 0 0 1 .897.897L8.897 8l4.417 4.417a.635.635 0 1 1-.897.897L8 8.897l-4.417 4.417a.635.635 0 1 1-.897-.897L7.103 8 2.686 3.583a.635.635 0 0 1 0-.897z" fill="#e50000"></path></svg></div>
							<span class="essential">영문/숫자/특수문자 포함 8자리 이상 입력해주세요.</span>
						</div>
						<div id="use-pwd" class="x-icon" style="display: none;">
							<div><img src="/el/resources/img/emp/v-icon.svg" alt=""></div>
							<span class="okId">사용가능한 비밀번호입니다.</span>
            </div>
					</div>
					<div class="wrapper">
						<div class="join-title">
							<p>비밀번호 확인</p>
						</div>
						<input type="password" placeholder="" name="pwdCheck"
							id="pwdCheck" class="input" oninput="activeBtn();" onkeyup="validateCheck();">
						<!-- 눈표시 -->
						<div id="input-pwdCheck" class="x-icon" style="display: none;">
							<div><svg width="12" height="12" fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.686 2.686a.635.635 0 0 1 .897 0L8 7.103l4.417-4.417a.635.635 0 0 1 .897.897L8.897 8l4.417 4.417a.635.635 0 1 1-.897.897L8 8.897l-4.417 4.417a.635.635 0 1 1-.897-.897L7.103 8 2.686 3.583a.635.635 0 0 1 0-.897z" fill="#e50000"></path></svg></div>
							<span class="essential">비밀번호가 일치하지 않습니다.</span>
						</div>
						<div id="use-pwdCheck" class="x-icon" style="display: none;">
							<div><img src="/el/resources/img/emp/v-icon.svg" alt=""></div>
							<span class="okId">비밀번호가 일치합니다.</span>
            </div>
					</div>
					<div class="wrapper">
						<div class="name-top">
							<div class="join-title">
								<p>이름</p>
							</div>
							<input type="text" name="name" id="name" placeholder="홍길동"
								class="input" oninput="activeBtn();" onblur="validateName();">
								<div id="input-name" class="x-icon" style="display: none;">
									<div><svg width="12" height="12" fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.686 2.686a.635.635 0 0 1 .897 0L8 7.103l4.417-4.417a.635.635 0 0 1 .897.897L8.897 8l4.417 4.417a.635.635 0 1 1-.897.897L8 8.897l-4.417 4.417a.635.635 0 1 1-.897-.897L7.103 8 2.686 3.583a.635.635 0 0 1 0-.897z" fill="#e50000"></path></svg></div>
									<span class="essential">이름을 입력해 주세요.</span>
								</div>
						</div>
					</div>
					<div class="wrapper">
						<div class="join-title">
							<p>회사명</p>
						</div>
						<input type="text" name="companyName" id="companyName" placeholder="에브리런"
							class="input" oninput="activeBtn();" onblur="validateCompanyName();">
							<div id="input-companyName" class="x-icon" style="display: none;">
								<div><svg width="12" height="12" fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.686 2.686a.635.635 0 0 1 .897 0L8 7.103l4.417-4.417a.635.635 0 0 1 .897.897L8.897 8l4.417 4.417a.635.635 0 1 1-.897.897L8 8.897l-4.417 4.417a.635.635 0 1 1-.897-.897L7.103 8 2.686 3.583a.635.635 0 0 1 0-.897z" fill="#e50000"></path></svg></div>
								<span class="essential">회사명을 입력해 주세요.</span>
							</div>
					</div>
					<div class="wrapper">
						<div class="join-title">
							<p>휴대폰 번호</p>
						</div>
						<input type="text" name="phone" id="phone"
							placeholder="01012345678" maxlength="13" class="input" oninput="autoHyphen(this);" onblur="validatePhone();">
							<div id="input-phone" class="x-icon" style="display: none;">
								<div><svg width="12" height="12" fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.686 2.686a.635.635 0 0 1 .897 0L8 7.103l4.417-4.417a.635.635 0 0 1 .897.897L8.897 8l4.417 4.417a.635.635 0 1 1-.897.897L8 8.897l-4.417 4.417a.635.635 0 1 1-.897-.897L7.103 8 2.686 3.583a.635.635 0 0 1 0-.897z" fill="#e50000"></path></svg></div>
								<span class="essential">휴대폰 번호를 입력해 주세요.</span>
							</div>
					</div>
					<div>
						<div class="choose">
							<label><input type="checkbox" name="all" id="all" onchange="checkAll(this);">전체</label>
						</div>
						<div class="line"></div>
						<div class="choose">
							<label><input type="checkbox" name="consent" id="terms" onchange="activeBtn();">[필수]이용약관
								동의</label>
						</div>
						<div class="choose">
							<label><input type="checkbox" name="consent" id="privacy" onchange="activeBtn();">[필수]개인정보
								수집 및 이용 동의</label>
						</div>
						<div class="choose">
							<label><input type="checkbox" name="consent" id="marketing">[선택]마케팅
								수신 동의</label>
						</div>
					</div>
					<button type="submit" class="btn" id="joinBtn" disabled>회원가입</button>
				</form>
				<div class="login">
					<span>이미 계정이 있으신가요?</span> <a href="/el/corp/login">로그인</a>
				</div>
			</div>
		</main>
		<footer class="footer">
			<p class="footer-p">©EveryLearn.All rights reserved.</p>
		</footer>
	</div>
	<script src="/el/resources/js/emp/join.js"></script>
</body>
</html>