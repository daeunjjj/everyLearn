<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 학생회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/student/list.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/common/list.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>학생회원</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="/el/admin/member/student/list" method="get">
                    	<input name="pno" value="1" hidden>
                        <div id="input-area">
                            <div class="atag-area">
                                <a href="/el/admin/member/student/list?pno=1">전체</a>
                                <span>|</span>
                                <a href="/el/admin/member/student/list?pno=1&category=quit_yn&keyword=Y">탈퇴회원</a>
                                <span>|</span>
                                <a href="/el/admin/member/student/list?pno=1&category=quit_yn&keyword=N">유지회원</a>
                            </div>
                            <div class="flex-area">
                                <div>
                                    <select name="category">
                                        <option value="id">아이디</option>
                                        <option value="name">이름</option>
                                    </select>
                                    <input type="text" name="keyword">
                                </div>
                                <button id="search-btn">검색</button>
                            </div>
                            
                        </div>
                    </form>
                </div>
                <div class="list-title">
                    <div>
                        <input type="checkbox" id="checkAll">
                        <label for="checkAll"></label>
                    </div>
                    <div>번호</div>
                    <div>아이디</div>
                    <div>이름</div>
                    <div>이메일</div>
                    <div>전화번호</div>
                    <div>가입일</div>
                    <div>상태</div>
                    <div>관리</div>
                </div>
                <form action="/el/admin/member/student/quit" method="post" onsubmit="return deleteCheck();">
                    <ul>
						<c:forEach items="${voList}" var="list">
						 <li>
                            <div class="list-items">
                                <div>
                                    <input type="checkbox" class="check" name="arrNo" value="${list.memberNo}">
                                    <label for="check"></label>
                                </div>
                                <div>${list.memberNo}</div>
                                <div>${list.memberId }</div>
                                <div>${list.memberName }</div>
                                <div>${list.email }</div>
                                <div>${list.phone }</div>
                                <div>${list.enrollDate }</div>
                                <div>${list.quitYn}</div>
                                <div>
                                    <button type="button" onclick="detailBtn('${list.memberNo}');">상세</button>
                                    <button>정지</button>
                                </div>
                            </div>
                        </li>
						</c:forEach>
                    </ul>
                    <div class="mail-btn-area">
                        <button id="mail-btn" type="submit">삭제</button>
                    </div>
                </form>
                <nav class="page-area">
                    <ul>

                    <c:if test="${pv.currentPage != 1}">
                        <li>
                            <c:if test="${empty svo }">
                                <a id="before" href="/el/admin/member/student/list?pno=${pv.currentPage-1}">이전</a>                      		
                            </c:if>
                            <c:if test="${!empty svo }">
                                <a id="before" href="/el/admin/member/student/list?pno=${pv.currentPage-1}&category=${svo.category}&keyword=${svo.keyword}">이전</a>                      		
                            </c:if>
                        </li>
                    </c:if>
					
					<c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">

                        <li>
                        	<c:if test="${empty svo}">
                          	  <a class="numBtn" href="/el/admin/member/student/list?pno=${num}">${num}</a>                        	
                        	</c:if>
                        	<c:if test="${!empty svo }">
                        	  <a class="numBtn" href="/el/admin/member/student/list?pno=${num}&category=${svo.category}&keyword=${svo.keyword}">${num}</a>                        		
                        	</c:if>
                        </li>
					</c:forEach>

                    <c:if test="${pv.currentPage != pv.maxPage }">
                        <li>
                            <c:if test="${empty svo }">
                                <a id="after" href="/el/admin/member/student/list?pno=${pv.currentPage+1}">다음</a>                       		
                            </c:if>
                            <c:if test="${!empty svo }">
                                <a id="after" href="/el/admin/member/student/list?pno=${pv.currentPage+1}&category=${svo.category}&keyword=${svo.keyword}">다음</a>                       		
                            </c:if>
                        </li>
                    </c:if>

                    </ul>
                </nav>
            </div>
        </main>
    </div>
    <script>

        function detailBtn(no) {
            window.location.href='/el/admin/member/student/detail?no='+no;
        }

        function deleteCheck(){
            let cnt = 0;
            for(let i = 0; i < check.length; i++){
                if(check[i].checked){
                    cnt++;
                }
            }

            if(cnt == 0){
                return false;
            } else{
                if(confirm("탈퇴처리하시겠습니까?")){
                    return true;
                } else{
                    return false;
                }
            }
        }
    </script>
</body>
</html>