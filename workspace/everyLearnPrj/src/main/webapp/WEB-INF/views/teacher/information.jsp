<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/teacher/information.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/el/resources/js/teacher/information.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <main id="container">
        <br><br>
        <div id="contain-detail">
            <div id="intro-wrap">
                <div class="container mt-3" id="mt-3">
                    <div class="card" style="width:250px; height: 370px;" >
                        <img class="card-img-top" id="teacher-img" src="/el/resources/upload/imgTeacher/${teacherInfo.teaImgchangeName}" alt="Card image"
                            >
                        <div class="card-body">
                            <h4 class="card-title">${teacherInfo.teacherNick}</h4>
                            <pre class="card-text">${teacherInfo.shortIntro}</pre>
                        </div>
                    </div>
                    <button id="detail-modify" onclick="careerModify()">자기소개 / 경력 수정</button>
                </div>
            </div>
            <div>
                <div id="plus">
                    <div id="profit">
                        <div class="top">내 수익</div>
                        <div class="num">1,270,000\</div>
                    </div>
                    <div id="trainee">
                        <div class="top">수강생 수</div>
                        <div class="num">1,232명</div>
                    </div>
                </div>
                <div id="career">
                    <label for="">경력</label> 
                </div>
                <pre id="main-career">${teacherInfo.career}</pre>
                <div id="lecture">
                    <label for="">내 강의</label>
                </div>
                <div id="list-wrap">
                 	<c:forEach items="${teacherClassList}" var="classs">
                    <div class="lec-list">
                        <img id="lec-img" src="/el/resources/upload/${classs.clImgChangeName}"  onerror="this.src='/el/resources/img/teacher/ex.png'">
                        <div id="lec-name">${classs.className}</div>
                        <div id="teacher-name">${classs.teacherNick}</div>
                        <div id="lec-reomm">추천수(${classs.recomm})</div>
                        <div id="lec-price">${classs.price}\</div>
                    </div>
                	</c:forEach>
   

                </div>
                
            </div>


        </main>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>

    </html>