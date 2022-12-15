<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/member/point.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="/el/resources/js/member/member_alert.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <main id="container">
            
            <div id="sidebar">
                <%@ include file="/WEB-INF/views/member/member_sidebar.jsp"%>
            </div>
            <br><br>
            <div id="wrap">
                    <br><br>

                    <div id="point-main">
                        <div id="point-wrap">
                            <div><strong>에브리런님의 현재 포인트 </strong></div>
                            <div id="point">2000P</div>
                        </div>
                    </div>
                    <br>
                    <div class="container mt-3">
                        <table class="table">
                          <thead>
                            <tr style="text-align: center;">
                                <th>날짜</th>
                                <th>금액</th>
                                <th>내용</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr style="text-align: center;">
                                <td>2022.12.22</td>
                                <td>+2000P</td>
                                <td id="point-content" >[구매적립]주문NO.1234</td>
                            </tr>
                            <tr style="text-align: center;">
                                <td>2022.12.22</td>
                                <td>+2000P</td>
                                <td id="point-content" >[구매적립]주문NO.1234</td>
                            </tr>
                            <tr style="text-align: center;">
                                <td>2022.12.22</td>
                                <td>-10000P</td>
                                <td id="point-content" >[관리자차감]</td>
                            </tr>
                            <tr style="text-align: center;">
                                <td>2022.12.22</td>
                                <td>+2000P</td>
                                <td id="point-content" >[구매적립]주문NO.1234</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <br>
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