<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/member/writeList.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- <script type="text/javascript" src="/el/resources/js/member/member_alert.js"></script> -->
        <script src="/el/resources/js/member/sidebar.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
            <main id="container">

                <div id="sidebar">
                    <%@ include file="/WEB-INF/views/member/member_sidebar.jsp" %>
                </div>
                <br><br>
                <div id="wrap">
                    <br><br>

                    <div id="writeList-main">
                        <div id="writeList-wrap">
                            <div id="writeList">작성글</div>
                            <br>
                            <div><strong></strong></div>
                            <br>
                        </div>
                    </div>


                  
                    <nav class="navbar navbar-expand-sm bg-light navbar-light" style="width: 700px; border-radius: 10px; background-color: #1187CF;">
                        <div class="container-fluid">
                          <ul class="navbar-nav">
                            <li class="nav-item">
                              <a id="community" class="nav-link active" href="/el/member/writeList?memberNo=${loginMember.memberNo}" style="width: 100px; text-align: center; font-size: medium; font-weight: 700; color: gray;"> 커뮤니티</a>
                            </li>   
                            <li class="nav-item">
                                <a class="nav-link active" href="/el/member/writeListClass?mNo=${loginMember.memberNo}" style="width: 100px; text-align: center; font-size: medium; font-weight: 700; color: gray;"> 수강후기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#" style="width: 100px; text-align: center; font-size: medium; font-weight: 700; color: gray;"> 채용후기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#" style="width: 100px; text-align: center; font-size: medium; font-weight: 700; color: gray;">댓글</a>
                            </li>
                          </ul>
                        </div>
                      </nav>
                  
                    <div class="container mt-3" style="margin-top: 0px; ">
                    <table class="table table-hover" style="width: 650px !important;">
                    <c:choose> 
					<c:when test="${commWriteList != null }">
                            <thead>
                                <tr id="write-top">
                                    <th>카테고리</th>
                                    <th>제목</th>
                                    <th>등록일시</th>
                                </tr>
                            </thead>
                            <tbody>

								<c:forEach items="${commWriteList}" var="commWrite">
	                                <tr style="text-align: center;">
	                                    <td id="write-cate">${commWrite.category}</td>
	                                    <td id="write-title"><a href="/el/class/detail?classCommNo=${commWrite.classCommNo}">${commWrite.title}</a></td>
	                                    <td id="write-date">${commWrite.enrollDate}</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </c:when> 
                        <c:when test="${classReviewList != null }">
                            <thead>
                                <tr id="write-top">
                                    <th>강의명</th>
                                    <th>내용</th>
                                    <th>등록일시</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:forEach items="${classReviewList}" var="classReview">
	                                <tr style="text-align: center;">
	                                    <td id="write-cate">${classReview.className}</td>
	                                    <td id="write-title"><a href="/el/lecture/detail?bno=${classReview.classNo}">${classReview.content}</a></td>
	                                    <td id="write-date">${classReview.enrollDate}</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </c:when> 
                        <c:otherwise>
                            count가 20보다 큰 경우
                        </c:otherwise> 
                    </c:choose> 
                    </table>

                    </div>

                    <br>
                    <div class="container mt-3" id="page-alert" style="width: 600px;">
                        <ul class="pagination" id="pagenation">
                            
                            <li class="page-item"><a class="page-link" href="#">이전</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#" id="page-active">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">다음</a></li>
                        </ul>
                    </div>


                </div>

            </main>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>

    </html>