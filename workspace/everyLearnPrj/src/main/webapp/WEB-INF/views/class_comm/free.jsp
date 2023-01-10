<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/class_comm/free.css"
	rel="stylesheet" type="text/css">

</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<main id="container">

		<div id="sidebar">
			<%@ include file="/WEB-INF/views/class_comm/sidebar.jsp"%>
		</div>

		<div id="contain">
				<div id="title">
					<br> <br>
					<h2>자유게시판</h2>
					<pre>
자유롭게 이야기를 나누는 공간
에브리런 회원들과 대화를 나눠보세요~
                </pre>
				</div>
				
				<h2 style="text-align: center; margin-bottom: 30px;">자유게시판</h2>
<pre style="text-align: center;">
자유롭게 이야기를 나누는 공간
에브리런 회원들과 대화를 나눠보세요~
                </pre>
				<div id="serch">
					<input class="search_input" type="text" placeholder="검색어를 입력해주세요.">
				</div>
				<!-- <div id="btn-write" class="btn-write">
                <button class="btn-write" type="button">글쓰기</button>
            </div> -->
			<div id="wrap-comm">
				<div id="orderby">
					<ul>
						<li class="list"><button class="orderby"
								onclick="location.href='/el/class/free?orderBy=ENROLL_DATE DESC'">•
								최신순</button></li>
						<li class="list"><button class="orderby"
								onclick="location.href='/el/class/free?orderBy=HIT DESC'">•
								조회순</button></li>
						<li class="list"><button class="orderby"
								onclick="location.href='/el/class/free?orderBy=ENROLL_DATE DESC'">•
								좋아요순</button></li>
						<li><button class="orderby" style="width: 365px;"></button></li>

						<li class="list"><button type="button" class="orderby"
								onclick="location.href='/el/class/write'">글쓰기</button></li>
					</ul>
				</div>
					<%-- ${fn:length(freeList) } --%>
				<div id="free-wrap">
					<div id="free-top">
						<div>글번호</div>
						<div>제목</div>
						<div>조회수</div>
					</div>
					<c:forEach items="${freeList }" var="free" varStatus="status" >

						<div id="free-main">
						<div style="width: 77px;">
      						${status.count}
							
						</div>

							<div id="title-wrap">
								<a id="title"
									href="/el/class/detail?classCommNo=${free.classCommNo}&lc=${loginMember.memberNo}">${free.title}</a>
							</div>
							<div>
								<a href="">${free.hit }</a>
							</div>
						</div>
					</c:forEach>



					<div class="container mt-3" id="page-alert">
						<ul class="pagination" id="pagenation">
							<li class="page-item"><a class="page-link" href="#">이전</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item active"><a class="page-link" href="#"
								id="page-active">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">다음</a></li>
						</ul>
					</div>


				</div>
			</div>




		</div>

	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>



</html>