<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/el/resources/css/member/pw_find.css" rel="stylesheet" type="text/css">
</head>
<body>
    <br><br><br><br><br>
    <hr>
    <div id="contain">
        <!-- <div id="top-pw_find"> -->
            <div>
                <div class="top-pw_find"><img id="img-logo" src="/el/resources/img/logo/el.png" alt=""></div>
            </div>

            <div id="wrap-pw_find">
                
                <form action="" id="pw_find-form">
                <h3>비밀번호 찾기</h3>    

                <h4><label for="">아이디</label></h4>
                <span class="pw_find-box">
                    <input type="text" name="memberId">
                </span>       
                <h4><label for="">휴대폰 번호</label></h4>
                <span class="pw_find-box">
                    <input type="tel" name="memberTel">
                </span>     
                <h4><label for="">이메일</label></h4>
                <span class="pw_find-box">
                    <input type="email" name="memberEmail">
                </span>
                <div id="btn-pw_find">
                    <button type="button" id="btnJoin">
                        <div id="text-pw_find">비밀번호 찾기</div>
                    </button>
                </div>
                </form>
                
                
            </div>

    </div>

</body>
</html>