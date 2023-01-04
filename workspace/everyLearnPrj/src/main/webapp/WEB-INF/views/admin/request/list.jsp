<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원기능요청</title>
<link rel="stylesheet" href="/el/resources/css/admin/request/list.css">
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>회원요청</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="cate-area">
                    <a href="/el/admin/request/list?pno=1&category=check_yn&keyword=N">요청
                        <span>${map.cnt}</span>
                    </a>
                </div>
                <div class="title-area list-wrap">
                    <div class="flex-area">
                        <div>
                            <input type="checkbox" id="checkAll">
                        </div>
                        <div>번호</div>
                        <div>작성자</div>
                        <div>질문</div>
                        <div>내용</div>
                        <div>읽음</div>
                    </div>
                </div>

                <form action="/el/admin/request/check" method="post" onsubmit="return checkY();">
                    <ul class="content-area list-wrap">
                        <c:forEach items="${map.voList}" var="list">
                            <li class="flex-area">
                                <div>
                                    <input type="checkbox" id="check" class="check" name="arrNo" value="${list.no}">
                                </div>
                                <div>${list.no}</div>
                                <div>
                                    <a href="/el/admin/member/student/detail?no=${list.memberNo}" target="_blank">
                                        ${list.id }
                                        <i class="bi bi-box-arrow-up-right"></i>
                                    </a>
                                </div>
                                <div>${list.type}</div>
                                <div>${list.content}</div>
                                <div class="checkYn">${list.checkYn}</div>
                            </li>
                        </c:forEach>
                      
                    </ul>
                    <div class="check-btn-area">
                        <button type="submit" id="check-btn">읽음</button>
                    </div>

                </form>
  <nav class="page-area">
                    <ul>

                    <c:if test="${pv.currentPage != 1}">
                        <li>
                            <c:if test="${empty svo }">
                                <a id="before" href="/el/admin/request/list?pno=${pv.currentPage-1}">이전</a>                      		
                            </c:if>
                            <c:if test="${!empty svo }">
                                <a id="before" href="/el/admin/request/list?pno=${pv.currentPage-1}&category=${svo.category}&keyword=${svo.keyword}">이전</a>                      		
                            </c:if>
                        </li>
                    </c:if>
					
					<c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">

                        <li>
                        	<c:if test="${empty svo}">
                          	  <a class="numBtn" href="/el/admin/request/list?pno=${num}">${num}</a>                        	
                        	</c:if>
                        	<c:if test="${!empty svo }">
                        	  <a class="numBtn" href="/el/admin/request/list?pno=${num}&category=${svo.category}&keyword=${svo.keyword}">${num}</a>                        		
                        	</c:if>
                        </li>
					</c:forEach>

                    <c:if test="${pv.currentPage != pv.maxPage }">
                        <li>
                            <c:if test="${empty svo }">
                                <a id="after" href="/el/admin/request/list?pno=${pv.currentPage+1}">다음</a>                       		
                            </c:if>
                            <c:if test="${!empty svo }">
                                <a id="after" href="/el/admin/request/list?pno=${pv.currentPage+1}&category=${svo.category}&keyword=${svo.keyword}">다음</a>                       		
                            </c:if>
                        </li>
                    </c:if>

                    </ul>
                </nav>

            </div>
        </main>
    </div>
    <script>
        function checkY(){
            let cnt = 0;
            for(let i = 0; i < check.length; i++){
                if(check[i].checked){
                    cnt++;
                }
            }
            if(cnt == 0){
                return false;
            } else{
                return true;
            }

            // let checkboxValues = [];
            // $("input[name='arrNo']:checked").each(function(i) {
            //     checkboxValues.push($(this).val());
            // });

            //let checkBox = $("input[name='arrNo']:checked");


            // if(cnt > 0){
            //     $.ajax({
            //         url : "/el/admin/request/check",
            //         method : "POST",
            //         data : {"arrNo" : checkboxValues},
            //         success : function(result){
            //             if(result == ""){
            //                 // 중복
            //                 alert('실패');
            //             } else{
                          

                            
            //             }

            //         },
            //         error : function(){
            //             alert('통신실패');
            //         }
            //     })
            // } 
        }


        $(document).ready(function(){
            //전체 체크박스 클릭
            $('#checkAll').click(function(){
                if($('#checkAll').prop("checked")){
                    $('.check').prop('checked',true);
                } else{
                    $('.check').prop('checked',false);
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