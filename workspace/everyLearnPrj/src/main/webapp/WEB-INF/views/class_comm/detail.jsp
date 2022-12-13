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
        <script src="/el/resources/js/class_comm/detail.js"></script>
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
                                <img onclick="new_window();"
                                    style="height: 15px; width: 18px; margin-bottom: 4px; margin-left: 5px;"
                                    src="/el/resources/img/class-comm/warning2.png" alt="">


                                <div id="writer">
                                    코딩왕
                                </div>
                                <div id="enrollDate">
                                    2022-12-22 12:22:34
                                </div>
                            </div>
                        </div>
                        <div id="content">
                            <pre>
지금 공부한지 2개월 넘었고 강의 들으면서 공부하고 있습니다.
근데 넘 어려워요11111                                
                            </pre>
                        </div>
                    </div>
                    <div id="comment-top">댓글(3)</div>
                    <div style=" margin: 10px 10px;"></div>
                    <div id="comment-main">
                        <!-- 댓글반복문 -->
                        <div id="comment-wrap">
                            <img onclick="new_window();" style="height: 15px; width: 18px; margin-bottom: 4px; margin-left: 5px;"
                                src="/el/resources/img/class-comm/warning2.png" alt="">
                            <div id="writer">
                                투자가답이다
                            </div>
                            <div id="enrollDate">
                                2022-12-22 12:22:34
                            </div>
                        </div>
                        <pre style="margin-bottom: 10px; margin-top: 5px;">
투자원금 3배 이상 보장합니다. 믿고 맡겨주세요. 제 주소 링크 들어오시면 됩니다. 초기자본 제한 없습니다 편안하게 상담</pre>
                        <!-- 댓글반복문 끝 -->
                        <div id="comment-wrap">
                            <img onclick="new_window();" id="re" style="height: 15px; width: 18px; margin-bottom: 4px; margin-left: 5px;"
                                src="/el/resources/img/class-comm/warning2.png" alt="">
                            <div id="writer">
                                투자가답이다
                            </div>
                            <div id="enrollDate">
                                2022-12-22 12:22:34
                            </div>
                        </div>
                        <pre style="margin-bottom: 10px; margin-top: 5px;">
투자원금 3배 이상 보장합니다. 믿고 맡겨주세요. 제 주소 링크 들어오시면 됩니다. 초기자본 제한 없습니다 편안하게 상담</pre>
                    </div>
                    <form action="">
                    <div id="comm-write">
                        <div id="comm-content">
                                <textarea name="" id="" cols="60" rows="3" style="resize: none;"></textarea>
                            </div>
                            <div id="div-btn">
                                <button id="btn-write">작성</button>
                            </div>
                        </form>
                    </div>


                </div>


            </main>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>



    </html>