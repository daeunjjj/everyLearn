<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/class_comm/qna.css" rel="stylesheet" type="text/css">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <main id="container">

    <div id="container">
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
                <button class="btn-write" type="button">글쓰기</button>
            </div>
            <div id="question-wrap">
                <!-- 질문 div 시작 -->
                <div>
                    <div id="question">
                        <div id="q-title">질문제목</div>
                        <div id="q-writer">작성자</div>
                        <div id="q-content">
                            드로잉 수업 듣고 싶은데 어려운가요?
                            초보자입니다!!!!!
                        </div>
                        <div id="btn-adiv">
                            <button id="btn-answer">답변 (12)</button>
                        </div>
                    </div>
                </div>
                <!-- 질문 div 시작 -->
                <div>
                    <div id="question">
                        <div id="q-title">질문제목</div>
                        <div id="q-writer">작성자</div>
                        <div id="q-content">
                            드로잉 수업 듣고 싶은데 어려운가요?
                            초보자입니다!!!!!
                        </div>
                        <div id="btn-adiv">
                            <button id="btn-answer">답변 (12)</button>
                        </div>
                    </div>
                </div>
                <div>
                    <div id="question">
                        <div id="q-title">질문제목</div>
                        <div id="q-writer">작성자</div>
                        <div id="q-content">
                            박잘해 강사님 컴퓨터수업
                            프로그램 설치가 안되는데 뭐가 문제일까요?
                            윈도우 10 사용 중입니다
                        </div>
                        <div id="btn-adiv">
                            <button id="btn-answer">답변 (12)</button>
                        </div>
                    </div>
                </div>
                <div>
                    <div id="question">
                        <div id="q-title">질문제목</div>
                        <div id="q-writer">작성자</div>
                        <div id="q-content">
                            드로잉 수업 듣고 싶은데 어려운가요?
                            초보자입니다!!!!!
                        </div>
                        <div id="btn-adiv">
                            <button id="btn-answer">답변 (12)</button>
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


    </div>
</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>



</html>