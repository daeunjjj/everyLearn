<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/el/resources/css/lecture/insert.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	
	<div class="wrap">
		<div id="wrap-top">
			<div id="cate-name">강의 등록</div>
		</div>
		<div id="insert-wrap">
			<table id="insert-table">
				<tr>
			        <td>이름</td>
			        <td><input type="text" name="cName"></td>
		      	</tr>
				<tr>
			        <td>카테고리</td>
			        <td>
						<select name="category" id="category-btn">
							<option value="drawing">드로잉</option>
							<option value="cook">요리/베이킹</option>
							<option value="workout">운동</option>
							<option value="music">음악</option>
							<option value="tech">IT</option>
							<option value="language">언어</option>
							<option value="finance">금융/재태크</option>
                		</select>
					</td>
		      	</tr>
				<tr>
			        <td>가격</td>
			        <td><input type="text" name="price" placeholder="숫자만 입력해주세요. 예) 49000"></td>
		      	</tr>
				<tr>
			        <td>강의 설명</td>
			        <td><textarea name="cContent" resize="none"></textarea></td>
		      	</tr>
				  <tr>
			        <td>썸네일</td>
			        <td><input type="file" id="fileinput" name="classThumb"></td>
		      	</tr>
				<tr>
			        <td>첨부파일</td>
			        <td><input type="file" id="fileinput" name="classFile"></td>
		      	</tr>
			</table>

			<div id="next"><a href="/el/lecture/insert/detail"><button type="submit" id="nextbtn">다음</button></a></div>
		</div>
		
		
	</div>
	
	
	</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>