<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/css/class_comm/free.css" rel="stylesheet"
            type="text/css">
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

            <main id="container">

                <div id="container">
                    <div id="wrap-comm">
                        <div id="title">
                            <br><br>
                            <h2>자유게시판</h2>
                            <pre>
자유롭게 이야기를 나누는 공간
에브리런 회원들과 대화를 나눠보세요~
                </pre>
                        </div>
                        <div id="serch">
                            <input class="search_input" type="text" placeholder="검색어를 입력해주세요.">
                        </div>
                        <!-- <div id="btn-write" class="btn-write">
                <button class="btn-write" type="button">글쓰기</button>
            </div> -->
                        <div id="orderby">
                            <ul>
                                <li class="list"><button class="orderby">• 최신순</button></li>
                                <li class="list"><button class="orderby">• 조회순</button></li>
                                <li class="list"><button class="orderby">• 좋아요순</button></li>
                                <li><button class="orderby" style="width: 365px;"></button></li>

                                <li class="list"><button class="orderby">글쓰기</button></li>
                            </ul>
                        </div>
                        <div id="free-wrap">
                            <div id="free-top">
                                <div>제목</div>
                                <div>내용(댓글)</div>
                                <div>조회수</div>
                            </div>
                            <div id="free-main">
                                <div><a href="">자유게시판의</a> </div>
                                <div><a href="">내용입니다 내용 내용용용(33)</a> </div>
                                <div><a href="">12</a> </div>
                            </div>
                            <div id="free-main">
                                <div><a href="">자유게시판의</a> </div>
                                <div><a href="">내용입니다 내용 내용용용(33)</a> </div>
                                <div><a href="">12</a> </div>
                            </div>
                            <div id="free-main">
                                <div><a href="">자유게시판의</a> </div>
                                <div><a href="">내용입니다 내용 내용용용(33)</a> </div>
                                <div><a href="">12</a> </div>
                            </div>
                            <div id="free-main">
                                <div><a href="">자유게시판의</a> </div>
                                <div><a href="">내용입니다 내용 내용용용(33)</a> </div>
                                <div><a href="">12</a> </div>
                            </div>
                            <div id="free-main">
                                <div><a href="">자유게시판의</a> </div>
                                <div><a href="">내용입니다 내용 내용용용(33)</a> </div>
                                <div><a href="">12</a> </div>
                            </div>
                            <div id="free-main">
                                <div><a href="">자유게시판의</a> </div>
                                <div><a href="">내용입니다 내용 내용용용(33)</a> </div>
                                <div><a href="">12</a> </div>
                            </div>


                            <div class="container mt-3" id="page-alert">
                                <ul class="pagination" id="pagenation">
                                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item active"><a class="page-link" href="#" id="page-active">2</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                                </ul>
                            </div>


                        </div>
                    </div>


                </div>

            </main>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>



    </html>