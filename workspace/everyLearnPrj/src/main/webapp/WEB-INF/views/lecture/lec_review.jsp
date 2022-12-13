<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/0c7f523053.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/el/resources/css/lecture/lec_review.css" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	<div class="wrap">
		<div class= "lec-intro">
			<div id="lec-pic"><img src="/el/resources/img/lecture/lecpic2.png"></div>
			<div id="lec-int">
				<div id="lec-cate">드로잉</div>
				<div id="lec-name">아이패드로 일상 그리기, 프로크리에이트를 이용한 드로잉 클래스</div>
				<div id="lec-stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>(4.9 / 5.0)</div>
				<div id="lec-recom">이 강의를 775명이 추천합니다!</div>
				<div id="lec-teacher"><i class="fa-regular fa-user"></i>강사이름</div>
				</div>
		</div>
	
		 <div class= "navi">
            <div><a href="/el/lecture/detail">강의소개</a></div>
            <div><a href="/el/lecture/detail/review">수강평</a></div>
        </div>
        <div class = "lec-main">
            <div id="lec-content">
				<div id="lec-review">
					<div id="review-top">수강평</div>
					<div id="stars-top"><i class="fa-solid fa-star"></i>&nbsp 4.9 (127개)</div>
					<div>실제 수강생의 리뷰입니다. 생생한 후기를 확인하세요!</div>
				</div>
				<div id="write-wrap">
					<form action="">
						<fieldset name="myform" id="myform">
							<span class="myratings" style="color: #ccc;"></span>
							
							<input type="radio" name="score" value="5.0" id="rate1"><label for="rate1">★</label>
							<input type="radio" name="score" value="4.0" id="rate2"><label for="rate2">★</label>
							<input type="radio" name="score" value="3.0" id="rate3"><label for="rate3">★</label>
							<input type="radio" name="score" value="2.0" id="rate4"><label for="rate4">★</label>
							<input type="radio" name="score" value="1.0" id="rate5"><label for="rate5">★</label>
						</fieldset>
							<input type="text" id="write-input" name="review" placeholder="수강평을 남겨주세요">
							<br>
							<input type="submit" id="write-submit" value="작성" style="float: right;">
					</form>
				</div>
				
			
				<div id="written-review">
					<div id="profile-pic"><img src="/el/resources/img/el로고.png"></div>

					<div id="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
					<div id="enroll-date">2022.12.07</div>
					<div id="written-nick"><i class="fa-regular fa-user"></i>유저닉네임</div>
					<div id="review-content">이 강의를 듣고 인스타툰을 그리고 싶어졌어요! 좋은 강의 감사합니다~~~</div>
				</div>
				<div id="written-review">
					<div id="profile-pic"><img src="/el/resources/img/el로고.png"></div>

					<div id="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
					<div id="enroll-date">2022.12.07</div>
					<div id="written-nick"><i class="fa-regular fa-user"></i>유저닉네임</div>
					<div id="review-content">이 강의를 듣고 인스타툰을 그리고 싶어졌어요! 좋은 강의 감사합니다~~~</div>
				</div>
				<div id="written-review">
					<div id="profile-pic"><img src="/el/resources/img/el로고.png"></div>

					<div id="stars"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
					<div id="enroll-date">2022.12.07</div>
					<div id="written-nick"><i class="fa-regular fa-user"></i>유저닉네임</div>
					<div id="review-content">이 강의를 듣고 인스타툰을 그리고 싶어졌어요! 좋은 강의 감사합니다~~~</div>
				</div>


			</div>
			
            <div id="lec-payment">
                <div id="pay-wrap">
                    <div id="pay-price">49,000 원</div>
                    <div id="pay-zzim"><i class="fa-regular fa-heart fa-2x"></i></div>
                    <div id="pay-cart">장바구니에 담기</div>
                    <div id="pay-real">결제하기</div>
                </div>
            </div>
        </div>
    </div>
		
	
	
	
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>