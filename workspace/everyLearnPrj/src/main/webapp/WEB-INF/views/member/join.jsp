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
                    <input type="text" name="memberId">
                    <button id="double-check">중복확인</button>
                </span>            
                <h4><label for="">* 비밀번호</label></h4>
                <span class="join-box">
                    <input type="password" name="memberPwd">
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
                <h4><label for="">* 이름</label></h4>
                <span class="join-box">
                    <input type="text" name="memberName">
                </span>   
                <h4><label for="">* 휴대폰 번호</label></h4>
                <span class="join-box" >
                    <input type="tel" name="phone" placeholder="숫자만 입력해주세요.">
                </span>   
                <h4><label for="">* 이메일</label></h4>
                <span class="join-box">
                    <input type="email" name="email">
                </span>   
                <h4><label for="">* 생년월일</label></h4>
                <span class="join-box">
                    <input type="text" minlength="10" maxlength="10" name="birth" placeholder="-도 입력해주세요(ex. 2000-12-12 추후 수정 예정.)">
                </span>   
                <h4><label for="">닉네임</label></h4>
                <span class="join-box">
                    <input type="text" name="memberNick">
                    <button id="nick-double-check">중복확인</button>
                </span>   
                <div id="btn-join">
                    <button type="submit" id="btnJoin" >
                        <div id="text-join">가입하기</div>
                        </button>
                </div>

				
				
            </form>
        </div>
    </div>

	<script type="text/javascript">
		function jin() {
			return true;
		}
	</script>

</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>



</html>