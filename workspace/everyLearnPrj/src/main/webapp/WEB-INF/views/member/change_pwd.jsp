<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/el/resources/css/member/change_pwd.css" rel="stylesheet" type="text/css">
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <main id="container">
    <div id="contain">
        <!-- <div id="top-ch_pwd"> -->
            <div>
                <div class="top-ch_pwd"><img id="img-logo" src="/el/resources/img/logo/el.png" alt=""></div>
            </div>

            <div id="wrap-ch_pwd">

                
                <form action="" id="ch_pwd-form">
                <h3>비밀번호 변경</h3>

                <h4><label for="">비밀번호</label></h4>
                <span class="ch_pwd-box">
                    <input type="password" name="memberPwd1">
                </span>            
                <h4><label for="">비밀번호 확인</label></h4>
                <span class="ch_pwd-box">
                    <input type="password" name="memberPwd2">
                </span>
                <div id="btn-ch_pwd">
                    <button type="button" id="btnJoin">
                        <div id="text-ch_pwd">비밀번호 변경</div>
                    </button>
                </div>
                </form>
                
                
            </div>

    </div>

</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>



</html>