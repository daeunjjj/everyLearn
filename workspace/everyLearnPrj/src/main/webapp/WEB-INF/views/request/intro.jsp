<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 요청</title>
<link rel="stylesheet" href="/el/resources/css/everylearn/request.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<c:if test="${!empty msg}">
		<script>
	        Swal.fire({
	            confirmButtonColor: '#1187CF',
	            title: '${msg}'
	          });
		</script>	
	</c:if>
	<main id="container">
		<section id="feedback-header">
			<div class="feedback-wrap">
				<div>에브리런에게 바란다!</div>
				<div>자유롭게 피드백 남겨주시면, 더 좋은 서비스로 만들어 갈게요.</div>
			</div>
		</section>
		<section class="main-wrap">
			<div class="intro-area">
				<div class="intro-area-top">
					<div>에브리런에게 바라는 점을 남겨주세요!</div>
					<div>더 좋은 서비스를 만들기 위해서는 여러분들의 의견이 필요해요!<i class="bi bi-ear"></i></div>
				</div>
				<div class="intro-area-bottom">
					<div>
						<strong>잠깐!!</strong>
					</div>
					<div>
						<strong>이 곳은 상담창이 아닙니다. (답변이 제공되지 않아요!)</strong>
					</div>
					<div>
						<span>서비스 이용 중</span>
						<strong>오류를 발견</strong>
						<span>하거나 </span>
						<strong>답변이 필요한</strong>
						<span>문의는</span>
					</div>
					<div>
						<span>에브리런 우측 하단의</span>
						<strong>문의하기</strong>
						<span>버튼을 클릭해주세요!</span>
					</div>
				</div>
			</div>
			<div class="btn-area">
				<button type="button" onclick="Btn();">
					<span>계속
						<i class="bi bi-arrow-return-left"></i>
					</span>
				</button>
			</div>
		</section>
		
	<!--<%@ include file="/WEB-INF/views/common/footer.jsp" %>-->
	</main>
	<script>
		function Btn() {
			window.location.href = "/el/request#feedback-header";
		}
	</script>
	
</body>
</html>