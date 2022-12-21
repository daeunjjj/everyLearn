<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/member/join.css" rel="stylesheet" type="text/css">
<script src="/el/resources/js/member/join.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <main id="container">
    <br><br>
    <div id="contain">
        <!-- <div id="top-join"> -->
            <!-- <div>
                <div class="top-join"><img  id="img-logo" src="/el/resources/img/logo/el.png" alt=""></div>
                <div class="top-join"><label for="">에브리런과 함께 성장을 넘어서 지식 공유까지!</label></div>
            </div> -->

            <div id="wrap-join">
                
                <form action="/el/member/join" method="post" id="join-form" onsubmit="jin()">

                <h4><label for="">* 아이디</label></h4>
                <span class="join-box">
                    <input type="text" id="memberId" name="memberId" onblur="emptyId()">
                    <button type="button" id="double-check" onclick="idDup()">중복확인</button>
                </span>            
                <div class="warning" id="idDup"></div>
                <h4><label for="">* 비밀번호</label></h4>
                <span class="join-box">
                    <input type="password" name="memberPwd" id="memberPwd" onblur="checkPw()">
                </span>
                <span>
                <div class="warning" id="pwdch"></div>
                <pre>
    - 영문자(대소문자 구분)/숫자/특수문자 모두 사용
    - 8자~20자(공백 제외)</pre>
                </span>            
                <h4><label for="">비밀번호 확인</label></h4> 
                <span class="join-box">   
                    <input type="password" name="memberPwd2" id="memberPwd2" onblur="pwdDup(); emptyPwd();">
                </span>
                <div class="warning" id="pwdDup"></div>
                <h4><label for="">* 이름</label></h4>
                <span class="join-box">
                    <input type="text" name="memberName">
                </span>   
                <div class="warning" id="Namech"></div>
                <h4><label for="">* 휴대폰 번호</label></h4>
                <span class="join-box" >
                    <!-- <input type="tel" name="phone" placeholder="숫자만 입력해주세요."> -->
                    <input type="text" name="phone" id="test_id"  placeholder=" '-' 없이 숫자만 입력해주세요" onkeyup="chk_tel(this.value,'test_id')"">
                </span>   
                <h4><label for="">* 이메일</label></h4>
                <span class="join-box">
                    <input type="email" name="email" id="email" onblur="emailCh()">
                </span>   
                <div class="warning" id="emailCheck"></div>
                <h4><label for="">* 생년월일</label></h4>
                <span class="join-box">
                    <input type="date" name="birth" id="birth" value="2023-01-13" >
                </span>   
                <h4><label for="">닉네임</label></h4>
                <span class="join-box">
                    <input type="text" name="memberNick" id="memberNick">
                    <button type="button" id="nick-double-check" onclick="nickDup()">중복확인</button>
                </span>   
                <div class="warning" id="nickDup"> </div>
                <div id="btn-join">
                    <button type="submit" id="btnJoin" >
                        <div id="text-join">가입하기</div>
                        </button>
                </div>
				
            </form>
        </div>
    </div>


</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>



</html>