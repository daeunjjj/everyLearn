<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="stylesheet" href="/el/resources/css/emp/member/reset/pwd.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>
  <div class="container">
    <div class="logo">
      <img src="/el/resources/img/logo/logo.svg">
    </div>
    <div class="reset-pwd">
      <header class="header">
        <h1>비밀번호 재설정</h1>
      </header>
      <form action="">
        <div class="reset">
          <div class="title">
            <p>아이디(이메일)</p>
          </div>
          <input type="text" name="id" id="id"
            placeholder="everylearn@everylearn.com" class="input" oninput="activeBtn();" onblur="validateId();">
          <div id="input-id" class="x-icon" style="display: none;">
            <div><svg width="12" height="12" fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.686 2.686a.635.635 0 0 1 .897 0L8 7.103l4.417-4.417a.635.635 0 0 1 .897.897L8.897 8l4.417 4.417a.635.635 0 1 1-.897.897L8 8.897l-4.417 4.417a.635.635 0 1 1-.897-.897L7.103 8 2.686 3.583a.635.635 0 0 1 0-.897z" fill="#e50000"></path></svg></div>
            <span class="essential">아이디를 입력해 주세요.</span>
          </div>
        </div>
        <button class="btn" disabled>재설정</button>
      </form>
      <div class="choose">
        <a href="el/corp/login">로그인</a>
        <div class="div"></div>
        <a href="/el/corp/join">기업 회원가입</a>
      </div>
    </div>

  </div>

</body>
</html>