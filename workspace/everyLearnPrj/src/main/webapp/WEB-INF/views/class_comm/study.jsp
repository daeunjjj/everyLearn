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
            <form action="/el/class/study" method="get">
	            <input class="search_input" name="keyword" type="text" placeholder="검색어를 입력해주세요.">
            </form>
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
                        	${study.content}
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
               
                
            </div>
            
        </div>
        
        <div class="container mt-3" id="page-alert">
            <ul class="pagination" id="pagenation">
            <c:if test="${pv.currentPage != 0}">
                <c:if test="${search.keyword != null}">
                    <li class="page-item"><a class="page-link" href="/el/class/study?orderBy=ENROLL_DATE DESC&pNo=${pv.startPage}&keyword=${search.keyword}">이전</a></li>
                </c:if>
                <c:if test="${search.keyword == null}">
                    <li class="page-item"><a class="page-link" href="/el/class/study?orderBy=ENROLL_DATE DESC&pNo=${pv.startPage }">이전</a></li>
                </c:if>    
            </c:if>
            
            <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
            <c:if test="${pv.currentPage != i and i <= pv.endPage}">
                <c:if test="${search.keyword != null}">
                    <li class="page-item"><a class="page-link" href="/el/class/study?orderBy=ENROLL_DATE DESC&pNo=${i}&keyword=${search.keyword}">${i}</a></li>
                </c:if>
                <c:if test="${search.keyword == null}">
                    <li class="page-item"><a class="page-link" href="/el/class/study?orderBy=ENROLL_DATE DESC&pNo=${i}">${i}</a></li>
                </c:if>    
            </c:if>   
            <c:if test="${pv.currentPage == i and i <= pv.endPage}">
                <c:if test="${search.keyword != null}">
                    <li class="page-item"><a class="page-link" href="/el/class/study?orderBy=ENROLL_DATE DESC&pNo=${i}&keyword=${search.keyword}">${i}</a></li>
                </c:if>
                <c:if test="${search.keyword == null}">
                    <li class="page-item"><a class="page-link" href="/el/class/study?orderBy=ENROLL_DATE DESC&pNo=${i}">${i}</a></li>
                </c:if>    
            </c:if>
            </c:forEach>
            <c:if test="${pv.currentPage != pv.maxPage }">
                <c:if test="${search.keyword != null}">
                    <li class="page-item"><a class="page-link" href="/el/class/study?orderBy=ENROLL_DATE DESC&pNo=${pv.currentPage+1}&keyword=${search.keyword}">다음</a></li>
                </c:if>
                <c:if test="${search.keyword != null}">
                    <li class="page-item"><a class="page-link" href="/el/class/study?orderBy=ENROLL_DATE DESC&pNo=${pv.currentPage+1}">다음</a></li>
                </c:if>
            </c:if>
            </ul>
        </div>
        
    </div>
</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>



</html>