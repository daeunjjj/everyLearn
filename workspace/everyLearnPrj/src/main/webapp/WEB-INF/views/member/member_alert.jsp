<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/member/member_alert.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="/el/resources/js/member/member_alert.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

            <main id="container">
                <br><br>
                <div id="wrap">
                    <div id="alert-top">
                        <div class="alert alert-secondary" style="margin-bottom: 1px; border-radius: 0px; background-color: #1187CF;">
                            <img src="/el/resources/img/member/alert.png" alt="" id="img-alert">
                            <strong style="color: white;">알림(6)을 확인해주세요</strong>
                        </div>
                    </div>
                    <div class="alert alert-primary" id="alert-content" style="margin-bottom: 0px;">
                        <div>
                            <strong>[신고]</strong>
                            <a href="#" class="alert-link" style="text-decoration: none;">
                                <강의 왜이럼???>
                            </a>에 신고가 접수되었습니다.
                            <img onclick="" src="/el/resources/img/member/delete.png" alt="" id="img-delete">
                        </div>
                    </div>
                    <div class="alert alert-primary" id="alert-content-ok" style="margin-bottom: 0px;">
                        <div>
                            <strong>[댓글]</strong>
                            <a href="#" class="alert-link" style="text-decoration: none;">
                                <스터디 구합니다.>
                            </a>에 댓글이 달렸습니다.
                            <img onclick="" src="/el/resources/img/member/delete.png" alt="" id="img-delete">
                        </div>
                    </div>
                    <div class="alert alert-primary" id="alert-content" style="margin-bottom: 0px;">
                        <div>
                            <strong>[신고]</strong>
                            <a href="#" class="alert-link" style="text-decoration: none;">
                                <강의 왜이럼???>
                            </a>에 신고가 접수되었습니다.
                        </div>
                    </div>
                    <div class="alert alert-primary" id="alert-content" style="margin-bottom: 0px;">
                        <div>
                            <strong>[신고]</strong>
                            <a href="#" class="alert-link" style="text-decoration: none;">
                                <강의 왜이럼???>
                            </a>에 신고가 접수되었습니다.
                        </div>
                    </div>
                    <div class="alert alert-primary" id="alert-content" style="margin-bottom: 0px;">
                        <div>
                            <strong>[신고]</strong>
                            <a href="#" class="alert-link" style="text-decoration: none;">
                                <강의 왜이럼???>
                            </a>에 신고가 접수되었습니다.
                        </div>
                    </div>
                    <div class="alert alert-primary" id="alert-content" style="margin-bottom: 0px;">
                        <div>
                            <strong>[신고]</strong>
                            <a href="#" class="alert-link" style="text-decoration: none;">
                                <강의 왜이럼???>
                            </a>에 신고가 접수되었습니다.
                        </div>
                    </div>

                    <div class="container mt-3" id="page-alert">
                        <ul class="pagination" id="pagenation">
                          <li class="page-item"><a class="page-link" href="#">이전</a></li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item active" ><a class="page-link" href="#" id="page-active">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item"><a class="page-link" href="#">다음</a></li>
                        </ul>
                    </div>


                </div>

            </main>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>

    </html>