<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/class_comm/detail.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

            <main id="container">
                <br><br>
                <div id="contain-detail">
                    <div id="cate">
                        <label for="">
                            <h1>질문과 답변</h1>
                        </label>
                    </div>
                    <div id="detail-wrap">
                        <div id="title-wrap">
                            <div id="title">
                                코딩을 잘 하려면 어떻게 해야하나욥?
                            </div>
                            <div style="padding-bottom: 3px;">
                                <div id="writer">
                                    코딩왕
                                </div>
                                <div id="enrollDate">
                                    2022-12-22 12:22:34
                                </div>
                                <img style="height: 20px; width: 20px;" src="/el/resources/img/class-comm/warning2.png" alt="">
                            </div>
                        </div>
                        <div id="content">
                            <pre>
지금 공부한지 2개월 넘었고 강의 들으면서 공부하고 있습니다.
근데 넘 어려워요11111                                
                            </pre>
                        </div>
                    </div>

                    

                </div>


            </main>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>



    </html>