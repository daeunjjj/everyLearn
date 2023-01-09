<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>기업 회원 마이페이지</title>
<link rel="stylesheet" href="/el/resources/css/emp/mypage/mypage.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
										<span>회사명</span> <span class="essential">*</span>
									</div>
									<input oninput="validate();" onblur="validateCompanyName();" type="text" name="companyName" id="companyName" placeholder="회사이름" value="${cv.companyName}">
									<div id="input-companyName" class="x-icon" style="display: none;">
										<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
										<span class="essential">필수입력 항목입니다.</span>
									</div>
								</div>
								<div>
									<div class="title">
										<span>사업자등록번호</span> <span class="essential">*</span>
									</div>
									<input type="text" name="companyNum" id="companyNum"
										placeholder="000-00-00000" value="${cv.companyNum}" oninput="autoHyphen(this);"maxlength="12" onblur="validateCompanyNum();">
										<div id="input-companyNum" class="x-icon" style="display: none;">
											<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
											<span class="essential">필수입력 항목입니다.</span>
										</div>
								</div>
							</div>
							<div class="second interval">
								<div class="title">
									<span>회사주소</span> <span class="essential">*</span>
								</div>
								<div class="grid">
									<div>
										<input oninput="validate();"  onblur="validateAdderss();"type="text" name="companyAddress" placeholder="주소" onclick="searchArr();" id="address" value="${cv.companyAddress}">
										<div id="input-companyAddress" class="x-icon" style="display: none;">
											<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
											<span class="essential">필수입력 항목입니다.</span>
										</div>
									</div>
									<div>
										<input oninput="validate();" onblur="validateDetailAddress();" type="text" name="detailAddress" placeholder="나머지 주소를 입력해주세요." id="detailAddress" value="${cv.detailAddress}">
										<div id="input-detailAddress" class="x-icon" style="display: none;">
											<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
											<span class="essential">필수입력 항목입니다.</span>
										</div>
									</div>
								</div>
							</div>
							<div class="third interval">
								<div class="title">
									<span>회사 소개</span> <span class="essential">*</span>
								</div>
								<textarea oninput="validate();" onblur="validateIntroduce();" name="introduce" id="introduce" class="introduce">${cv.introduce}</textarea>
								<div id="input-introduce" class="x-icon" style="display: none;">
									<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
									<span class="essential">필수입력 항목입니다.</span>
								</div>
							</div>
							<div class="grid interval">
								<div>
									<div class="title">
										<!-- 드롭다운 -->
										<span>산업군</span> <span class="essential">*</span>
									</div>
									<select name="sector" class="category" onchange="validate();" onblur="validateSector();" id="sector">
										<option disabled selected>선택</option>
										<option value="1">IT직군</option>
										<option value="2">경영/사무</option>
										<option value="3">디자인</option>
										<option value="4">마케팅</option>
										<option value="5">교육</option>
									</select>
									<div id="input-sector" class="x-icon" style="display: none;">
										<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
										<span class="essential">필수입력 항목입니다.</span>
									</div>
								</div>
								<div>
									<div class="title">
										<span>직원수</span> <span class="essential">*</span>
									</div>
									<div class="input-wrapper">
										<input oninput="validate();" onblur="validateEmpNum();" type="text" name="empNum" id="empNum" class="number" value="${cv.empNum}"><span>명</span>
										<div id="input-empNum" class="x-icon" style="display: none;">
											<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
											<span class="essential">필수입력 항목입니다.</span>
										</div>
									</div>
								</div>
							</div>
							<div class="grid">
								<div class="sales interval">
									<div class="title">
										<span>연 매출</span> <span class="essential">*</span>
									</div>
									<div class="input-wrapper">
										<input oninput="validate();" onblur="validateSales();" type="text" name="sales" id="sales" class="number" placeholder="" value="${cv.sales}"><span>억원</span>
										<div id="input-sales" class="x-icon" style="display: none;">
											<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
											<span class="essential">필수입력 항목입니다.</span>
										</div>
									</div>
								</div>
							</div>
							<div>
								<div class="title">
									<span>홈페이지 주소</span> <span class="essential">*</span>
								</div>
								<input oninput="validate();" onblur="validateHompage();" type="text" name="homepage"
									placeholder="https:// 또는 http://" id="homepage" value="${cv.homepage}">
									<div id="input-homepage" class="x-icon" style="display: none;">
										<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
										<span class="essential">필수입력 항목입니다.</span>
									</div>
							</div>
						</div>
					</section>
					<section class="info-section">
						<h1 class="section-title">이미지 설정</h1>
						<div class="info-wrapper">
							<div class="img-upload-wrapper">
								<div class="label">
									<span>회사로고</span><span class="essential">*</span>
								</div>
								<div class="img-upload">
									<label>
										<div>
											<div class="img-input">
												<input oninput="validate();" onblur="validateLogo();" onchange="uploadLogo(this);" type="file" accept=".jpg,.jpeg,.png" name="logo" id="logo"><img
													alt="" src="/el/resources/upload/${cv.logo}" id="logo-upload" class="uploaded" onerror="this.style.display='none'">
												<div class="image-uploader-cover css-1ngnjh4"></div>
												<div>
													<img src="/el/resources/img/emp/img-upload.svg" alt="">
												</div>
												<p class="choose-img">업로드할 이미지를 첨부해 주세요.</p>
												<span class="upload-btn">이미지 업로드</span>
												<div id="input-logo" class="x-icon" style="display: none;">
													<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
													<span class="essential">필수입력 항목입니다.</span>
												</div>
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
									<span>회사대표 이미지</span><span class="essential">*</span>
								</div>
								<div class="img-upload">
									<label>
										<div>
											<div class="img-input">
												<input oninput="validate();" onchange="uploadImg(this);" onblur="validateThumb();" type="file" accept=".jpg,.jpeg,.png" name="thumb" id="thumb"><img
												src="/el/resources/upload/${cv.thumb}" id="img-upload" class="uploaded" onerror="this.style.display='none'">
												<div class="image-uploader-cover css-1ngnjh4"></div>
												<div>
													<img src="/el/resources/img/emp/img-upload.svg" alt="">
												</div>
												<p class="choose-img">업로드할 이미지를 첨부해 주세요.</p>
												<span class="upload-btn">이미지 업로드</span>
												<div id="input-tumb" class="x-icon" style="display: none;">
													<div><img src="/el/resources/img/emp/x-icon.svg" alt=""></div>
													<span class="essential">필수입력 항목입니다.</span>
												</div>
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
							<div class="quit">
								<button type="button" onclick="quitBtn();">회원 탈퇴</button>
							</div>
					</section>
					<section class="admin-submit">
						<div>
						<c:choose>
							<c:when test="${'Y' eq corpMember.statusYn}">
								<button type="submit" class="admin-btn">저장 하기</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="admin-btn" disabled>승인 요청</button>
							</c:otherwise>
						</c:choose>
						</div>
					</section>
				</form>
				<form action="/el/corp/quit" method="POST" id="quit"></form>
			</main>
			<footer>
				<p class="footer">©EveryLearn.All rights reserved.</p>
			</footer>
		</div>

	</div>
</div>

<script>
		function quitBtn() {
			const no = '${cv.no}';
			Swal.fire({
						title: '탈퇴 하시겠습니까?',
						text: "탈퇴하시면 다시 복구시킬 수 없습니다",
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#1187CF',
						cancelButtonColor: '#d33',
						confirmButtonText: '탈퇴',
						cancelButtonText: '취소'
					}).then((result) => {
						if (result.isConfirmed) {
							Swal.fire(
								'탈퇴 되었습니다.',
								).then(() => {
									$.ajax({
										url: '/el/corp/quit',
										method: 'POST',
										success: function(){
											window.location.href = '/el/emp/main'
										}
									})
							}) 
							}
						})
		}
	</script>


	<script src="/el/resources/js/emp/mypage.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>