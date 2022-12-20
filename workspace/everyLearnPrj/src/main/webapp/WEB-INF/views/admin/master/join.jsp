<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/master/join.css">

<script type="text/javascript" defer src="/el/resources/js/admin/join.js"></script>

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>관리자 등록</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <form action="/el/admin/master/join" method="post" onsubmit="return joinCheck();">
                    <input type="password" id="pwd" name="pwd" value="admin1234!" hidden>
                    <div class="join-wrap">
                        <div class="join-items">
                            <div class="title-wrap">
                                <label for="id">아이디(이메일)</label>
                            </div>
                            <div class="input-wrap">
                                <input class="input" id="id" type="text" name="id" placeholder="example@every.com">
                            </div>
                            <span hidden id="idMsg"></span>
                        </div>
                        <div class="join-items">
                            <div class="title-wrap">
                                <label for="name">이름</label>
                            </div>
                            <div class="input-wrap">
                                <input class="input" id="name" type="text" name="name" placeholder="관리자 성함을 입력해주세요.">
                            </div>
                            <span hidden id="nameMsg">필수 정보입니다.</span>
                        </div>
                        <div class="join-items">
                            <div class="title-wrap">
                                <label for="phone">전화번호</label>
                            </div>
                            <div class="input-wrap">
                                <input class="input" id="phone" type="text" name="phone" placeholder="번호만 입력해주세요." oninput="autoHyphen(this)" maxlength="13" >
                            </div>
                            <span hidden id="phoneMsg">필수 정보입니다.</span>
                        </div>
                        <div class="join-items">
                            <div class="title-wrap">
                                <label for="position">직급</label>
                            </div>
                            <div class="input-wrap">
                                <select class="input" name="position" id="position">
                                    <option value="1">사원</option>
                                    <option value="2">대리</option>
                                    <option value="3">팀장</option>
                                </select>
                            </div>
                        </div>
                        <div class="join-items">
                            <div class="title-wrap">
                                <label for="permission">권한</label>
                            </div>
                            <div class="input-wrap">
                                <select class="input" name="permission" id="permission">
                                    <option value="1">일반</option>
                                    <option value="2">마스터</option>
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
    <script>

    </script>
</body>
</html>