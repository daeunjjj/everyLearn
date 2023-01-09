<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/mail/list.css">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>보낸내역</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="/el/admin/mail/send/list" method="get">
                    	<input name="pno" value="1" hidden>
                            <div class="btn-area">
                                <div class="flex-area">
                                    <div>
                                        <select name="category">
                                            <option value="name">작성자</option>
                                            <option value="title">제목</option>
                                        </select>
                                        <input id="keyword" type="text" name="keyword">
                                    </div>
                                    <button id="search-btn">검색</button>
                                </div>
<!--                               <div class="atag-area">
                                    <a href="">마스터</a>
                                    <span>|</span>
                                    <a href="">채용</a>
                                    <span>|</span>
                                    <a href="">관리</a>
                                </div>--> 
                            </div>
                        </div>
                    </form>

                </div>
                <div class="list-title">
                    <div>
                        <input type="checkbox" id="checkAll">
                        <label for="checkAll"></label>
                    </div>
                    <div>제목</div>
                    <div>보낸사람</div>
                    <div>받는사람</div>
                    <div>날짜</div>
                    <div></div>
                </div>
                <form action="/el/admin/mail/mail/delete" method="POST" onsubmit="return deleteCheck();">
                    <ul>
						<c:forEach items="${voList }" var="list">
							<li>
	                            <div class="list-items">
                                    <div>
                                        <input type="checkbox" id="check" name="arrNo" value="${list.no }">
                                        <label for="check"></label>
                                    </div>
	                                <div>${list.title }</div>
	                                <div>
	                                    <p>${list.adminNo }</p>
	                                    <p>${list.fromAddress }</p>
	                                </div>
	                                <div>
	                                    <p>${list.toAddress}</p>
	                                </div>
	                                <div>
	                                    <c:set var="enrollDate" value="${list.enrollDate}"/>
	                                    <c:set var="date" value="${fn:substring(enrollDate, 0,10)}"/>
	                                    <c:set var="time" value="${fn:substring(enrollDate, 11,19)}"/>
	                                    <p>${date}</p>  
	                                    <p>${time }</p>  
	                                </div>
	                                <div class="btn">
                                        <button type="button">상세</button>
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
                            <c:if test="${empty mapSearch }">
                                <a id="before" href="/el/admin/mail/send/list?pno=${pv.currentPage-1}">이전</a>                      		
                            </c:if>
                            <c:if test="${!empty mapSearch }">
                                <a id="before" href="/el/admin/mail/send/list?pno=${pv.currentPage-1}&category=${mapSearch.category}&keyword=${mapSearch.keyword}">이전</a>                      		
                            </c:if>
                        </li>
                    </c:if>
					
					<c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">

                        <li>
                        	<c:if test="${empty mapSearch}">
                          	  <a class="numBtn" href="/el/admin/mail/send/list?pno=${num}">${num}</a>                        	
                        	</c:if>
                        	<c:if test="${!empty mapSearch }">
                        	  <a class="numBtn" href="/el/admin/mail/send/list?pno=${num}&category=${mapSearch.category}&keyword=${mapSearch.keyword}">${num}</a>                        		
                        	</c:if>
                        </li>
					</c:forEach>

                    <c:if test="${pv.currentPage != pv.maxPage }">
                        <li>
                            <c:if test="${empty mapSearch }">
                                <a id="after" href="/el/admin/mail/send/list?pno=${pv.currentPage+1}">다음</a>                       		
                            </c:if>
                            <c:if test="${!empty mapSearch }">
                                <a id="after" href="/el/admin/mail/send/list?pno=${pv.currentPage+1}&category=${mapSearch.category}&keyword=${mapSearch.keyword}">다음</a>                       		
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

        $(document).ready(function(){
            //전체 체크박스 클릭
            $('#checkAll').click(function(){
                if($('#checkAll').prop("checked")){
                    $('input[name="arrNo"]').prop('checked',true);
                } else{
                    $('input[name="arrNo"]').prop('checked',false);
                }
            });

            //클래시 체크 하나 풀었을 때 아이디checkAll풀기
            $('.check').click(function(){
                if($('input[name="arrNo"]:checked').length == 10){
                    $('#checkAll').prop('checked',true);
                } else{
                    $('#checkAll').prop('checked',false);
                }
            });
        });

    </script>
</body>
</html>