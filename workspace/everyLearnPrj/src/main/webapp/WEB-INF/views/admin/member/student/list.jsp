<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 학생회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/student/list.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/common/list.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>학생회원</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="" method="get">
                        <div id="input-area">
                            <div class="flex-area">
                                <div class="checkbox-area">
                                    <label>전체
                                        <input type="checkbox" name="status" value="all">
                                    </label>
                                    <label>탈퇴회원
                                        <input type="checkbox" name="status" value="quit">
                                    </label>
                                    <label>신고회원
                                        <input type="checkbox" name="status" value="blacklist">
                                    </label>
                                </div>
                            </div>
                            <div class="flex-area">
                                <div>
                                    <select name="category">
                                        <option value="id">아이디</option>
                                        <option value="name">이름</option>
                                    </select>
                                    <input type="text" name="keyword">
                                </div>
                                <button id="search-btn">검색</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="list-title">
                    <div>
                        <input type="checkbox" id="checkAll">
                        <label for="checkAll"></label>
                    </div>
                    <div>번호</div>
                    <div>아이디</div>
                    <div>이름</div>
                    <div>이메일</div>
                    <div>전화번호</div>
                    <div>가입일시</div>
                    <div>관리</div>
                </div>
                <form action="">
                    <ul>
                        <li>
                            <div class="list-items">
                                <div>
                                    <input type="checkbox" id="check">
                                    <label for="check"></label>
                                </div>
                                <div>1</div>
                                <div>user0123</div>
                                <div>김유저</div>
                                <div>user01@gmail.com</div>
                                <div>010-1234-5678</div>
                                <div>20221205</div>
                                <div>
                                    <button>수정</button>
                                    <button>제한</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="mail-btn-area">
                        <button id="mail-btn">제한</button>
                    </div>
                </form>
                <nav class="page-area">
                    <ul>
                        <li>
                            <a href="">이전</a>
                        </li>
                        <li>
                            <a href="">1</a>
                        </li>
                        <li>
                            <a href="">2</a>
                        </li>
                        <li>
                            <a href="">3</a>
                        </li>
                        <li>
                            <a href="">4</a>
                        </li>
                        <li>
                            <a href="">5</a>
                        </li>
                        <li>
                            <a href="">다음</a>
                        </li>

                    </ul>
                </nav>

            </div>
        </main>
    </div>
</body>
</html>