<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="stylesheet" href="/el/resources/css/emp/member/reset/authentication.css">
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
      <form method="POST">
        <div class="reset">
          <div class="title">
            <p>비밀번호</p>
          </div>
          <input type="password" placeholder="영문/숫자/특수문자 포함 8자리 이상" name="pwd"
            id="pwd" class="input" oninput="activeBtn();" onkeyup="validatePwd();">
          <div id="input-pwd" class="x-icon" style="display: none;">
            <div><svg width="12" height="12" fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.686 2.686a.635.635 0 0 1 .897 0L8 7.103l4.417-4.417a.635.635 0 0 1 .897.897L8.897 8l4.417 4.417a.635.635 0 1 1-.897.897L8 8.897l-4.417 4.417a.635.635 0 1 1-.897-.897L7.103 8 2.686 3.583a.635.635 0 0 1 0-.897z" fill="#e50000"></path></svg></div>
            <span class="essential">영문/숫자/특수문자 포함 8자리 이상 입력해주세요.</span>
          </div>
          <div id="use-pwd" class="x-icon" style="display: none;">
            <div><img src="/el/resources/img/emp/v-icon.svg" alt=""></div>
            <span class="okPwd">사용가능한 비밀번호입니다.</span>
          </div>
        </div>
        <div class="reset">
          <div class="title">
            <p>비밀번호 확인</p>
          </div>
          <input type="password" placeholder="" name="pwdCheck"
            id="pwdCheck" class="input" oninput="activeBtn();" onkeyup="validateCheck();">
          <div id="input-pwdCheck" class="x-icon" style="display: none;">
            <div><svg width="12" height="12" fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.686 2.686a.635.635 0 0 1 .897 0L8 7.103l4.417-4.417a.635.635 0 0 1 .897.897L8.897 8l4.417 4.417a.635.635 0 1 1-.897.897L8 8.897l-4.417 4.417a.635.635 0 1 1-.897-.897L7.103 8 2.686 3.583a.635.635 0 0 1 0-.897z" fill="#e50000"></path></svg></div>
            <span class="essential">비밀번호가 일치하지 않습니다.</span>
          </div>
          <div id="use-pwdCheck" class="x-icon" style="display: none;">
            <div><img src="/el/resources/img/emp/v-icon.svg" alt=""></div>
            <span class="okPwd">비밀번호가 일치합니다.</span>
          </div>
        </div>
        <button class="btn" id="resetPwd" disabled>비밀번호 재설정</button>
      </form>
      <div class="choose">
        <a href="el/corp/login">로그인</a>
        <div class="div"></div>
        <a href="/el/corp/join">기업 회원가입</a>
      </div>
    </div>

  </div>

  <script src="/el/resources/js/emp/authentication.js"></script>

</body>
</html>