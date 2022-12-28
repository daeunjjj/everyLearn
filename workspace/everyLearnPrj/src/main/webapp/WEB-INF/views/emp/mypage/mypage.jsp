<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>기업 회원 마이페이지</title>
<link rel="stylesheet" href="/el/resources/css/emp/mypage/mypage.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="icon" type="image/png" sizes="16x16"
	href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>

	<div class="container">
		<%@ include file="/WEB-INF/views/emp/mypage/navbar.jsp"%>
		<div class="content">
			<div class="wrapper">
				<main class="main">
					<form action="/el/corp/mypage" method="POST" enctype="multipart/form-data">
						<section class="info-section">
							<h1 class="section-title">회사 정보</h1>
							<div class="info-wrapper">
								<div class="grid interval">
									<div>
										<div class="title">
											<span>회사명</span> <span>*</span>
										</div>
										<input type="text" name="companyName" placeholder="회사이름"
											value="${cv.companyName}">
									</div>
									<div>
										<div class="title">
											<span>사업자등록번호</span> <span>*</span>
										</div>
										<input type="text" name="companyNum"
											placeholder="000-00-00000" value="${cv.companyNum}">
									</div>
								</div>
								<div class="second interval">
									<div class="title">
										<span>회사주소</span> <span>*</span>
									</div>
									<div class="grid">
										<input type="text" name="companyAddress" placeholder="주소" onclick="searchArr();" id="address" value="${cv.companyAddress}">
										<input type="text" name="detailAddress" placeholder="나머지 주소를 입력해주세요." id="detailAddress" value="${cv.detailAddress}">
									</div>
								</div>
								<div class="third interval">
									<div class="title">
										<span>회사 소개</span> <span>*</span>
									</div>
									<textarea name="introduce" class="introduce">${cv.introduce}</textarea>
								</div>
								<div class="grid interval">
									<div>
										<div class="title">
											<!-- 드롭다운 -->
											<span>산업군</span> <span>*</span>
										</div>
										<input type="text" name="sector" value="${cv.sector}">
									</div>
									<div>
										<div class="title">
											<span>직원수</span> <span>*</span>
										</div>
										<div class="input-sales">
											<input type="text" name="empNum" value="${cv.empNum}"><span>명</span>
										</div>
									</div>
								</div>
								<div class="grid">
									<div class="sales interval">
										<div class="title">
											<span>연 매출</span> <span>*</span>
										</div>
										<div class="input-sales">
											<input type="text" name="sales" placeholder="" value="${cv.sales}"><span>억원</span>
										</div>
									</div>
								</div>
								<div>
									<div class="title">
										<span>홈페이지 주소</span> <span>*</span>
									</div>
									<input type="text" name="homepage"
										placeholder="https:// 또는 http://" value="${cv.homepage}">
								</div>
							</div>
						</section>
						<section class="info-section">
							<h1 class="section-title">이미지 설정</h1>
							<div class="info-wrapper">
								<div class="img-upload-wrapper">
									<div class="label">
										<span>회사로고</span><span>*</span>
									</div>
									<div class="img-upload">
										<label>
											<div>
												<div class="img-input">
													<input type="file" accept=".jpg,.jpeg,.png" name="logo"><img
														alt="">
													<div class="image-uploader-cover css-1ngnjh4"></div>
													<div>
														<img src="/el/resources/img/emp/img-upload.svg" alt="">
													</div>
													<p class="choose-img">업로드할 이미지를 첨부해 주세요.</p>
													<button type="button" class="upload-btn">이미지 업로드</button>
												</div>
											</div>
										</label>
										<div class="img-guide">
											- 업로드 권장 가이드: 가로 600px, 세로 600px / 5MB 이하<br>- 등록 가능
											확장자: jpg, png, jpeg
										</div>
									</div>
								</div>

								<div class="img-upload-wrapper">
									<div class="label">
										<span>회사대표 이미지</span><span>*</span>
									</div>
									<div class="img-upload">
										<label>
											<div>
												<div class="img-input">
													<input type="file" accept=".jpg,.jpeg,.png" name="thumb"><img
														alt="">
													<div class="image-uploader-cover css-1ngnjh4"></div>
													<div>
														<img src="/el/resources/img/emp/img-upload.svg" alt="">
													</div>
													<p class="choose-img">업로드할 이미지를 첨부해 주세요.</p>
													<button type="button" class="upload-btn">이미지 업로드</button>
												</div>
											</div>
										</label>
										<div class="img-guide">
											- 업로드 권장 가이드: 가로 1080px, 세로 607px(16:9) / 5MB 이하<br>- 등록
											가능 확장자: jpg, png, jpeg
										</div>
									</div>
									<p class="warn">
										※ 개인 정보가 포함된 사진 및 적합하지 않은 사진은, 관리자에 의해 통보 없이 삭제될 수 있습니다.<br>※
										저작권 등 위배되는 사진은 등록이 불가하며, 발생하는 결과에 대한 모든 책임은 등록한 본인에게 있습니다.
									</p>
								</div>
						</section>
						<section class="admin-submit">
							<div>
								<button type="submit" class="admin-btn">승인 요청</button>
							</div>
						</section>
					</form>
				</main>
				<footer>
					<p class="footer">©EveryLearn.All rights reserved.</p>
				</footer>
			</div>

		</div>
	</div>

	<script src="/el/resources/js/emp/mypage.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>