<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/master/list.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>관리자</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="search-area">
                    <form action="/el/admin/master/list" method="get">
                    	<input hidden name="pno" value="1">
	                        <div id="input-area">
	                            <div class="btn-area">
	                                <div class="flex-area">
	                                    <div>
	                                        <select name="category">
	                                            <option value="id">아이디</option>
	                                            <option value="name">이름</option>
	                                            <option value="nick">닉네임</option>
	                                        </select>
	                                        <input type="text" name="keyword">
	                                    </div>
	                                    <button type="submit" id="search-btn">검색</button>
	                                </div>
	                                <div class="atag-area">
	                                    <a href="/el/admin/master/list?pno=1&category=position&keyword=1">사원</a>
	                                    <span>|</span>
	                                    <a href="/el/admin/master/list?pno=1&category=position&keyword=2">대리</a>
	                                    <span>|</span>
	                                    <a href="/el/admin/master/list?pno=1&category=position&keyword=3">팀장</a>
	                                </div>
	                            </div>
	                        </div>
                    </form>

                </div>
                <div class="list-box">
                    <div class="list-title">
                        <div></div>
                        <div>번호</div>
                        <div>이름</div>
                        <div>아이디</div>
                        <div>직급</div>
                        <div>권한</div>
                        <div>전화번호</div>
                        <div>상태</div>
                        <div>관리</div>
                    </div>
                    <form action="/el/admin/master/quit" method="post" onsubmit="return deleteCheck();">
                        <ul>
                            <c:forEach items="${voList }" var="list">
                                <c:if test="${empty voList}">
                                    <div>회원이 없습니다.</div>
                                </c:if>
                                    <li>
                                        <div class="list-items">
                                            <div>
                                                <input type="checkbox" id="check" name="arrNo" value="${list.no}">
                                                <label for="check"></label>
                                            </div>
                                            <div>${list.no}</div>
                                            <div>${list.name}</div>
                                            <div>${list.id}</div>
                                            <div>${list.position}</div>
                                            <div>${list.permission}</div>
                                            <div>${list.phone}</div>
                                            <div>${list.quitYn}</div>
                                            <div>
                                                <button class="detailBtn" type="button" onclick="detailBtn('${list.no}');">상세</button>
                                                <button type="button" onclick="sendMail('${list.id}');">메일</button>
                                                <input id="checkPwd" value="" hidden>
                                            </div>
                                        </div>
                                    </li>
                            </c:forEach>
    
                        </ul>
	                        <div class="quit-btn-area">
		                        <c:if test="${loginAdmin.permission eq '마스터' }">
	                            	<button id="quit-btn" type="submit">탈퇴</button>
		                        </c:if>
	                        </div>
                    </form>
                </div>
                <nav class="page-area">
                    <ul>

                    <c:if test="${pv.currentPage != 1}">
                        <li>
                            <c:if test="${empty svo }">
                                <a id="before" href="/el/admin/master/list?pno=${pv.currentPage-1}">이전</a>                      		
                            </c:if>
                            <c:if test="${!empty svo }">
                                <a id="before" href="/el/admin/master/list?pno=${pv.currentPage-1}&category=${svo.category}&keyword=${svo.keyword}">이전</a>                      		
                            </c:if>
                        </li>
                    </c:if>
					
					<c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">

                        <li>
                        	<c:if test="${empty svo}">
                          	  <a class="numBtn" href="/el/admin/master/list?pno=${num}">${num}</a>                        	
                        	</c:if>
                        	<c:if test="${!empty svo }">
                        	  <a class="numBtn" href="/el/admin/master/list?pno=${num}&category=${svo.category}&keyword=${svo.keyword}">${num}</a>                        		
                        	</c:if>
                        </li>
					</c:forEach>

                    <c:if test="${pv.currentPage != pv.maxPage }">
                        <li>
                            <c:if test="${empty svo }">
                                <a id="after" href="/el/admin/master/list?pno=${pv.currentPage+1}">다음</a>                       		
                            </c:if>
                            <c:if test="${!empty svo }">
                                <a id="after" href="/el/admin/master/list?pno=${pv.currentPage+1}&category=${svo.category}&keyword=${svo.keyword}">다음</a>                       		
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
        
        // 디테일
        function detailBtn(no) {
            window.location.href='/el/admin/master/detail?no='+no;
        }
        // 메일
        function sendMail(email,name){
            window.location.href="/el/admin/mail/send?address="+email;
        }




        // function quitBtn(no){
        //     if(confirm("탈퇴처리하시겠습니까?")){
        //         console.log('예');
        //         $.ajax({
        //             url : "/el/admin/master/quit",
        //             type : "post",
        //             data : {"no": no},
        //             success : function(result){
        //                 if(result == "ok"){
        //                     Swal.fire({
        //                         confirmButtonColor: '#1187CF',
        //                         title: '탈퇴처리되었습니다.'
        //                     });

        //                     window.location.href = "/el/admin/master/list?pno=1";
        //                 } else{
        //                     Swal.fire({
        //                         confirmButtonColor: '#1187CF',
        //                         title: '에러'
        //                     });
        //                 }
        //             },
        //             error : function(){
        //                 alert("실패");
        //             },
        //         });
        //     } else{
        //         console.log('아니오');
        //     }
        // }
    </script>
</body>
</html>