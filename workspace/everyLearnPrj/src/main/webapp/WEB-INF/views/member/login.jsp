<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/el/resources/css/member/login.css" rel="stylesheet" type="text/css">
</head>
<body>
    <br><br><br><br><br>
    <hr>
    <div id="contain">
        <!-- <div id="top-join"> -->
            <div>
                <div class="top-join"><img id="img-logo" src="/el/resources/img/logo/el.png" alt=""></div>
            </div>

            <div id="wrap-join">
                
                <form action="" id="join-form">

                <h4><label for="">아이디</label></h4>
                <span class="join-box">
                    <input type="text" name="memberId">
                </span>            
                <h4><label for="">비밀번호</label></h4>
                <span class="join-box">
                    <input type="password" name="memberPwd1">
                </span>
                <div id="btn-join">
                    <button type="button" id="btnJoin">
                        <div id="text-join">로그인</div>
                    </button>
                </div>
                </form>
                
                
            </div>
            <div id="find">
                <a href="">아이디 찾기</a> | <a href="">비밀번호 찾기</a> | <a href="">회원가입</a>
            </div>
    </div>

</body>
</html>