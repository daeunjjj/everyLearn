<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/member/join.css" rel="stylesheet" type="text/css">
</head>
<body>
    <br><br><br><br><br>
    <div id="contain">
        <!-- <div id="top-join"> -->
            <div>
                <div class="top-join"><img  id="img-logo" src="/el/resources/img/logo/el.png" alt=""></div>
                <div class="top-join"><label for="">에브리런과 함께 성장을 넘어서 지식 공유까지!</label></div>
            </div>

            <div id="wrap-join">
                
                <form action="" id="join-form">

                <h4><label for="">아이디</label></h4>
                <span class="join-box">
                    <input type="text" name="memberId">
                    <button id="double-check">중복확인</button>
                </span>            
                <h4><label for="">비밀번호</label></h4>
                <span class="join-box">
                    <input type="password" name="memberPwd1">
                </span>
                <span>
                    <pre>
    - 영문자(대소문자 구분)/숫자/특수문자 모두 사용
    - 8자~32자(공백 제외)
    - 3개이상 동일한 문자/숫자 사용 불가</pre>
                </span>            
                <h4><label for="">비밀번호 확인</label></h4> 
                <span class="join-box">   
                    <input type="password" name="memberPwd2">
                    
                </span>
                <h4><label for="">이름</label></h4>
                <span class="join-box">
                    <input type="text" name="memberName">
                </span>   
                <h4><label for="">휴대폰 번호</label></h4>
                <span class="join-box" >
                    <input type="tel" name="memberTel" placeholder="숫자만 입력해주세요.">
                </span>   
                <h4><label for="">이메일</label></h4>
                <span class="join-box">
                    <input type="email" name="memberEmail">
                </span>   
                <h4><label for="">생년월일</label></h4>
                <span class="join-box">
                    <input type="text" name="memberBirth">
                </span>   
                <h4><label for="">닉네임</label></h4>
                <span class="join-box">
                    <input type="text" name="memberNick">
                </span>   
                <div id="btn-join">
                    <button type="button" id="btnJoin">
                        <div id="text-join">가입하기</div>
                        </button>
                </div>


            </form>
        </div>
    </div>

</body>
</html>