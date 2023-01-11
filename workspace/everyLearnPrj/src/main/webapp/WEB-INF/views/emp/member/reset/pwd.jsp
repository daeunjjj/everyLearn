<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="stylesheet" href="/el/resources/css/emp/member/reset/pwd.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>
  <div class="container">
    <div class="logo">
      <a href="/el/emp/main">
        <img src="/el/resources/img/logo/logo.svg">
      </a>
    </div>
    <div class="reset-pwd">
      <header class="header">
        <h1>비밀번호 재설정</h1>
      </header>
      <form action="/el/corp/send-mail" method="POST" onsubmit="return sendMail(this);">
        <div class="reset">
          <div class="title">
            <p>아이디(이메일)</p>
          </div>
          <input type="text" name="id" id="id"
            placeholder="everylearn@everylearn.com" class="input" onblur="checkId();">
            <div id="input-id" class="x-icon" style="display: none;">
              <div><img src="/el/resources/img/emp/v-icon.svg" alt=""></div>
							<span class="okId">아이디를 입력해 주세요.</span>
            </div>
						<div id="use-id" class="x-icon" style="display: none;">
              <div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
							<span class="essential">사용가능한 아이디입니다.</span>
            </div>
        </div>
        <button class="btn" disabled>비밀번호 재설정 메일 보내기</button>
      </form>
      <div class="choose">
        <a href="el/corp/login">로그인</a>
        <div class="div"></div>
        <a href="/el/corp/join">기업 회원가입</a>
      </div>
    </div>

  </div>

<script src="/el/resources/js/emp/pwd.js"></script>

</body>
</html>