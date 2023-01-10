<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/teacher/detail.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/common/detail.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
  		
            <h1>강사회원</h1>
            <div id="line"></div>
           	<div class="main-wrap">
                <div class="profile-wrap">
                    <div class="resume-top">
                        <h2>강사정보</h2>
                        <div class="flex-items" id="profile-wrap">
                            <div>프로필사진</div>
                            <div>
                                <img src="/el/resources/upload/imgTeacher/${map.tvo.changeName }" alt="프로필사진" width="150" height="200">
                            </div>
                        </div>
                        <div class="flex-items">
                            <div>이름</div>
                            <div>${map.tvo.name}</div>
                        </div>
                        <div class="flex-items">
                            <div>아이디</div>
                            <div>${map.tvo.id }</div>
                        </div>
                        <div class="flex-items">
                            <div>분야</div>
                            <div>${map.tvo.classCate }</div>
                        </div>
                        <div class="flex-items">
                            <div>경력</div>
                            <div>${map.tvo.career }</div>
                        </div>
                        <div class="flex-items">
                            <div>전화번호</div>
                            <div>${map.tvo.phone }</div>
                        </div>
                        <div class="flex-items">
                            <div>이메일</div>
                            <div>${map.tvo.email }</div>
                        </div>
                    </div>
                    <div class="resume-bottom">
                        <div class="bottom-wrap">
                            <div>이력</div>
                            <div>
                                <i class="bi bi-dot"></i>
                                <a href="/el/resources/upload/record/${map.tvo.changeName2 }" download="${map.tvo.changeName2 }">${map.tvo.changeName2 }</a>
                            </div>
                        </div>
                       <div class="bottom-wrap">
                            <div>포부</div>
                            <div id="short-intro-content">
							${map.tvo.shortIntro}
                            </div>
                        </div>
                        <div class="bottom-wrap">
                            <div>자기소개</div>
                            <div id="intro-content">
							${map.tvo.introduce}
                            </div>
                        </div>

                    </div>
                    <c:if test="${!empty map.voList }">
                    	 <div class="detail-list-wrap">
                        <h3>강의목록</h3>
                        <div class="detail-list-area">
                            <div>강의명</div>
                            <div>가격</div>
                            <div>최종수정</div>
                            <div>추천수</div>
                            <div>수강생수</div>
                            <div>좋아요</div>
                            <div>관리</div>
                        </div>
                        <div>
                            <ul>
								<c:forEach items="${map.voList}" var="list">
									<li class="detail-list-area">
	                                    <div>
	                                        <a href="/el/lecture/detail?bno=${list.no}" target="_blank">
	                                            ${list.className }	
	                                            <i class="bi bi-box-arrow-up-right"></i>
	                                        </a>
	                                    </div>
	                                    <div>${list.price }	</div>
	                                    <div>${list.modifyDate }	</div>
	                                    <div>${list.recomm }	</div>
	                                    <div>${list.studentCnt }	</div>
                                        <div>${list.classCnt}</div>
	                                    <div>
	                                    <form action="/el/admin/member/teacher/class/delete" method="post" onsubmit="return deleteCheck();">
	                                    	<input name="cno" value="${list.no}" hidden>
	                                    	<input name="no" value="${map.tvo.no}" hidden>
	                                        <c:if test="${list.deleteYn eq 'N' }">
	                                        	<button type="submit">강의중</button>	
	                                        </c:if>
                                     	    <c:if test="${list.deleteYn eq 'Y' }">
	                                        	<button type="button" disabled="disabled" id="non-click">폐강</button>	
	                                        </c:if>                                      
	                                    </form>
	                                    </div>
	                                </li>
								</c:forEach>
                            </ul>
                        </div>
                    </div>
                    </c:if>
                   	
                    <form method="post">
                        <div class="btn-area">
                            <input name="arrNo" value="${map.tvo.no}" hidden>
                            <input name="no" value="${map.tvo.no}" hidden>
                            <button type="submit" formaction="/el/admin/member/teacher/delete" id="refusal-btn" name="result" value="delete">탈락</button>
                            <c:if test="${map.tvo.statusYn eq 'N' }">
                                <button type="submit" formaction="/el/admin/member/teacher/approval" id="approval-btn" >승인</button>                        
                            </c:if>
                        </div>
                    </form>
                </div>
           	</div>
	

        </main>
    </div>
    <script>
        function deleteCheck() {
            
            if(!confirm("정말 폐강시키겠습니까?")){
                return false;
            } else{
                return true;
            }
            
        }
        
    const status = '${map.tvo.statusYn}';

    if(status == 'Y'){
        $('#refusal-btn').text('승인취소');
    } else{
        $('#refusal-btn').text('탈락');
    }
    </script>
</body>
</html>