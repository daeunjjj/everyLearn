<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/class_comm/study.css" rel="stylesheet" type="text/css">
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <main id="container">

    <div id="container">
        <div id="wrap-comm">
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
                    <li><button class="orderby">• 최신순</button></li>
                    <li><button class="orderby">• 조회순</button></li>
                    <li><button class="orderby">• 좋아요순</button></li>
                    <li><button class="orderby" style="width: 330px;"></button></li>
                    
                    <li><button class="orderby">글쓰기</button></li>
                </ul>
            </div>
            <div id="study-wrap">
                
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


    </div>
</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>



</html>