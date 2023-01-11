<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
</head>
<link rel="stylesheet" href="/el/resources/css/common/main.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>

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
							<a href="">
								<img src="/el/resources/img/main/banner01.png" style="width:100% ; height:250px; ">
							</a>
						</div>
						<div class="item">
						  <a href="">
						  <img src="/el/resources/img/main/banner02.png" style="width:100%  ; height:250px;  ">
						  </a>
						</div>
						<div class="item">
						<a href="">
						  <img src="/el/resources/img/main/banner03.png" style="width:100%  ; height:250px;  ">
						</a>  
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
		<div class="middle-wrap">
			<div class="title">
				<a class="recommend a" href="">
					<span>추천학습</span>
					<i class="bi bi-chevron-right"></i>
				</a>
			</div>
			<div class="middle-items">
				<div class="item">
					<a class="a" href="">
						<img src="/el/resources/img/main/class1.png" alt="" style="width:300px ; height:200px; ">
						<div class="class-title">강의 제목</div>
					</a>
				</div>
				<div class="item">
					<a class="a" href="">
						<img src="/el/resources/img/main/class2.png" alt="" style="width:300px ; height:200px; ">
						<div class="class-title">강의 제목</div>
					</a>
				</div>
				<div class="item">
					<a class="a" href="">
						<img src="/el/resources/img/main/class3.png" alt="" style="width:300px; height:200px; ">
						<div class="class-title">강의 제목</div>
					</a>
				</div>
			</div>
			<div class="title">
				<a class="recommend a" href="">
					<span>에브리런 TOP3 강의</span>
					<i class="bi bi-chevron-right"></i>
				</a>
			</div>
			<div class="middle-items">
				<div class="item">
					<a class="a" class="a" href="">
						<img src="/el/resources/img/main/class1.png" alt="" style="width:300px ; height:200px; ">
						<div class="class-title">강의 제목</div>
					</a>
				</div>
				<div class="item">
					<a class="a" href="">
						<img src="/el/resources/img/main/class2.png" alt="" style="width:300px ; height:200px; ">
						<div class="class-title">맥주마시고싶다~~~길이길이길이~~~ 두줄두줄두줄</div>
					</a>
				</div>
				<div class="item">
					<a class="a" href="">
						<img src="/el/resources/img/main/class3.png" alt="" style="width:300px; height:200px; ">
						<div class="class-title">귀염강쥐강쥐~~~</div>
					</a>
				</div>
			</div>
			<div class="title">
				<div class="service a">
					<span>다양한 서비스를 신청하세요.</span>
					<p>에브리런에게 도움을 주세요!!</p>
				</div>
			</div>
			<div class="bottom-items">
				<div class="box">
					<div class="subtitle">런문가 되기</div>
					<div class="text">
						나의 지식을 나눠 사람들에게 배움의<br> 
						기회를 주세요.
					</div>
					<div class="a-wrap">
						<a class="abtn" href="">참여하기</a>
					</div>
				</div>
				<div class="box">
					<div class="subtitle">기업 등록</div>
					<div class="text">
						에브리런을 통해 인재를 찾으세요!
					</div>
					<div class="a-wrap">
						<a class="abtn" href="">등록하기</a>
					</div>
				</div>
				<div class="box">
					<div class="subtitle">기능 요청</div>
					<div class="text">
						원하는 기능 및 강의를 요청해주세요.
						<br>
						피드백으로 성정하는 에브리런!
					</div>
					<div class="a-wrap">
						<a class="abtn" href="">요청하기</a>
					</div>
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
		


		function getAdWindow() {
			const url = "/el/adWindow";
            window.open(url, "child","width=450px height=400px top=50% left=50%");
		}

        </script>

	<c:if test="${cookie.adCheck.value == null}">
		<script>
			getAdWindow();
		</script>
	</c:if>


</body>
</html>