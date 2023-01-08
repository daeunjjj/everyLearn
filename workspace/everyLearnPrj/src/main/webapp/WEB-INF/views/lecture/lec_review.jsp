<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/0c7f523053.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/el/resources/css/lecture/lec_review.css" />
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	<div class="wrap">
		<div class= "lec-intro">
			<div id="lec-pic"><img src="/el/resources/img/lecture/lecpic3.png"></div>
			<div id="lec-int">
				<div id="lec-cate">${lvo.category }</div>
				<div id="lec-name">${lvo.className }</div>
				<div id="lec-stars">
				
				<!-- 별점 개수 조절 -->
				<c:choose>

								<c:when test="${lvo.revAvg <= 1.5 }">
								★
								</c:when>
								<c:when test="${lvo.revAvg <= 2.5 }">
								★★
								</c:when>
								<c:when test="${lvo.revAvg <= 3.5 }">
								★★★
								</c:when>
								<c:when test="${lvo.revAvg <= 4.5 }">
								★★★★
								</c:when>
								
								<c:otherwise>
								★★★★★
								</c:otherwise>
							
							</c:choose>
				
				
( ${lvo.revAvg } / 5.0 )</div>
				<div id="lec-recom">이 강의를 ${lvo.recomm }명이 조회했습니다!</div>
				<div id="lec-teacher"><i class="fa-regular fa-user"></i>${lvo.teacherNo }</div>
				</div>
		</div>
	
		 <div class= "navi">
            <div><a href="/el/lecture/detail?bno=${bno }">강의소개</a></div>
            <div><a href="/el/lecture/detail/review?bno=${bno }&pno=1">수강평</a></div>
        </div>
        <div class = "lec-main">
            <div id="lec-content">
				<div id="lec-review">
					<div id="review-top">수강평</div>
					<div id="stars-top">★&nbsp ${lvo.revAvg } (${lvo.reviewCnt }개)</div>
					<div>실제 수강생의 리뷰입니다. 생생한 후기를 확인하세요!</div>
				</div>
				
				<div id="write-wrap">
				<c:choose>
				<c:when test = "${checkReview > 0 }">
					<div id="sunglasses">작성된 리뷰가 있습니다. 리뷰를 확인해주세요. 📝</div>
				</c:when>
				<c:when test="${checkBuy > 0 }">
					<form action="/el/lecture/detail/review" method="post">
						<fieldset name="myform" id="myform">
							<span class="myratings" style="color: #ccc;"></span>
							
							<input type="radio" name="score" value="5.0" id="rate1"><label for="rate1">★</label>
							<input type="radio" name="score" value="4.0" id="rate2"><label for="rate2">★</label>
							<input type="radio" name="score" value="3.0" id="rate3"><label for="rate3">★</label>
							<input type="radio" name="score" value="2.0" id="rate4"><label for="rate4">★</label>
							<input type="radio" name="score" value="1.0" id="rate5"><label for="rate5">★</label>
						</fieldset>
							<input type="hidden" name="bno" value="${bno }">
							<input type="hidden" value="${loginMember.memberNo}" name="writer" >
							<input type="text" id="write-input" name="content" placeholder="수강평을 남겨주세요">
							
							<br>
							<input type="submit" id="write-submit" value="작성" style="float: right;">
					</form>
					</c:when>
				<c:otherwise>
					<div id="sunglasses">강의를 구매한 후에 리뷰를 남길 수 있습니다. 😎</div>
				</c:otherwise>
				</c:choose>
				</div>
				
			
				
				<c:forEach items="${reviewList }" var="list">
					<c:if test="${empty reviewList}">
						<span>등록된 리뷰가 없습니다.</span>
					</c:if>
					
					<div id="written-review">
						<div id="profile-pic"><img src="/el/resources/img/el로고.png"></div>
	
						<div id="stars">
							<c:choose>

								<c:when test="${list.score == 5 }">
								★★★★★
								</c:when>
								<c:when test="${list.score == 4 }">
								★★★★
								</c:when>
								<c:when test="${list.score == 3 }">
								★★★
								</c:when>
								<c:when test="${list.score == 2 }">
								★★
								</c:when>
								
								<c:otherwise>
								★
								</c:otherwise>
							
							</c:choose>
						</div>
						<div id="enroll-date">${list.enrollDate}</div>
						<div id="written-nick"><i class="fa-regular fa-user"></i>${list.writer}</div>
						<div id="review-content">${list.content}</div>
						
						  <c:choose>
                        	<c:when test="${loginMember.memberNick eq list.writer}">
							<!-- 리뷰 수정 -->
								<div>
								
									<form action="/el/lecture/detail/review/edit" method="get">
										<input type="hidden" name="rno" value=${list.no }>
										<input type="hidden" name="bno" value="${bno }">
										<input type="submit" id="write-submit"  value="수정">
									</form>
								</div>
								
								<!-- 리뷰 삭제 -->
								<div>
									<form action="/el/lecture/detail/review/delete" method="post">
									<input type="hidden" name="reviewNo" value=${list.no }>
									<input type="hidden" name="bno" value="${bno }">
									<input type="submit" id="write-submit"  value="삭제">
									</form>
								
								</div>
							</c:when>
						</c:choose>
					</div>
				</c:forEach>
				
				
				<!-- 페이징 -->
				
			    <!-- 페이징 -->
	    <div id="page-area" class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
                <div id="page-area2" class="btn-group me-2" role="group" aria-label="First group">
	                <a href="/el/lecture/detail/review?bno=${list.classNo }&pno=${pv.currentPage-1}" class="btn btn-outline-secondary"><</a>
	                                    
                    <c:forEach var="num" begin="${pv.startPage }" end="${pv.endPage }">
                        <a href="/el/lecture/detail/review?bno=${lvo.no }&pno=${num }" class="btn btn-outline-secondary">${num}</a>
					</c:forEach>
			
	                <a href="/el/lecture/main?pno=${pv.currentPage+1}"class="btn btn-outline-secondary">></a>
                </div>
       	</div>
		       


			</div>
			
            <div id="lec-payment">
                <div id="pay-wrap">
                    <div id="pay-price">${lvo.price} 원</div>
                    
                    <c:choose> 
	                    <c:when test="${checkWish == 0 }"> 
		                    <form action="/el/cart/addWish" method="post">
			                    <input type="hidden" name="classNo" value="${lvo.no }">
			                    <input type="hidden" name="memberNo" value="${loginMember.memberNo }">
		                    	<div id="pay-zzim"><input type="image" src="/el/resources/img/lecture/heart.png"/></div>
		                    </form>
	                  </c:when>
	                  <c:otherwise>
	                  	
	                    	<div id="pay-zzim"><a href="/el/cart/addWish" width="50px" height="50px"><img src="/el/resources/img/lecture/heartred.png" id="whywhy" width="50px" height="50px"/></a></div>
	                   
	                  </c:otherwise>
                    </c:choose>
                    <!--  <div id="pay-zzim"><a href="/el/cart/wish"><i class="fa-regular fa-heart fa-2x"></i></a></div>-->
                    <form action="/el/cart/addCart" method="post">
	                    <input type="hidden" name="classNo" value="${lvo.no }">
	                    <input type="hidden" name="memberNo" value="${loginMember.memberNo }">
	                    
	                <c:choose>
	                	<c:when test="${checkBuy != 0 }">
	                		<div id="pay-cart"><a href="#"><button type = "button" id="pay-cart"  >학습하러 가기</button></a></div>
	                	</c:when>
	                	<c:when test="${checkCart != 0 }">
	                		<div><a href="/el/cart/addCart"><button type ="button" id="pay-cart" onclick="checkCart()">장바구니로 이동</button></a></div>
	                	</c:when>
	                	<c:otherwise>
	                    	<div><input id="pay-cart" type="submit" value="장바구니에 담기"></div>
	                	</c:otherwise>
	                </c:choose>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
		
	
	
	
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>