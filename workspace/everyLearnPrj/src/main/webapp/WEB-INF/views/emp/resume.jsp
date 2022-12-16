<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/emp/empMain.css">
<link rel="stylesheet" href="/el/resources/css/emp/reset.css">
<link rel="stylesheet" href="/el/resources/css/emp/resume.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/emp-header.jsp"%>
    
	<main id="container">
		<article class="article">
			<div class="title">
				<h5>정확하게 입력했는지 다시 한번 확인해주세요!</h5>
			</div>
			<form action="">
				<div class="main">
					<div class="main-wrapper">
						<section class="section">
							<div class="title">
								<h3>기본정보</h3>
							</div>
							<div class="info-wrapper">
								<div class="basic-info">
									<div class="list">
										<p>이름</p>
										<div>
											<input type="text" name="name" class="input">
										</div>
									</div>
									<div class="list">
										<p>전화번호</p>
										<div>
											<input type="text" name="phone" class="input">
										</div>
									</div>
									<div class="list">
										<p>이메일</p>
										<div>
											<input type="text" name="email" class="input">
										</div>
									</div>
									<div class="list">
										<p>개인 블로그 주소</p>
										<div>
											<input type="text" name="blog" class="input">
										</div>
									</div>
									<!-- 주소 api -->
									<div class="list">
										<p>주소</p>
										<div>
											<input type="text" name="address" class="input">
										</div>
									</div>
									<div class="list">
										<p>상세주소</p>
										<div>
											<input type="text" name="address-deatail" class="input">
										</div>
									</div>
									<!-- 드롭다운으로 변경 예정 -->
									<div class="list">
										<p>관심 직군</p>
										<div>
											<input type="text" name="job" class="input">
										</div>
									</div>
								</div>
							</div>
						</section>
						<section class="section">
							<div class="title">
								<h3>경력</h3>
							</div>
							<div class="info-wrapper">
								<div class="info">
									<div class="school-wrapper">
										<div class="school">
											<h4>학력</h4>
											<div class="bottom"></div>
										</div>
										<div class="grid">
											<div class="list">
												<p>학력</p>
												<div>
													<input type="text" name="education" class="input">
												</div>
											</div>
											<div class="list">
												<p>학교명</p>
												<div>
													<input type="text" name="school" class="input">
												</div>
											</div>
											<div class="list">
												<p>전공</p>
												<div>
													<input type="text" name="major" class="input">
												</div>
											</div>
											<!-- 드롭다운 변경 예정 -->
											<div class="list">
												<p>졸업 여부</p>
												<div>
													<input type="text" name="graduation" class="input">
												</div>
											</div>
											<div class="list">
												<p>교육기간</p>
												<div>
													<input type="text" name="period" class="input">
												</div>
											</div>
										</div>
									</div>
									<div class="company-wrapper">
										<div class="company">
											<h4>업무 경험</h4>
											<div class="bottom"></div>
										</div>
										<div class="grid">
											<div class="list">
												<p>회사명</p>
												<div>
													<input type="text" name="company" class="input">
												</div>
											</div>
											<div class="list">
												<p>부서명</p>
												<div>
													<input type="text" name="team" class="input">
												</div>
											</div>
											<div class="list">
												<p>직책</p>
												<div>
													<input type="text" name="position" class="input">
												</div>
											</div>
											<div class="list">
												<p>재직기간</p>
												<div>
													<input type="text" name="employment-period" class="input">
												</div>
											</div>
											<!-- 드롭 다운 -->
											<div class="list">
												<p>근무유형</p>
												<div>
													<input type="text" name="type" class="input">
												</div>
											</div>
											<!-- 드롭 다운 -->
											<div class="list">
												<p>재직 여부</p>
												<div>
													<input type="text" name="status" class="input">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<section class="section">
							<div class="title">
								<h3>보유 역량</h3>
							</div>
							<div class="info-wrapper">
								<div class="info">
									<div class="award-wrapper">
										<div class="award">
											<h4>수상</h4>
											<div class="bottom"></div>
										</div>
										<div class="grid">
											<div class="list">
												<p>수상내역</p>
												<div>
													<input type="text" name="award" class="input">
												</div>
											</div>
											<div class="list">
												<p>수상년도</p>
												<div>
													<input type="text" name="award-date" class="input">
												</div>
											</div>
											<!-- textarea -->
											<div class="list">
												<p>상세설명</p>
												<div>
													<input type="text" name="award-detail" class="input">
												</div>
											</div>
										</div>
									</div>
									<div class="certificate-wrapper">
										<div class="certificate">
											<h4>자격증</h4>
											<div class="bottom"></div>
										</div>
										<div class="grid">
											<div class="list">
												<p>자격증명</p>
												<div>
													<input type="text" name="certificate" class="input">
												</div>
											</div>
											<!-- textarea -->
											<div class="list">
												<p>상세설명</p>
												<div>
													<input type="text" name="certificate-detail" class="input">
												</div>
											</div>
											<div class="list">
												<p>취득일</p>
												<div>
													<input type="text" name="certificate-date" class="input">
												</div>
											</div>
											<div class="list">
												<p>발급기간</p>
												<div>
													<input type="text" name="certificate-period" class="input">
												</div>
											</div>
										</div>
									</div>
									<div class="language-wrapper">
										<div class="language">
											<h4>언어</h4>
											<div class="bottom"></div>
										</div>
										<div class="grid">
											<div class="list">
												<p>언어명</p>
												<div>
													<input type="text" name="language" class="input">
												</div>
											</div>
											<!-- 드롭다운 -->
											<div class="list">
												<p>수준</p>
												<div>
													<input type="text" name="level" class="input">
												</div>
											</div>
										</div>
									</div>
									<!-- textarea -->
									<div class="grid">
										<div class="list">
											<p>자기소개</p>
											<div>
												<input type="text" name="introduce" class="input">
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<section class="section">
							<div class="title">
								<h3>추가정보</h3>
							</div>
							<div class="info-wrapper">
								<div class="info">
									<div class="list">
										<p>링크</p>
										<div>
											<input type="text" name="link" class="input">
										</div>
									</div>
									<div class="list">
										<p>첨부파일</p>
										<div>
											<input type="text" name="attachments" class="input">
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
				<button>임시저장</button>
				<button>저장</button>
			</form>
		</article>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>