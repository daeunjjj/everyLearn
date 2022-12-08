<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 학생회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/report/list.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>신고관리</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="" method="get">
                        <div id="input-area">
                            <div class="flex-area">
                                <div>
                                    <div>신고 수 :</div>
                                </div>
                                <div class="search">
                                    <select name="category">
                                        <option value="id">신고자</option>
                                        <option value="id">피신고자</option>
                                    </select>
                                    <input type="text" name="keyword" placeholder="아이디를 입력해주세요.">
                                    <button id="search-btn">검색</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="list-items-wrap">
                    <div class="list-items">
                        <div>번호</div>
                        <div>신고자</div>
                        <div>피신고자</div>
                        <div>신고사유</div>
                        <div>신고시간</div>
                        <div>처리시간</div>
                        <div>처리내역</div>
                        <div>보기</div>
                        <div>관리</div>
                    </div>


                   <div class="list-items list">
                        <div>1</div>
                        <div>
                            <a href="">
                                user0123
                                <i class="bi bi-box-arrow-up-right"></i>
                            </a>
                        </div>
                        <div>
                            <a href="">
                                user02
                                <i class="bi bi-box-arrow-up-right"></i>
                            </a>
                        </div>
                        <div>욕설/비방</div>
                        <div>2022-01-21</div>
                        <div>2022-01-21</div>
                        <div>미처리</div>
                        <div>
                            <a href="">
                                게시물
                                <i class="bi bi-box-arrow-up-right"></i>
                            </a>
                        </div>
                        <div>
                            <button>미처리</button>
                        </div>
                   </div>
                   <div class="list-items" id="list">
                    <div>1</div>
                    <div>
                        <a href="">
                            user0123
                            <i class="bi bi-box-arrow-up-right"></i>
                        </a>
                    </div>
                    <div>
                        <a href="">
                            user02
                            <i class="bi bi-box-arrow-up-right"></i>
                        </a>
                    </div>
                    <div>욕설/비방</div>
                    <div>2022-01-21</div>
                    <div>2022-01-21</div>
                    <div>미처리</div>
                    <div>
                        <a href="">
                            게시물
                            <i class="bi bi-box-arrow-up-right"></i>
                        </a>
                    </div>
                    <div>
                        <button>미처리</button>
                    </div>
               </div>
                </div>

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