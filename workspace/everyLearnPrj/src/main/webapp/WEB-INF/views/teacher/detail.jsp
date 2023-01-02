<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/teacher/detail.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <main id="container">
        <br><br>
        <div id="contain-detail">
            <div id="intro-wrap">
                <div class="container mt-3" id="mt-3">
                    <div class="card" style="width:250px; height: 370px;" >
                        <img class="card-img-top" id="teacher-img" src="/el/resources/img/teacher/person.png" alt="Card image"
                            >
                        <div class="card-body">
                            <h4 class="card-title">${teacherNick}</h4>
                            <pre class="card-text">
                                ${teacherDetailList[0].shortIntro}
                            </pre>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div id="career">
                    <label for="">경력</label> 
                </div>
                <div id="main-career">
					- ${teacherDetailList[0].career}
                </div>
                <div id="lecture">
                    <label for="">강의</label>
                </div>
                <div id="list-wrap">
                <c:forEach items="${teacherDetailList}" var="detail">
                    <div class="lec-list">
                        <img id="lec-img" src="/el/resources/img/teacher/ex.png" alt="">
                        <div id="lec-name">${detail.className }</div>
                        <div id="teacher-name">${teacherNick}</div>
                        <div id="lec-reomm">추천수(${detail.recomm})</div>
                        <div id="lec-price">${detail.recomm }\</div>
                    </div>
                </c:forEach>
                </div>
                
            </div>


        </main>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>

    </html>