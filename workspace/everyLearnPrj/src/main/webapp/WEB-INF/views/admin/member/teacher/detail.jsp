<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/teacher/detail.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/common/detail.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>강사정보</h1>
            <div id="line"></div>
           	<div class="main-wrap">
                <div class="profile-wrap">
                    <div class="resume-top">
                        <h2>이력서</h2>
                        <div class="flex-items" id="profile-wrap">
                            <div>프로필사진</div>
                            <div>
                                <img src="/el/resources/img/admin/profile.png" alt="프로필사진" width="150" height="200">
                            </div>
                        </div>
                        <div class="flex-items">
                            <div>이름</div>
                            <div>이강사</div>
                        </div>
                        <div class="flex-items">
                            <div>아이디</div>
                            <div>teacher123</div>
                        </div>
                        <div class="flex-items">
                            <div>분야</div>
                            <div>드로잉</div>
                        </div>
                        <div class="flex-items">
                            <div>경력</div>
                            <div>1년</div>
                        </div>
                        <div class="flex-items">
                            <div>전화번호</div>
                            <div>010-1234-5678</div>
                        </div>
                        <div class="flex-items">
                            <div>이메일</div>
                            <div>teacher123@gmail.com</div>
                        </div>
                    </div>
                    <div class="resume-bottom">
                        <div class="bottom-wrap">
                            <div>이력</div>
                            <div>
                                <i class="bi bi-dot"></i>
                                2016년 건국대 디자인과 졸업
                            </div>
                        </div>
                        <div class="bottom-wrap">
                            <div>자기소개</div>
                            <div id="intro-content">
                                안녕하세요. 저는 드로잉공부 어쩌구저쩌구 울라블라블루짱입니다. <br>
                                파랑파랑~~ <br>
                                짱~~~
                            </div>
                        </div>
                        <div class="btn-area">
                            <button id="refusal-btn">탈락</button>
                            <button id="approval-btn">승인</button>
                        </div>
                    </div>
                </div>
           	</div>


        </main>
    </div>
</body>
</html>