<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/0c7f523053.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/el/resources/css/lecture/cart.css" />
</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	
	<div class="wrap">
		<div id="wrap-top">
			<div id="cate-name">장바구니</div>
			<div id="carts-num">5개 강의가 장바구니에 있습니다.</div>
			<div id="check-yn"><i class="fas fa-thin fa-square-check"></i>선택 해제</div>
		</div>
		<div id="cart-wrap">
			<div id="cart-item">
				<div id="leccart-check"><i class="fas fa-thin fa-square-check"></i></div>
				<div id="leccart-img"><a href='#'><img src="/el/resources/img/lecture/lecpic.png" alt="강의이미지"></a></div>
				<div id="leccart-name">아이패드로 일상 그리기, 프로크리에트를 이용한 드로잉 클래스</div>
				<div id="leccart-price">49,900원</div>
				<div id="leccart-teacher">강사이름</div>
			</div>
			<div id="cart-item">
				<div id="leccart-check"><i class="fas fa-thin fa-square-check"></i></div>
				<div id="leccart-img"><a href='#'><img src="/el/resources/img/lecture/lecpic.png" alt="강의이미지"></a></div>
				<div id="leccart-name">아이패드로 일상 그리기, 프로크리에트를 이용한 드로잉 클래스</div>
				<div id="leccart-price">49,900원</div>
				<div id="leccart-teacher">강사이름</div>
			</div>
			<div id="cart-item">
				<div id="leccart-check"><i class="fas fa-thin fa-square-check"></i></div>
				<div id="leccart-img"><a href='#'><img src="/el/resources/img/lecture/lecpic.png" alt="강의이미지"></a></div>
				<div id="leccart-name">아이패드로 일상 그리기, 프로크리에트를 이용한 드로잉 클래스</div>
				<div id="leccart-price">49,900원</div>
				<div id="leccart-teacher">강사이름</div>
			</div>
			<div id="cart-item">
				<div id="leccart-check"><i class="fas fa-thin fa-square-check"></i></div>
				<div id="leccart-img"><a href='#'><img src="/el/resources/img/lecture/lecpic.png" alt="강의이미지"></a></div>
				<div id="leccart-name">아이패드로 일상 그리기, 프로크리에트를 이용한 드로잉 클래스</div>
				<div id="leccart-price">49,900원</div>
				<div id="leccart-teacher">강사이름</div>
			</div>
			<div id="cart-item">
				<div id="leccart-check"><i class="fas fa-thin fa-square-check"></i></div>
				<div id="leccart-img"><a href='#'><img src="/el/resources/img/lecture/lecpic.png" alt="강의이미지"></a></div>
				<div id="leccart-name">아이패드로 일상 그리기, 프로크리에트를 이용한 드로잉 클래스</div>
				<div id="leccart-price">49,900원</div>
				<div id="leccart-teacher">강사이름</div>
			</div>

		</div>
		<div id="pay-wrap">
			<div id="pay-square">
				<div id="all-pr">선택 상품 금액</div>
				<div id="all-price">249,500원</div>
				<div id="using-po">포인트 사용</div>
				<div id="using-point">1800원</div>
				<div id="usable-point">보유금액 2000원</div>
				<div id="checked-pr">결제금액</div>
				<div id="checked-price">247,700원</div>
				<div><button>결제하기</button></div>
			</div>
		</div>

	</div>

	</main>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>