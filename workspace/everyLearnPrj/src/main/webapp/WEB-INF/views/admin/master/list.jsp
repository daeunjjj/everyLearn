<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/master/list.css">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>관리자</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="" method="get">
                        <div id="input-area">
                            <div class="btn-area">
                                <div class="flex-area">
                                    <div>
                                        <select name="category">
                                            <option value="id">아이디</option>
                                            <option value="name">이름</option>
                                            <option value="name">이메일</option>
                                        </select>
                                        <input type="text" name="keyword">
                                    </div>
                                    <button id="search-btn">검색</button>
                                </div>
                                <div class="atag-area">
                                    <a href="">일반</a>
                                    <span>|</span>
                                    <a href="">마스터</a>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="list-title">
                    <div>
                        <input type="checkbox" id="checkAll">
                    </div>
                    <div>번호</div>
                    <div>이름</div>
                    <div>아이디</div>
                    <div>직급</div>
                    <div>권한</div>
                    <div>전화번호</div>
                    <div>관리</div>
                </div>
                <form action="">
                    <ul>
                    	<c:forEach items="${voList }" var="list">
		                    <c:if test="${empty voList}">
	                    		<div>회원이 없습니다.</div>
	                    	</c:if>
		                		<li>
		                            <div class="list-items">
		                                <div>
		                                    <input type="checkbox" id="check">
		                                    <label for="check"></label>
		                                </div>
		                                <div>${list.no}</div>
		                                <div>${list.name}</div>
		                                <div>${list.id}</div>
		                                <div>${list.position}</div>
		                                <div>${list.permission}</div>
		                                <div>${list.phone}</div>
		                                <div>
		                                    <button class="detailBtn" type="button" onclick="location.href='/el/admin/master/detail?no=${list.no}'">상세</button>
		                                </div>
		                            </div>
                        		</li>
                        </c:forEach>

                    </ul>
                    <div class="mail-btn-area">
                        <button id="mail-btn"><i class="bi bi-envelope"></i></button>
                    </div>
                </form>
                <nav class="page-area">
                    <ul>
                    <li>
                        <a id="before" href="/el/admin/master/list?pno=${pv.currentPage-1}">이전</a>
                    </li>
                    <c:if test="${pv.currentPage == 1}">
						<script>
                            $('#before').addClass('block');
                           
                            $('#before').on('click', function(){
                                return false;
                            })
                        </script>
                    </c:if>
					
					<c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">

                        <li>
                            <a class="numBtn" href="/el/admin/master/list?pno=${num}">${num}</a>
                        </li>
					</c:forEach>

                    <li>
                        <a id="after" href="/el/admin/master/list?pno=${pv.currentPage+1}">다음</a>
                    </li>
                    <c:if test="${pv.currentPage == pv.maxPage }">
                        <script>
                            $('#after').addClass('block');
                            
                            $('#after').on('click', function(){
                                return false;
                            })
                        </script>
                    </c:if>

                    </ul>
                </nav>

            </div>
        </main>
    </div>
</body>
</html>