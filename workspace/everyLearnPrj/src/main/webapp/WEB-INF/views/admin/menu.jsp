<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<%-- <%
	String alertMsg = (String)session.getAttribute("resultMsg"); 
	session.removeAttribute("resultMsg");	
%>
	<script>
		<%if(alertMsg != null) {%>
            Swal.fire({
            confirmButtonColor: '#1187CF',
            title: '<%=alertMsg%>',
          });
		<%} %>
		
	</script> --%>
	<c:if test="${!empty resultMsg}">
		<script>
	        Swal.fire({
	            confirmButtonColor: '#1187CF',
	            title: '${resultMsg}'
	          });
		</script>	
	</c:if>

<aside class="menu-bar" id="menu-height">
    <nav>
        <div class="top">
            <a href="">
                <img src="/el/resources/img/admin/white-logo.png" alt="로고" width="170" height="170">
            </a>
            <div class="info-box">
                <a href="/el/admin/info">
                    <span>${loginAdmin.nick}</span>
                    <i class="bi bi-house-door"></i>
                </a>
            </div>
        </div>
        <div class="menu-middle">
            <ul>
                <li class="nav-items" id="dashboard">
                    <a class="nav-items-a" href="/el/admin/dashboard">
                        <span>대시보드</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                </li>
                <li class="nav-items" id="member">
                    <a class="nav-items-a" href="/el/admin/member/student/list?pno=1">
                        <span>회원관리</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                    <div class="hidden-box" id="member-cate">
                        <div class="detail-wrap">
                            <ul>
                                <li class="detail-cate" id="student">
                                    <a href="/el/admin/member/student/list?pno=1">학생회원</a>
                                </li>
                                <li class="detail-cate" id="teacher">
                                    <a href="/el/admin/member/teacher/list?pno=1">강사회원</a>
                                </li>
                                <li class="detail-cate" id="corporate">
                                    <a href="/el/admin/member/corporate/list?pno=1">기업회원</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <!-- <li class="nav-items" id="class">
                    <a href="/el/admin/class/list">
                        <span>강의관리</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                </li> -->
                <li class="nav-items" id="customer">
                    <a class="nav-items-a" href="">
                        <span>고객센터</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                    <div class="hidden-box" id="customer-cate">
                        <div class="detail-wrap">
                            <ul>
                                <li class="detail-cate" id="notice">
                                    <a href="/el/notice/adminList">공지사항</a>
                                </li>
                                <li class="detail-cate" id="faq">
                                    <a href="/el/faq/adminList">자주묻는질문</a>
                                </li>
                                <li class="detail-cate" id="qna">
                                    <a href="">QNA</a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                </li>

                <!-- <li class="nav-items">
                    <a class="nav-items-a" href="">
                        <span>통계</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                </li> -->
                <li class="nav-items" id="request">
                    <a class="nav-items-a" href="/el/admin/request/list">
                        <span>요청관리</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                    <div class="hidden-box" id="request-cate">
                        <div class="detail-wrap">
                            <ul>
                                <li class="detail-cate" id="request-list">
                                    <a href="/el/admin/request/list">회원요청조회</a>
                                </li>
                                <li class="detail-cate" id="request-edit">
                                    <a href="/el/admin/request/edit">질문수정</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-items" id="report">
                    <a class="nav-items-a" href="/el/admin/report/list?pno=1">
                        <span>신고관리</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                </li>
                <li class="nav-items" id="admin">
                    <a class="nav-items-a" href="/el/admin/master/list?pno=1">
                        <span>관리자관리</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                    <div class="hidden-box" id="admin-cate">
                        <div class="detail-wrap">
                            <ul>
                                <li class="detail-cate" id="admin-list">
                                    <a href="/el/admin/master/list?pno=1">관리자조회</a>
                                </li>
                                <li class="detail-cate" id="admin-add">
                                    <a href="/el/admin/master/join">관리자등록</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-items" id="mail">
                    <a class="nav-items-a" href="/el/admin/mail/all-send">
                        <span>메일</span>
                        <i class="bi bi-chevron-compact-right"></i>
                    </a>
                    <div class="hidden-box" id="mail-cate">
                        <div class="detail-wrap">
                            <ul>
                                <li class="detail-cate" id="mail-allSend">
                                    <a href="/el/admin/mail/all-send">전체메일발송</a>
                                </li>
                                <li class="detail-cate" id="mail-send">
                                    <a href="/el/admin/mail/send">메일발송</a>
                                </li>
                                <li class="detail-cate" id="mail-list">
                                    <a href="/el/admin/mail/list">보낸내역</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                
            </ul>
        </div>
        <div class="menu-bottom">
            <a href="/el/admin/logout">
                <span>로그아웃</span>
                <i class="bi bi-box-arrow-right"></i>
            </a>
        </div>
    </nav>
</aside>