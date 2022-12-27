<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/lecture/lec_review.css" />
</head>
<body>
	<div id="write-wrap">
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
							<input type="hidden" name="rno" value="${rno }">
							<input type="hidden" value="${loginMember.memberNo}" name="writer" >
							<input type="text" id="write-input" name="content" placeholder="수강평을 남겨주세요">
							
							<br>
							<input type="submit" id="write-submit" value="수정" style="float: right;">
					</form>
				</div>

</body>
</html>