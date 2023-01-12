<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문과 답변</title>
<link href="${pageContext.request.contextPath}/resources/css/class_comm/qna.css" rel="stylesheet" type="text/css">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
                <h2>질문 / 답변</h2>
                <pre>
강의 관련 질문을 남겨주세요.
에브리런 회원들의 멋진 답변이 기다리고 있어요~
                </pre>
            </div>
            <div id="serch">
            <input class="search_input" type="text" placeholder="검색어를 입력해주세요.">
            </div>
            <div id="btn-write" class="btn-write">
                <button class="btn-write" type="button" onclick="location.href = '/el/class/write';">글쓰기</button>
            </div>
                
            <div id="question-wrap">
            	<c:forEach items="${qnaList}" var="qna">
            	
                <!-- 질문 div 시작 -->
	                <div>
	                	<a id="atg" href="/el/class/detail?classCommNo=${qna.classCommNo}&lc=${loginMember.memberNo}" >
	                    <div id="question">
	                        <div id="q-title">
	                        	${qna.title}
	                        </div>
	                        <div id="q-writer">${qna.writer}</div>
	                        <div id="q-content"><p>${qna.content}</p></div>
	                        <div id="btn-adiv">
	                            <button id="btn-answer">답변 (12)</button>
	                        </div>
	                    </div>
	                    </a>
	                </div>
            	</c:forEach>

                
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