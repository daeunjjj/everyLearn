<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
       <!-- Latest compiled and minified CSS -->
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
       <!-- Latest compiled JavaScript -->
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/class_comm/study.css" rel="stylesheet" type="text/css">
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <main id="container">

            <div id="sidebar">
                <%@ include file="/WEB-INF/views/class_comm/sidebar.jsp"%>
            </div>

    <div id="contain">
        <div id="wrap-comm">
            <br><br>
            <div id="title">
                <h2>스터디</h2>
                <pre>
함께 공부할 회원들을
에브리런 스터디에서 찾아보세요!
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
                    <li><button class="orderby" onclick="location.href='/el/class/study?orderBy=ENROLL_DATE DESC'">• 최신순</button></li>
                    <li><button class="orderby" onclick="location.href='/el/class/study?orderBy=HIT DESC'">• 조회순</button></li>
                    <li><button class="orderby" onclick="location.href='/el/class/study?orderBy=ENROLL_DATE DESC'">• 좋아요순</button></li>
                    <li><button class="orderby" style="width: 300px;"></button></li>
                    
                    <li><button class="orderby" onclick="location.href='/el/class/write'">글쓰기</button></li>
                </ul>
            </div>
            <div id="study-wrap">
               <c:forEach items="${studyList}" var="study">
                <div id="study-context">
                    <div id="comm-study" onclick="location.href='/el/class/detail?classCommNo='+ ${study.classCommNo}">
                        <div class="study-write" id="study-title" onclick="location.href='/el/class/detail?classCommNo='+ ${study.classCommNo}">${study.title}</div>
                        <div class="study-write" id="study-content">
                        	${study.title}
                        </div>
                    </div>
                    <div class="study-context">
                        <div id="comment">
                            <button id="btn-comment">
                                <p>댓글</p>
                                <p>(11)</p>
                            </button>
                        </div>
                    </div>
                </div>
               </c:forEach>
                <div id="study-context">
                    <div id="comm-study">
                        <div class="study-write" id="study-title">토익 스터디 구합니다(900점 목표~~^^)</div>
                        <div class="study-write" id="study-content">토익 스터디 구합니다(900점 목표~~^^) 
                            하루에 20시간 이상 하실 분!!!!!~~~~~~~~~~
                        </div>
                    </div>
                    <div class="study-context">
                        <div id="comment">
                            <button id="btn-comment">
                                <p>댓글</p>
                                <p>(11)</p>
                            </button>
                        </div>
                    </div>
                </div>

                <div id="study-context">
                    <div id="comm-study">
                        <div class="study-write" id="study-title">토익 스터디 구합니다(900점 목표~~^^)</div>
                        <div class="study-write" id="study-content">토익 스터디 구합니다(900점 목표~~^^) 
                            하루에 20시간 이상 하실 분!!!!!~~~~~~~~~~
                        </div>
                    </div>
                    <div class="study-context">
                        <div id="comment">
                            <button id="btn-comment">
                                <p>댓글</p>
                                <p>(11)</p>
                            </button>
                        </div>
                    </div>
                </div>
                
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