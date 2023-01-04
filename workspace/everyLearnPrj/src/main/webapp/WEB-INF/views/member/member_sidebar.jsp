<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/el/resources/css/member/member_sidebar.css">
<script src="https://kit.fontawesome.com/c86765768f.js" crossorigin="anonymous"></script>    
<script src="/el/resources/js/member/sidebar.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>


        <div class="menu">
            <label for="expand-menu">
                <div>회원</div>
            </label>
            <input type="checkbox" id="expand-menu" name="expand-menu">
            <ul>
                <li>
                    <a href="http://127.0.0.1:8888/el/member/alert" onclick="test()"  class="item">
   
                        <div>알림</div>
                    </a>
                </li>
                <li>
                    <a href="http://127.0.0.1:8888/el/member/modify" class="item">
                        <div>프로필/수정</div>
                    </a>
                </li>
                <li>
                    <a href="javascript:listView('${loginMember.memberNo}')" class="item">
                        <input type="hidden" id="memberNo" value="${loginMember.memberNo}"> 
                        <div>작성글</div>
                    </a>
                </li>
                <li>
                    <a href="http://127.0.0.1:8888/el/member/point" class="item">
                        <div>포인트</div>
                    </a>
                </li>
            </ul>
        </div>


</body>



</html>