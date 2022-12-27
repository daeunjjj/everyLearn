<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/el/resources/js/member/id_find.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="/el/resources/css/member/id_find.css" rel="stylesheet" type="text/css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <br><br><br><br><br>
    <hr>
    <div id="contain">
        <!-- <div id="top-id_find"> -->
            <div>
                <div class="top-id_find"><img id="img-logo" src="/el/resources/img/logo/el.png" alt=""></div>
            </div>

            <div id="wrap-id_find">
                
                <form action="" id="id_find-form">
                <h3>아이디 찾기</h3>    

                <h4><label for="">이름</label></h4>
                <span class="id_find-box">
                    <input type="text" name="memberName" id="memberName">
                </span>            
                <h4><label for="">이메일</label></h4>
                <span class="id_find-box">
                    <input type="email" name="memberEmail" id="memberEmail">
                </span>
                <div id="btn-id_find">
                    <button type="button" id="btnJoin" onclick="idFind()">
                        <div id="text-id_find">아이디 찾기</div>
                    </button>
                </div>
                </form>
                
                
            </div>

    </div>

</body>
</html>