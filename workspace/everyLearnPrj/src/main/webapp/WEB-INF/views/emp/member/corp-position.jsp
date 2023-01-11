<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>채용 공고 수정</title>
<link rel="stylesheet" href="/el/resources/css/emp/main.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="stylesheet" href="/el/resources/css/emp/member-position.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
						<a onclick="deleteBtn();"><button class="submit-btn">삭제하기</button></a>
						<a href="/el/corp/register-position?no=${jp.no}"><button class="submit-btn">수정하기</button></a>
					</div>
					</c:if>
				</aside>
			</div>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script>
		function deleteBtn() {
			const no = '${jp.no}';
			console.log(no);
			Swal.fire({
						title: '삭제 하시겠습니까?',
						text: "삭제하시면 다시 복구시킬 수 없습니다",
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#1187CF',
						cancelButtonColor: '#d33',
						confirmButtonText: '삭제',
						cancelButtonText: '취소'
					}).then((result) => {
						if (result.isConfirmed) {
							Swal.fire(
								'삭제 되었습니다.',
								).then(() => {
									location.href = '/el/corp/delete-position?no=' + no
							}) 
							}
						})
		}
	</script>


</body>

</html>