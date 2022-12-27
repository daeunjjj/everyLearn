<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 기업회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/corporate/list.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/common/list.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>기업회원</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="" method="get">
                        <div id="input-area">
                            <div class="flex-area">
                                <div class="checkbox-area">
                                    <div class="checkbox-top">
                                        <label>IT직군
                                            <input type="checkbox" name="cate" value="all">
                                        </label>
                                        <label>경영/사무
                                            <input type="checkbox" name="cate" value="quit">
                                        </label>
                                    </div>
                                    <div class="checkbox-bottom">
                                        <label>디자인
                                            <input type="checkbox" name="cate" value="all">
                                        </label>
                                        <label>마케팅
                                            <input type="checkbox" name="cate" value="quit">
                                        </label>
                                        <label>교육
                                            <input type="checkbox" name="cate" value="blacklist">
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-area">
                                <div>
                                    승인대기
                                    <span>10</span>
                                </div>
                                <div class="flex-area">
                                    <div>
                                        <select name="category">
                                            <option value="companyName">기업이름</option>
                                            <option value="name">대표자명</option>
                                            <option value="companyNum">사업자번호</option>
                                        </select>
                                        <input type="text" name="keyword">
                                    </div>
                                    <button id="search-btn">검색</button>
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
                    <div>기업이름</div>
                    <div>직군</div>
                    <div>대표자명</div>
                    <div>전화번호</div>
                    <div>이메일</div>
                    <div>상태</div>
                    <div>관리</div>
                </div>
                <form action="">
                    <ul>
                        <li>
                            <div class="list-items">
                                <div>
                                    <input type="checkbox" id="check">
                                    <label for="check"></label>
                                </div>
                                <div>1</div>
                                <div>kh352</div>
                                <div>IT</div>
                                <div>심투용</div>
                                <div>010-1234-1234</div>
                                <div>2dragon@gmail.com</div>
                                <div>승인</div>
                                <div>
                                    <button>상세</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="mail-btn-area">
                        <button id="mail-btn">승인</button>
                    </div>
                </form>
                <nav class="page-area">
                    <ul>

                    <c:if test="${pv.currentPage != 1}">
                        <li>
                            <c:if test="${empty svo }">
                                <a id="before" href="/el/admin/member/corporate/list?pno=${pv.currentPage-1}">이전</a>                      		
                            </c:if>
                            <c:if test="${!empty svo }">
                                <a id="before" href="/el/admin/member/corporate/list?pno=${pv.currentPage-1}&category=${svo.category}&keyword=${svo.keyword}">이전</a>                      		
                            </c:if>
                        </li>
                    </c:if>
					
					<c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">

                        <li>
                        	<c:if test="${empty svo}">
                          	  <a class="numBtn" href="/el/admin/member/corporate/list?pno=${num}">${num}</a>                        	
                        	</c:if>
                        	<c:if test="${!empty svo }">
                        	  <a class="numBtn" href="/el/admin/member/corporate/list?pno=${num}&category=${svo.category}&keyword=${svo.keyword}">${num}</a>                        		
                        	</c:if>
                        </li>
					</c:forEach>

                    <c:if test="${pv.currentPage != pv.maxPage }">
                        <li>
                            <c:if test="${empty svo }">
                                <a id="after" href="/el/admin/member/corporate/list?pno=${pv.currentPage+1}">다음</a>                       		
                            </c:if>
                            <c:if test="${!empty svo }">
                                <a id="after" href="/el/admin/member/corporate/list?pno=${pv.currentPage+1}&category=${svo.category}&keyword=${svo.keyword}">다음</a>                       		
                            </c:if>
                        </li>
                    </c:if>

                    </ul>
                </nav>

            </div>
        </main>
    </div>
</body>
</html>