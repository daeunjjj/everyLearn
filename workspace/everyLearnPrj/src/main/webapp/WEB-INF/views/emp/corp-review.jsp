<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/emp/main.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="stylesheet" href="/el/resources/css/emp/corp-review.css">
</head>

<body>

	<%@ include file="/WEB-INF/views/common/emp-header.jsp"%>

	<main id="container">
			<div class="jobContent">
				<div class="post">
					<header class="header">
						<h6>
							<img src="/el/resources/upload/${vo.logo}" alt="">${vo.companyName}
						</h6>
						<h1>${vo.title}</h1>
					</header>
					<div class="thumb-wrapper">
						<img src="/el/resources/upload/${vo.thumb}" alt="" class="thumb">
					</div>
					<section class="jobDetail">
						<div class="items">
							<h3>회사 소개</h3>
							${vo.introduce}
						</div>
						<div class="items">
							<h3>주요업무</h3>
							${vo.responsibility}
						</div>
						<div class="items">
							<h3>자격요건</h3>
							${vo.qualification}
						</div>
						<div class="items">
							<h3>우대사항</h3>
							${vo.preferential}
						</div>
						<div class="items">
							<h3>혜택 및 복지</h3>
							${vo.benefits}
						</div>
						<div class="items">
							<h3>근무 지역</h3>
							${vo.companyAddress}
						</div>
					</section>
					<section>
						<div class="separator"></div>
						<div class="items">
							<h3>기업 후기</h3>
						</div>
						
					</section>
				</div>
				<aside class="aside">
					<dl>
						<dd>경력</dd>
						<dt>${vo.career}</dt>
					</dl>
					<dl>
						<dd>최소 연봉</dd>
						<dt>${vo.salary} 만원</dt>
					</dl>
					<dl>
						<dd>직군</dd>
						<dt>${vo.sector}</dt>
					</dl>
					<dl>
						<dd>지역</dd>
						<dt>${vo.address}</dt>
					</dl>
				</aside>
			</div>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>

</html>