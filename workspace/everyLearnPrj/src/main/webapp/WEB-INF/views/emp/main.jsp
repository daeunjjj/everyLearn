<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/emp/main.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
</head>

<body>

	<%@ include file="/WEB-INF/views/common/emp-header.jsp"%>

	<main id="container">
		<div class="advertisment">
			<img src="" alt="">
		</div>
		<div class="emp-container">
			<div class="emp">
				<div class="emp-wrapper">
					<div class="emp-header">
						<p class="hiring">채용중인 공고</p>
						<div class="hiring-wrapper">
							<a href="/el/emp/job-post" class="hiring-detail">전체보기</a>
						</div>
					</div>
					<ul class="announcement">
					<c:forEach items="${list}" var="list" begin="0" end="11" step="1">
						<li>
							<div class="announcement-wrapper">
								<a href="/el/emp/position?no=${list.no}">
									<figure class="img-wrapper">
										<img src="/el/resources/img/logo/logo_white.png" alt="img">
									</figure>
									<div class="emp-info">
										<div>
											<div class="emp-name">${list.companyName}</div>
											<a href="/el/emp/position?no=${list.no}" class="position">${list.title}</a>
										</div>
										<ul class="skill">
											<li>Java</li>
											<li>Spring</li>
										</ul>
										<div class="etc">
											<span>${list.career} | </span> <span>${list.address}</span>
										</div>
									</div>
								</a>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>

</html>