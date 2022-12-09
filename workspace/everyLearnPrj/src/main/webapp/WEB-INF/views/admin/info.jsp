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
            <h1>내 정보</h1>
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
                            <div id="input-file"><input type="file"></div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="email">아이디</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="email" value="admin01@every.com" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="password">비밀번호</label>
                            </div>
                            <div class="input-wrap">
                                <input type="password" name="password" placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <span>비밀번호 형식을 맞춰주세요.</span>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="password">비밀번호 확인</label>
                            </div>
                            <div class="input-wrap">
                                <input type="password" name="password" placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <span>비밀번호가 일치하지 않습니다.</span>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="name">이름</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="name" value="엄격한" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="nick">닉네임</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="name" value="관리자" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="phone">전화번호</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="phone" placeholder="번호만 입력해주세요." value="010-1234-1234">
                            </div>
                            <span>필수 정보입니다.</span>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="position">직급</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" value="사원" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="level">권한</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" value="새싹" readonly>
                            </div>
                        </div>

                    </div>
                    <div class="btn-area">
                        <button>수정</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>