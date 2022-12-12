<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/info.css">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>학생회원정보</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <form action="">
                    <div class="info-wrap">
                        <div class="info-items">
                            <div class="title-wrap" id="profile-wrap">
                                <label for="profile">프로필</label>
                            </div>
                            <div class="input-wrap">
                                <img src="/el/resources/img/admin/admin.png" alt="관리자사진" width="150px" height="200px">
                            </div>
                        <!--
                            <div id="input-file"><input type="file"></div>
                        -->    
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="id">아이디</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="id" value="student01" readonly>
                            </div>
                        </div>

                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="name">이름</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="name" value="이학생">
                            </div>
                            <span>필수 입력 사항입니다.</span>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="nick">닉네임</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="name" value="새싹" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="phone">전화번호</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="phone" placeholder="번호만 입력해주세요." value="010-1234-1234">
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="email">이메일</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="email" placeholder="번호만 입력해주세요." value="student01@gmail.com">
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="enrollDate">가입날짜</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="enrollDate" value="22-12-09" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="birth">생년월일</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="birth" value="96-04-29" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="point">포인트</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="point" value="3000" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="quitYn">탈퇴여부</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="quitYn" id="quitYn" value="O" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="reportYn">신고여부</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="reportYn" id="reportYn" value="X" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="btn-area">
                        <button>정지</button>
                        <button>수정</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>