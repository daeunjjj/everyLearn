<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/teacher/list.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/common/list.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>강사회원</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="" method="get">
                        <input name="pno" value="1" hidden>
                        <div id="input-area">
                            <div class="flex-area">
                                <div class="checkbox-area">
                                    <div class="checkbox-top">
                                        <label>드로잉
                                            <input type="checkbox" name="cate" value="드로잉">
                                        </label>
                                        <label>운동
                                            <input type="checkbox" name="cate" value="운동">
                                        </label>
                                        <label>음악
                                            <input type="checkbox" name="cate" value="음악">
                                        </label>
                                        <label>IT
                                            <input type="checkbox" name="cate" value="IT">
                                        </label>
                                    </div>
                                    <div class="checkbox-bottom">
                                        <label>요리/베이킹
                                            <input type="checkbox" name="cate" value="요리/베이킹">
                                        </label>
                                        <label>언어
                                            <input type="checkbox" name="cate" value="언어">
                                        </label>
                                        <label>금융/제테크
                                            <input type="checkbox" name="cate" value="금융/제테크">
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-area">
                                <a href="/el/admin/member/teacher/list?pno=1&&category=status">
                                    승인대기
                                    <span>${map.cnt}</span>
                                </a>
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
                        </div>
                    </form>

                </div>
                <div class="list-title">
                    <div></div>
                    <div>번호</div>
                    <div>이름</div>
                    <div>아이디</div>
                    <div>분야</div>
                    <div>이메일</div>
                    <div>전화번호</div>
                    <div>상태</div>
                    <div>관리</div>
                </div>
                <form action="/el/admin/member/teacher/delete" method="post" onsubmit="return deleteCheck();">
                    <ul>
                        <c:forEach items="${map.voList}" var="list">
	                       	<li>
	                            <div class="list-items">
	                                <div>
	                                    <input type="checkbox" id="check" name="arrNo" value="${list.no }">
	                                    <label for="check"></label>
	                                </div>
	                                <div>${list.no }</div>
	                                <div>${list.name }</div>
	                                <div>${list.id }</div>
	                                <div>${list.classCate }</div>
	                                <div>${list.email }</div>
	                                <div>${list.phone }</div>
	                                <c:if test="${list.statusYn eq 'Y' }">
		                                <div>승인</div>
	                                </c:if>
	                                <c:if test="${list.statusYn eq 'N' and list.deleteYn eq 'N'}">
		                                <div>대기</div>
	                                </c:if>
	                                <c:if test="${list.deleteYn eq 'Y'}">
		                                <div>탈락</div>
	                                </c:if>
	                                <div>
                                        <button type="button" onclick="detailBtn('${list.no}')">상세</button>
                                        <button type="button" onclick="sendMail('${list.email }');">메일</button>
                                    </div>
	                            </div>
	                        </li>
                        </c:forEach>
                    </ul>
                    <div class="mail-btn-area">
                        <button type="submit" id="mail-btn">탈락</button>
                    </div>
                </form>
                <nav class="page-area">
                    <ul>

                    <c:if test="${pv.currentPage != 1}">
                        <li>
                            <c:if test="${empty svo }">
                                <a id="before" href="/el/admin/member/teacher/list?pno=${pv.currentPage-1}">이전</a>                      		
                            </c:if>
                            <c:if test="${!empty svo }">
                                <a id="before" href="/el/admin/member/teacher/list?pno=${pv.currentPage-1}&category=${svo.category}&keyword=${svo.keyword}">이전</a>                      		
                            </c:if>
                        </li>
                    </c:if>
					
					<c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">

                        <li>
                        	<c:if test="${empty svo}">
                          	  <a class="numBtn" href="/el/admin/member/teacher/list?pno=${num}">${num}</a>                        	
                        	</c:if>
                        	<c:if test="${!empty svo }">
                        	  <a class="numBtn" href="/el/admin/member/teacher/list?pno=${num}&category=${svo.category}&keyword=${svo.keyword}">${num}</a>                        		
                        	</c:if>
                        </li>
					</c:forEach>

                    <c:if test="${pv.currentPage != pv.maxPage }">
                        <li>
                            <c:if test="${empty svo }">
                                <a id="after" href="/el/admin/member/teacher/list?pno=${pv.currentPage+1}">다음</a>                       		
                            </c:if>
                            <c:if test="${!empty svo }">
                                <a id="after" href="/el/admin/member/teacher/list?pno=${pv.currentPage+1}&category=${svo.category}&keyword=${svo.keyword}">다음</a>                       		
                            </c:if>
                        </li>
                    </c:if>

                    </ul>
                </nav>

            </div>
        </main>
    </div>
    <script>

    function deleteCheck(){
            let cnt = 0;

            if(check.checked){
                cnt++;
            }

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
        // 상세페이지
        function detailBtn(no){
            window.location.href="/el/admin/member/teacher/detail?no="+ no;
        }

        // 메일
        function sendMail(email,name){
            window.location.href="/el/admin/mail/send?address="+email;
        }
    </script>
</body>
</html>