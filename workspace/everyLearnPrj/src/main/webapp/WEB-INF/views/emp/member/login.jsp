<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/emp/member/login.css">
</head>
<body>

	<div class="container">
        <section class="left">
            <div class="logo">
                <img src="/el/resources/img/emp/login.svg" alt="">
            </div>
        </section>
        <section class="right">
            <div class="right-wrapper">
                    <h1>로그인</h1>
                <form class="login-form">
                    <div class="email-id">
                        <p>아이디(이메일)</p>
                    </div>
                    <div class="id-input">
                        <input type="text" name="email" id="email">
                    </div>
                    <div class="input-id">
                        <span>아이디를 입력해 주세요.</span>
                    </div>
                    <div class="email-pwd">
                        <p>비밀번호</p>
                    </div>
                    <div class="pwd-input">
                        <input type="password" name="password" id="password">
                    </div>
                    <div class="input-id">
                        <span>비밀번호를 입력해 주세요.</span>
                    </div>
                    <input type="button" value="로그인">
                    <div class="choose">
                        <a href="">비밀번호 재설정</a>
                        <a href="">회원가입</a>
                    </div>
                </form>
            </div>
        </section>
    </div>

</body>
</html>