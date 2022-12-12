<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/class/list.css">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>강의</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="" method="get">
                        <div id="input-area">
                            <div class="flex-area">
                                <div class="checkbox-area">
                                    <div class="checkbox-top">
                                        <label>전체
                                            <input type="checkbox" name="status" value="all">
                                        </label>
                                        <label>드로잉
                                            <input type="checkbox" name="status" value="all">
                                        </label>
                                        <label>요리/베이킹
                                            <input type="checkbox" name="status" value="quit">
                                        </label>
                                        <label>운동
                                            <input type="checkbox" name="status" value="blacklist">
                                        </label>
                                    </div>
                                    <div class="checkbox-bottom">
                                        <label>음악
                                            <input type="checkbox" name="status" value="all">
                                        </label>
                                        <label>IT
                                            <input type="checkbox" name="status" value="quit">
                                        </label>
                                        <label>언어
                                            <input type="checkbox" name="status" value="blacklist">
                                        </label>
                                        <label>금융/제테크
                                            <input type="checkbox" name="status" value="blacklist">
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-area">
                                <div class="atag-area">
                                    <a href="">추천수</a>
                                    <span>|</span>
                                    <a href="">수강생수</a>
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
                        </div>
                    </form>

                </div>
                <div class="list-title">
                    <div>
                        <input type="checkbox" id="checkAll">
                    </div>
                    <div>번호</div>
                    <div>강사명</div>
                    <div>강의명</div>
                    <div>분야</div>
                    <div>수강생</div>
                    <div>추천</div>
                    <div>가격</div>
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
                                <div>이강사</div>
                                <div>하루만에 배우는 드로잉</div>
                                <div>드로잉</div>
                                <div>38</div>
                                <div>42</div>
                                <div>35000</div>
                                <div>
                                    <button>상세</button>
                                    <button>폐강</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="mail-btn-area">
                        <button id="mail-btn">폐강</button>
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