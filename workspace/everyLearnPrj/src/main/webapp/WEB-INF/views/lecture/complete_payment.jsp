<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/lecture/complete_payment.css" />
<script src="https://kit.fontawesome.com/0c7f523053.js" crossorigin="anonymous"></script>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	
	
	<div class="wrap">
		<div id="wrap-top">
			<div id="cate-name">결제 완료</div>
		</div>

		<div id="complete-wrap">
			<div id="check-btn"><i class="fa-solid fa-circle-check fa-5x"></i></div>
			<div id="pay-com">결제가 완료되었습니다.</div>
			<div id="check-mypage"><a href="#"><button>마이페이지에서 확인하기</button></a></div>
		</div>
	</div>
	
	
	
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>