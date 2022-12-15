<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/mail/list.css">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>보낸내역</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="" method="get">
                        <div id="input-area">
                            <div class="btn-area">
                                <div class="flex-area">
                                    <div>
                                        <select name="category">
                                            <option value="id">제목</option>
                                            <option value="name">내용</option>
                                        </select>
                                        <input id="keyword" type="text" name="keyword">
                                    </div>
                                    <button id="search-btn">검색</button>
                                </div>
<!--                               <div class="atag-area">
                                    <a href="">마스터</a>
                                    <span>|</span>
                                    <a href="">채용</a>
                                    <span>|</span>
                                    <a href="">관리</a>
                                </div>--> 
                            </div>
                        </div>
                    </form>

                </div>
                <div class="list-title">
                    <div>제목</div>
                    <div>보낸사람</div>
                    <div>받는사람</div>
                    <div>날짜</div>
                    <div>발송</div>
                </div>
                <form action="">
                    <ul>
                        <li>
                            <div class="list-items">
                                <div>에브리런 12월 특가 행사!!!</div>
                                <div>
                                    <p>관리자</p>
                                    <p>everyLearn@gmail.com</p>
                                </div>
                                <div>
                                    <p>김유저</p>
                                    <p>user01@gmail.com</p>
                                </div>
                                <div> 
                                    <p>2021-01-18</p>
                                    <p>14:53:43</p>     
                                </div>
                                <div>성공</div>
                            </div>
                        </li>
                        <li>
                            <div class="list-items">
                                <div>에브리런 12월 특가 행사!!!</div>
                                <div>
                                    <p>관리자</p>
                                    <p>everyLearn@gmail.com</p>
                                </div>
                                <div>
                                    <p>김유저</p>
                                    <p>user01@gmail.com</p>
                                </div>
                                <div> 
                                    <p>2021-01-18</p>
                                    <p>14:53:43</p>     
                                </div>
                                <div>성공</div>
                            </div>
                        </li>
                        <li>
                            <div class="list-items">
                                <div>에브리런 12월 특가 행사!!!</div>
                                <div>
                                    <p>관리자</p>
                                    <p>everyLearn@gmail.com</p>
                                </div>
                                <div>
                                    <p>김유저</p>
                                    <p>user01@gmail.com</p>
                                </div>
                                <div> 
                                    <p>2021-01-18</p>
                                    <p>14:53:43</p>     
                                </div>
                                <div>성공</div>
                            </div>
                        </li>
                    </ul>
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