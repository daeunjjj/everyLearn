<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/master/join.css">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>관리자 등록</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <form action="">
                    <div class="join-wrap">
                        <div class="join-items">
                            <div class="title-wrap">
                                <label for="email">아이디</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="email" placeholder="이메일 형식으로 입력해주세요.">
                            </div>
                            <span>필수 정보입니다.</span>
                        </div>
                        <div class="join-items">
                            <div class="title-wrap">
                                <label for="name">이름</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="name" placeholder="관리자 성함을 입력해주세요.">
                            </div>
                            <span>필수 정보입니다.</span>
                        </div>
                        <div class="join-items">
                            <div class="title-wrap">
                                <label for="phone">전화번호</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="phone" placeholder="번호만 입력해주세요.">
                            </div>
                            <span>필수 정보입니다.</span>
                        </div>
                        <div class="join-items">
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
                        <div class="join-items">
                            <div class="title-wrap">
                                <label for="level">권한</label>
                            </div>
                            <div class="input-wrap">
                                <select name="level" id="level">
                                    <option value="master">마스터</option>
                                    <option value="emp">채용</option>
                                    <option value="management">관리</option>
                                </select>
                            </div>
                        </div>
                        <div class="btn-area">
                            <button>등록</button>
                        </div>
                    </div>

                </form>
            </div>
        </main>
    </div>
</body>
</html>