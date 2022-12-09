<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/master/list.css">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>관리자</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="" method="get">
                        <div id="input-area">
                            <div class="btn-area">
                                <div class="flex-area">
                                    <div>
                                        <select name="category">
                                            <option value="id">아이디</option>
                                            <option value="name">이름</option>
                                            <option value="name">이메일</option>
                                        </select>
                                        <input type="text" name="keyword">
                                    </div>
                                    <button id="search-btn">검색</button>
                                </div>
                                <div class="atag-area">
                                    <a href="">마스터</a>
                                    <span>|</span>
                                    <a href="">채용</a>
                                    <span>|</span>
                                    <a href="">관리</a>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="list-title">
                    <div>
                        <input type="checkbox" id="checkAll">
                    </div>
                    <div>번호</div>
                    <div>이름</div>
                    <div>아이디</div>
                    <div>담당</div>
                    <div>이메일</div>
                    <div>전화번호</div>
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
                                <div>관리자</div>
                                <div>teacher123</div>
                                <div>채용</div>
                                <div>admin01@gmail.com</div>
                                <div>010-1234-5678</div>
                                <div>
                                    <button>상세</button>
                                    <button>탈퇴</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="mail-btn-area">
                        <button id="mail-btn"><i class="bi bi-envelope"></i></button>
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