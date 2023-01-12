<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>everyLearn</title>

<link rel="stylesheet" href="/el/resources/css/lecture/insert.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	
	<div class="wrap">
		<div id="wrap-top">
			<div id="cate-name">강의 등록</div>
		</div>
		<div id="insert-wrap">
		<form action="/el/lecture/insert" method="post" enctype="multipart/form-data">
			<input type="hidden" name="teacherNo" value="${loginMember.memberNo}">
			<table id="insert-table">
				<tr>
			        <td>이름</td>
			        <td><input type="text" name="className"></td>
		      	</tr>
				<tr>
			        <td>카테고리</td>
			        <td>
						<select name="category" id="category-btn">
							<option value="1">드로잉</option>
							<option value="2">요리/베이킹</option>
							<option value="3">운동</option>
							<option value="4">음악</option>
							<option value="5">IT</option>
							<option value="6">언어</option>
							<option value="7">금융/재태크</option>
                		</select>
					</td>
		      	</tr>
				<tr>
			        <td>가격</td>
			        <td><input type="text" name="price" placeholder="숫자만 입력해주세요. 예) 49000"></td>
		      	</tr>
				<tr>
			        <td>강의 설명</td>
			        <td><textarea name="classContent" resize="none"></textarea></td>
		      	</tr>
				  <tr>
			        <td>썸네일</td>
			        <td><input type="file" id="fileinput" name="thumbFile"></td>
		      	</tr>
				<tr>
			        <td>첨부파일</td>
			        <td><input type="file" id="fileinput" name="logoFile"></td>
		      	</tr>
			</table>
			<div id="next"><input type="submit" id="nextbtn" value="다음"></div>
		</form>

			
			
		</div>
		
		
	
	
	</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>


</html>