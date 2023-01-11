<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>에브리런 채용</title>
<link rel="stylesheet" href="/el/resources/css/emp/main.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

	<%@ include file="/WEB-INF/views/common/emp-header.jsp"%>

	<main id="container">
		<div id="slide-area">
			<div class="slide-items">
				<div style="width: 100%; height: 250px; ">
					<div id="carousel-example-generic" class="carousel slide" >
					  <ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					  </ol>
					  <div class="carousel-inner" role="listbox">
						<div class="item active">
								<img src="/el/resources/img/main/banner02.png" style="width:100% ; height:250px; ">
						</div>
						<div class="item">
						  <img src="/el/resources/img/main/corp-banner01.png" style="width:100%  ; height:250px;  ">
						</div>
						<div class="item">
						  <img src="/el/resources/img/main/corp-banner02.png" style="width:100%  ; height:250px;  ">
						</div>
					  </div>
					  <a id="right" class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					  </a>
					  <a id="left" class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					  </a>
					</div>
				  </div>
			</div>
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
										<img src="/el/resources/upload/${list.thumb}" alt="img">
									</figure>
									<div class="emp-info">
										<div>
											<div class="emp-name">${list.companyName}</div>
											<a href="/el/emp/position?no=${list.no}" class="position">${list.title}</a>
										</div>
										<ul class="skill">
											<li>${list.sector}</li>
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

	<script>
		$(function(){
			$('#carousel-example-generic').carousel({
				interval: 5000,
				pause: "hover",
				wrap: true,
				keyboard : true
			});
		});
	</script>

</body>

</html>