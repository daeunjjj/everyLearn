<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/master/detail.css">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>관리자정보</h1>
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
                                <label for="email">이메일</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="email" value="admin01@every.com" readonly>
                            </div>
                            <span>
                                <button><i class="bi bi-envelope"></i></button>
                            </span>
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
                                <input type="text" name="phone" value="010-1234-1234" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="position">직급</label>
                            </div>
                            <div class="input-wrap">
                                <select name="position" id="position">
                                    <option value="master">사원</option>
                                    <option value="emp">대리</option>
                                    <option value="management">팀장</option>
                                </select>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="level">권한</label>
                            </div>
                            <div class="input-wrap">
                                <select name="level" id="level">
                                    <option value="master">마스터</option>
                                    <option value="emp">레벨2</option>
                                    <option value="management">레벨1</option>
                                </select>
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