<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원기능요청</title>
<link rel="stylesheet" href="/el/resources/css/admin/request/list.css">
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>회원요청</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="cate-area">
                    <a href="">강의</a>
                    <span>|</span>
                    <a href="">기능</a>
                    <span>|</span>
                    <a href="">응원</a>
                </div>
                <div class="title-area list-wrap">
                    <div class="grid-area">
                        <div>번호</div>
                        <div>작성자</div>
                        <div>질문번호</div>
                        <div>내용</div>
                        <div>관리</div>
                    </div>
                </div>

                <ul class="content-area list-wrap">
                    <li class="grid-area">
                        <div>1</div>
                        <div>
                            <a href="">
                                user01
                                <i class="bi bi-box-arrow-up-right"></i>
                            </a>
                        </div>
                        <div>1</div>
                        <div>평점 기능있으면 좋을 것 같아요.</div>
                        <div>
                            <button>삭제</button>
                        </div>
                    </li>
                    <li class="grid-area">
                        <div>2</div>
                        <div>
                            <a href="">
                                userkim01
                                <i class="bi bi-box-arrow-up-right"></i>
                            </a>
                        </div>
                        <div>1</div>
                        <div>평점 기능있으면 좋을 것 같아요.</div>
                        <div>
                            <button>삭제</button>
                        </div>
                    </li>
                </ul>
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