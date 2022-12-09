<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 :: 관리자</title>
<link rel="stylesheet" href="/el/resources/css/admin/login.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
</head>
<body>
	<div class="container">
        <div class="main">
            <div class="logo-wrap">
                <img src="/el/resources/img/admin/logo2.png" alt="로고" width="300" height="300">
            </div>
            <div class="login-wrap">
                <form action="" method="post">
                    <div class="input-area">
                        <input type="text" name="id" placeholder="아이디(메일)를 입력해주세요.">
                    </div>
                    <div class="input-area">
                        <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
                    </div>
                    <div id="find-area">
                        <a href="">아이디 찾기</a>
                        <span> | </span>
                        <a href="">비밀번호 찾기</a>
                    </div>
                    <div class="btn">
                        <input type="submit" value="관리자 로그인">
                    </div>
                <!--<div class="btn">
                        <button>
                            <span>카카오 로그인</span>
                        </button>
                    </div> -->
                </form>
            </div>
        </div>
    </div>
</body>
</html>