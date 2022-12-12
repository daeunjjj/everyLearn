<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/teacher/enroll_main.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="/el/resources/js/teacher/enroll_main.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

            <main id="container">
              <div id="main-top">
                <div style="margin: auto;">
                    <img id="img-main" class="main_image" src="/el/resources/img/teacher/enroll_main2.png" alt="">
                    <h1 class="main_image_text" style="font-size:40px">100만 회원과 함께하는 에브리런</h1>
                    <h1 id="main-content" style="font-size:20px">지식을 공유할 수 있는 멋진 기회 런문가가 되어보세요!</h1>
                    <button id="btn-req" type="button" >런문가되기</button>
                </div>
              </div>
            </main>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>



    </html>