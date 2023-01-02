<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 학생회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/report/list.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>신고관리</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="" method="get">
                        <div id="input-area">
                            <div class="flex-area">
                                <div>
                                    <a>
                                    미처리신고
                                    <span>${map.cnt }</span>
                                    </a>
                                </div>
                                <div class="search">
                                    <input name="pno" value="1" hidden>
                                    <select name="category">
                                        <option value="b.id">신고자</option>
                                        <option value="a.id">피신고자</option>
                                    </select>
                                    <input type="text" name="keyword" placeholder="아이디를 입력해주세요.">
                                    <button id="search-btn">검색</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="list-items-wrap">
                    <div class="list-items">
                        <div>번호</div>
                        <div>신고자</div>
                        <div>피신고자</div>
                        <div>신고사유</div>
                        <div>신고시간</div>
                        <div>처리시간</div>
                        <div>처리내역</div>
                        <div>관리</div>
                    </div>


				<c:forEach items="${map.voList}" var="list">
					<div class="list-items list">
						<div>${list.no }</div>
						<div>${list.accusor }</div>
						<div>${list.blacklist }</div>
                        <div>${list.type }</div>
                        <div>${list.reportDate}</div>
                        <c:if test="${list.handleYn eq 'Y' }">
                        	<div>${list.processDate}</div>
                        	<div>${list.method}</div>
                        </c:if>
                        <c:if test="${list.handleYn eq 'N' }">
                        	<div>처리예정</div>
                        	<div>미처리</div>
                        </c:if>
                        <div>
                            <button onclick="processBtn('${list.no}');">처리</button>
                        </div>
                   </div>
				</c:forEach>
                   

                <nav class="page-area">
                    <ul>

                    <c:if test="${pv.currentPage != 1}">
                        <li>
                            <c:if test="${empty mapSearch }">
                                <a id="before" href="/el/admin/report/list?pno=${pv.currentPage-1}">이전</a>                      		
                            </c:if>
                            <c:if test="${!empty mapSearch }">
                                <a id="before" href="/el/admin/report/list?pno=${pv.currentPage-1}&category=${svo.category}&keyword=${svo.keyword}">이전</a>                      		
                            </c:if>
                        </li>
                    </c:if>
					
					<c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">

                        <li>
                        	<c:if test="${empty mapSearch}">
                          	  <a class="numBtn" href="/el/admin/report/list?pno=${num}">${num}</a>                        	
                        	</c:if>
                        	<c:if test="${!empty mapSearch }">
                        	  <a class="numBtn" href="/el/admin/report/list?pno=${num}&category=${svo.category}&keyword=${svo.keyword}">${num}</a>                        		
                        	</c:if>
                        </li>
					</c:forEach>

                    <c:if test="${pv.currentPage != pv.maxPage }">
                        <li>
                            <c:if test="${empty mapSearch }">
                                <a id="after" href="/el/admin/report/list?pno=${pv.currentPage+1}">다음</a>                       		
                            </c:if>
                            <c:if test="${!empty mapSearch }">
                                <a id="after" href="/el/admin/report/list?pno=${pv.currentPage+1}&category=${svo.category}&keyword=${svo.keyword}">다음</a>                       		
                            </c:if>
                        </li>
                    </c:if>

                    </ul>
                </nav>

            </div>
        </main>
    </div>
    <script>

        function processBtn(no){  
            window.location.href = "/el/admin/report/process?no="+no;

        }

        
    </script>
</body>
</html>