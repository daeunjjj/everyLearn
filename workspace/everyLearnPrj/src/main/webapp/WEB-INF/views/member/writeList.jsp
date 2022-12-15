<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/member/writeList.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="/el/resources/js/member/member_alert.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
            <main id="container">

                <div id="sidebar">
                    <%@ include file="/WEB-INF/views/member/member_sidebar.jsp" %>
                </div>
                <br><br>
                <div id="wrap">
                    <br><br>

                    <div id="writeList-main">
                        <div id="writeList-wrap">
                            <div id="writeList">작성글</div>
                            <div><strong>작성한 게시글을 확인해보세요.</strong></div>
                        </div>
                    </div>
                    <br>

                    <div class="container mt-3">
                        <table class="table table-hover" style="width: 570px;">
                            <thead>
                                <tr id="write-top">
                                    <th>카테고리</th>
                                    <th>등록일시</th>
                                    <th>제목</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="text-align: center;">
                                    <td id="write-cate">[취업고민]</td>
                                    <td id="write-date">22.12.14</td>
                                    <td id="write-title">si / sm / solution 중</td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td id="write-cate">[스터디]</td>
                                    <td id="write-date">23.12.14</td>
                                    <td id="write-title">밴드동호회 하실 분! 드럼!</td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td id="write-cate">[질문/답변]</td>
                                    <td id="write-date">19.12.14</td>
                                    <td id="write-title">질문합니다 질문</td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td id="write-cate">[취업고민]</td>
                                    <td id="write-date">22.12.14</td>
                                    <td id="write-title">si / sm / solution 중</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <br>
                    <div class="container mt-3" id="page-alert" style="width: 600px;">
                        <ul class="pagination" id="pagenation">
                            <li class="page-item"><a class="page-link" href="#">이전</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active"><a class="page-link" href="#" id="page-active">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">다음</a></li>
                        </ul>
                    </div>


                </div>

            </main>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>

    </html>