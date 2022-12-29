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
<link rel="stylesheet" href="/el/resources/css/emp/job-post-detail.css">
<link rel="icon" type="image/png" sizes="16x16"
	href="/el/resources/img/logo/favicon-16x16.png">
</head>

<body>

	<%@ include file="/WEB-INF/views/common/emp-header.jsp"%>

	<main id="container">
			<div class="jobContent">
				<div class="post">
					<header class="header">
						<h6>
							<img src="/el/resources/upload/${jp.logo}" alt="">${jp.companyName}</h6>
						<h1>${jp.title}</h1>
					</header>
					<div class="thumb-wrapper">
						<img src="/el/resources/upload/${jp.thumb}" alt="" class="thumb">
					</div>
					<section class="jobDetail">
						<div class="items">
							<h3>회사 소개</h3>
							${jp.introduce}
						</div>
						<div class="items">
							<h3>주요업무</h3>
							${jp.responsibility}
						</div>
						<div class="items">
							<h3>자격요건</h3>
							${jp.qualification}
						</div>
						<div class="items">
							<h3>우대사항</h3>
							${jp.preferential}
						</div>
						<div class="items">
							<h3>혜택 및 복지</h3>
							${jp.benefits}
						</div>
						<div class="items">
							<h3>근무 지역</h3>
							${jp.companyAddress}
						</div>
					</section>
				</div>
				<aside class="aside">
					<dl>
						<dd>경력</dd>
						<dt>${jp.career}</dt>
					</dl>
					<dl>
						<dd>최소 연봉</dd>
						<dt>${jp.salary} 만원</dt>
					</dl>
					<dl>
						<dd>직군</dd>
						<dt>${jp.sector}</dt>
					</dl>
					<dl>
						<dd>지역</dd>
						<dt>${jp.address}</dt>
					</dl>
					<dl>
						<dd>마감일</dd>
						<dt>${jp.deadline}</dt>
					</dl>
					<c:if test="${not empty corpMember}">
					<div>
						<a href="/el/corp/delete-position?no=${jp.no}"><button class="submit-btn">삭제하기</button></a>
						<a href="/el/corp/register-position?no=${jp.no}"><button class="submit-btn">수정하기</button></a>
					</div>
					</c:if>
				</aside>
			</div>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>

</html>