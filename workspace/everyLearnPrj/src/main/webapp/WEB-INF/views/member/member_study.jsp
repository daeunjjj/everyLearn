<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/member/member_study.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <main id="container">
        <br><br>
        <div id="contain-detail">
            <div id="intro-wrap">
            <c:if test="${info ne 'n'}">
            <div>
                <div id="lecture">
                    
                    <label for="">최근 본 강의</label>
                </div>
                <div id="lately-wrap">
                    <div >
                        <img id="lately_img" src="/el/resources/img/teacher/ex.png" alt="">
                    </div>
                    <div id="lately_">
                        <div id="late-explain">
                            <div id="late-title">그림으로 배우는 한국사</div>
                            <div id="late">추천수</div>
                            <div id="late-">수강생수</div>
                            <div id="late-">박강사</div>
                        </div>
                        <div id="late-progress">
                            <div class="container mt-3">
                                <h2>강의 진도율</h2>
                                <div class="progress">
                                  <div class="progress-bar" style="width:70%">70%</div>
                                </div>
                              </div>
                        </div>
                    </div>
                </div>
            </c:if>
                
            </div>    
            <div>
                <div id="lecture">
                    <label for="">내 강의 목록</label>
                </div>
                <div id="list-wrap">
                <c:if test="${info eq 'n'}">
					<div style="width: 1000px; height: 500px;">
                    <img  style="width: 1000px; height: 200px; margin-top: 150px;" src="/el/resources/img/member/noClass.png" alt="">
                    </div>
                </c:if>
                
                <c:forEach items="${myClassInfoList}" var="myClass">
                    <div class="lec-list">
                        <a href="/el/member/memberProgress?classNo=${myClass.classNo}&mn=${loginMember.memberNo}">
                            <img id="lec-img" src="/el/resources/upload/${myClass.thumb}" alt="">
                            <div id="lec-name">${myClass.className}</div>
                            <div id="teacher-name">${myClass.teacherNick}</div>
                        </a>
                        

                    </div>
                </c:forEach>
                </div>
                
            </div>
        </div>    


        </main>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>

    </html>