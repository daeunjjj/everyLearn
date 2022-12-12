<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/everylearn/request.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
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
			<div class="intro-btn">
				<div>
					<a href="#question">계속<i class="bi bi-arrow-return-left"></i></a>
				</div>
			</div>
		</section>
		<section id="question">
			<div>
				<form action="">
					<div class="main-wrap question-area">
						<fieldset>
							<legend>
								<div>에브리런에 어떤 것을 요청하고 싶은가요?</div>
							</legend>
							<div class="select-area">
								<label>
									<span>1</span>
									<span>새로운 강의를 듣고싶어요.</span>
									<input type="radio" name="request" value="1">
								</label>
							</div>
							<div class="select-area">
								<label>
									<span>2</span>
									<span>개선 및 기능 요청이 있어요.</span>
									<input type="radio" name="request" value="2">
								</label>
							</div>
							<div class="select-area"> 
								<label>
									<span>3</span>
									<span>개선 및 기능 요청이 있어요.</span>
									<input type="radio" name="request" value="3">
								</label>
							</div>
						</fieldset>

					</div>
				</form>
			</div>
		</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</main>

	
</body>
</html>