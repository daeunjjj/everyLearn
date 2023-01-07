<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" href="/el/resources/css/emp/empMain.css">
<link rel="stylesheet" href="/el/resources/css/emp/resume.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/emp-header.jsp"%>

	<main id="container">
		<article class="article">
			<div class="title">
				<h5>정확하게 입력했는지 다시 한번 확인해주세요!</h5>
			</div>
			<form action="/el/emp/resume" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="no" value="${rv.no}">
				<input type="hidden" name="avList[0].awardNo" value="${awardList[0].awardNo}">
				<input type="hidden" name="cvList[0].careerNo" value="${careerList[0].careerNo}">
				<input type="hidden" name="cfvList[0].certificateNo" value="${certificateList[0].certificateNo}">
				<input type="hidden" name="evList[0].educationNo" value="${eduList[0].educationNo}">
				<input type="hidden" name="lvList[0].languageNo" value="${langList[0].languageNo}">
				<div class="main">
					<div class="main-wrapper">
						<section class="section">
							<div class="title">
								<h3>기본정보</h3>
							</div>
							<div class="content">
								<div class="basic-info">
									<div class="list">
										<p>이름</p>
										<div>
											<input type="text" name="name" class="input" value="${rv.name}">
										</div>
									</div>
									<div class="list">
										<p>전화번호</p>
										<div>
											<input type="text" name="phone" class="input" value="${rv.phone}">
										</div>
									</div>
									<div class="list">
										<p>이메일</p>
										<div>
											<input type="text" name="email" class="input" value="${rv.email}">
										</div>
									</div>
									<!-- 드롭다운으로 변경 예정 -->
									<div class="list">
										<p>관심 직군</p>
										<div class="dropdown">
											<select name="category" class="input">
												<option value="1">IT직군</option>
												<option value="2">경영/사무</option>
												<option value="3">디자인</option>
												<option value="4">마케팅</option>
												<option value="5">교육</option>
											</select>
										</div>
									</div>
									<!-- 주소 api -->
									<div class="list expand">
										<p>주소</p>
										<div>
											<input type="text" name="address" class="input additional" value="${rv.address}" onclick="searchArr();" id="address">
										</div>
									</div>
									<div class="list expand">
										<p>상세주소</p>
										<div>
											<input type="text" name="detailAddress"
												class="input additional" value="${rv.detailAddress}" id="detailAddress">
										</div>
									</div>
								</div>
							</div>
						</section>
						<section class="section">
							<div class="title">
								<h3>경력</h3>
							</div>
							<div class="content">
								<div class="content-wrapper">
									<div class="wrapper">
										<div class="list-wrapper">
											<div class="list-title">
												<h4>학력</h4>
											</div>
											<div class="grid">
												<div class="list">
													<p>학력</p>
													<div>
														<input type="text" name="evList[0].education" class="input" value="${eduList[0].education}">
													</div>
												</div>
												<div class="list">
													<p>학교명</p>
													<div>
														<input type="text" name="evList[0].schoolName" class="input" value="${eduList[0].schoolName}">
													</div>
												</div>
												<div class="list">
													<p>전공</p>
													<div>
														<input type="text" name="evList[0].major" class="input"  value="${eduList[0].major}">
													</div>
												</div>
												<!-- 드롭다운 변경 예정 -->
												<div class="list">
													<p>졸업 여부</p>
													<div>
														<select name="evList[0].status" class="input">
															<option value="1">졸업</option>
															<option value="2">재학</option>
															<option value="3">중퇴</option>
														</select>
													</div>
												</div>
												<div class="list">
													<p>입학날짜</p>
													<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
														<input type="text" id="edu-start" aria-label="Date-Time" class="input" name="evList[0].enterSchool" value="${eduList[0].enterSchool}"/>
															<span class="tui-ico-date"></span>
													</div>
													<div id="edu-start-container" style="margin-top: -1px;"></div>
												</div>
												<div class="list">
													<p>졸업날짜</p>
													<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
														<input type="text" id="edu-graduate" aria-label="Date-Time" class="input" name="evList[0].graduate" value="${eduList[0].graduate}"/>
															<span class="tui-ico-date"></span>
													</div>
													<div id="edu-graduate-container" style="margin-top: -1px;"></div>	
												</div>
											</div>
										</div>
									</div>
									<div class="company-wrapper">
										<div class="wrapper">
											<div class="list-wrapper">
												<div class="list-title">
													<h4>업무 경험</h4>
												</div>
												<div class="grid">
													<div class="list">
														<p>회사명</p>
														<div>
															<input type="text" name="cvList[0].companyName" class="input" value="${careerList[0].companyName}">
														</div>
													</div>
													<div class="list">
														<p>부서명</p>
														<div>
															<input type="text" name="cvList[0].team" class="input" value="${careerList[0].team}">
														</div>
													</div>
													<div class="list">
														<p>직책</p>
														<div>
															<input type="text" name="cvList[0].position" class="input" value="${careerList[0].position}"> 
														</div>
													</div>
													<!-- 드롭 다운 -->
													<div class="list">
														<p>근무유형</p>
														<div>
															<select name="cvList[0].type" class="input">
																<option value="1">인턴</option>
																<option value="2">계약직</option>
																<option value="3">정규직</option>
																<option value="4">개인사업</option>
																<option value="5">프리랜서</option>
															</select>
														</div>
													</div>
													<div class="list">
														<p>입사일</p>
														<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
															<input type="text" id="cv-enter" aria-label="Date-Time" class="input" name="cvList[0].joinCompany" value="${careerList[0].joinCompany}"/>
																<span class="tui-ico-date"></span>
														</div>
														<div id="cv-enter-container" style="margin-top: -1px;"></div>	
													</div>
													<div class="list">
														<p>퇴사일</p>
														<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
															<input type="text" id="cv-leave" aria-label="Date-Time" class="input" name="cvList[0].leave" value="${careerList[0].leave}"/>
																<span class="tui-ico-date"></span>
														</div>
														<div id="cv-leave-container" style="margin-top: -1px;"></div>	
													</div>
													<!-- 드롭 다운 -->
													<div class="list">
														<p>재직 여부</p>
														<div>
															<select name="cvList[0].currentYN" class="input">
																<option value="Y">재직중</option>
																<option value="N">퇴사</option>
															</select>
														</div>
													</div>
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
							<div class="content">
								<div class="content-wrapper">
									<div class="award-wrapper">
										<div class="wrapper">
											<div class="list-wrapper">
												<div class="list-title">
													<h4>수상</h4>
												</div>
												<div class="grid">
													<div class="list">
														<p>수상내역</p>
														<div>
															<input type="text" name="avList[0].awardName" class="input" value="${awardList[0].awardName}">
														</div>
													</div>
													<div class="list">
														<p>수상년도</p>
														<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
															<input type="text" id="av-date" aria-label="Date-Time" class="input" name="avList[0].awardDate" value="${awardList[0].awardDate}"/>
																<span class="tui-ico-date"></span>
														</div>
														<div id="av-date-container" style="margin-top: -1px;"></div>	
													</div>
													<!-- textarea -->
													<div class="list">
														<p>수상기관</p>
														<div>
															<input type="text" name="avList[0].awardAgency" class="input" value="${awardList[0].awardAgency}">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="certificate-wrapper">
										<div class="wrapper">
											<div class="list-wrapper">
												<div class="list-title">
													<h4>자격증</h4>
												</div>
												<div class="grid">
													<div class="list">
														<p>자격증명</p>
														<div>
															<input type="text" name="cfvList[0].certificateName" class="input" value="${certificateList[0].certificateName}">
														</div>
													</div>
													<!-- textarea -->
													<div class="list">
														<p>취득일</p>
														<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
															<input type="text" id="cfv-date" aria-label="Date-Time" class="input" name="cfvList[0].certificateDate" value="${certificateList[0].certificateDate}"/>
																<span class="tui-ico-date"></span>
														</div>
														<div id="cfv-date-container" style="margin-top: -1px;"></div>	
													</div>
													<div class="detail">
														<p>발급기관</p>
														<div>
															<input type="text" name="cfvList[0].certificateAgency" class="input"  value="${certificateList[0].certificateAgency}">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="language-wrapper">
										<div class="wrapper">
											<div class="list-wrapper">
												<div class="list-title">
													<h4>언어</h4>
												</div>
												<div class="grid">
													<div class="list">
														<p>언어명</p>
														<div>
															<input type="text" name="lvList[0].language" class="input" value="${langList[0].language}">
														</div>
													</div>
													<!-- 드롭다운 -->
													<div class="list">
														<p>수준</p>
														<div>
															<select name="lvList[0].languageLevel" class="input">
																<option value="1">상</option>
																<option value="2">중</option>
																<option value="3">하</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<section class="section">
							<div class="title">
								<h3>자기소개</h3>
							</div>
							<div class="content-wrapper">
								<div class="wrapper">
									<div class="list-wrapper">
										<div class="introduce-title">
											<h4>자기소개</h4>
											<span>최대 5000자</span>
										</div>
										<div class="textarea">
											<textarea type="text" name="introduce" class="introduce"
												maxlength="5000">${rv.introduce}</textarea>
										</div>
									</div>
								</div>
						</section>
						<section class="section">
							<div class="title">
								<h3>추가정보</h3>
							</div>
							<div class="content">
								<div class="content-wrapper">
									<div class="list">
										<p>링크</p>
										<div>
											<input type="text" name="link" class="input additional" value="${rv.link}">
										</div>
									</div>
									<div class="list">
										<p>첨부파일</p>
										<div>
											<input type="file" name="attach"
												class="additional" value="${rv.attach}">
										</div>
										<c:if test="${not empty rv.attachName}">
											<a href="/el/resources/upload/${rv.attachName}" download="${rv.attachName}">${rv.attachName}</a>
										</c:if>
									</div>
								</div>
							</div>
						</section>
					</div>
					<c:if test="${not empty loginMember }">
					<div class="button-wrapper">
						<button type="submit">저장</button>
					</div>
					</c:if>
			</form>
		</article>
	</main>

	<script>
	const DatePicker = tui.DatePicker;

	new DatePicker(document.getElementById('edu-start-container'), {
		language: 'ko',
		type: 'month',
		input: {
				element: document.getElementById('edu-start'),
				format: 'yyyy-MM'
		},
		date: new Date('${eduList[0].enterSchool}')
		
	});

	new DatePicker(document.getElementById('edu-graduate-container'), {
		language: 'ko',
		type: 'month',
		input: {
				element: document.getElementById('edu-graduate'),
				format: 'yyyy-MM'
		},
		date: new Date('${eduList[0].graduate}')
		
	});

	new DatePicker(document.getElementById('cv-enter-container'), {
		language: 'ko',
		type: 'date',
		input: {
				element: document.getElementById('cv-enter'),
				format: 'yyyy-MM-dd'
		},
		date: new Date('${careerList[0].joinCompany}')
		
	});

	new DatePicker(document.getElementById('cv-leave-container'), {
		language: 'ko',
		type: 'date',
		input: {
				element: document.getElementById('cv-leave'),
				format: 'yyyy-MM-dd'
		},
		date: new Date('${careerList[0].leave}')
		
	});

	new DatePicker(document.getElementById('cfv-date-container'), {
		language: 'ko',
		type: 'month',
		input: {
				element: document.getElementById('cfv-date'),
				format: 'yyyy-MM'
		},
		date: new Date('${certificateList[0].certificateDate}')
		
	});

	</script>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="/el/resources/js/emp/resume.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>