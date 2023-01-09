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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/emp-header.jsp"%>

	<main id="container">
		<article class="article">
			<div class="title">
				<h5>정확하게 입력했는지 다시 한번 확인해주세요!</h5>
			</div>
			<form action="/el/emp/resume" method="POST" enctype="multipart/form-data" onsubmit="return saveBtn(this);">
				<input type="hidden" name="no" value="${rv.no}">
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

						<!-- 경력 -->
						<section class="section">
							<div class="title">
								<h3>경력</h3>
							</div>
							<div class="content">
								<div class="content-wrapper">
									<div class="wrapper">
										<div class="list-wrapper" id="education-list">
											<div class="list-title">
												<h1>교육</h1>
												<div class="list-btn">
													<img src="/el/resources/img/emp/plus.svg" alt="" class="plus" onclick="eduPlusBtn();">
													<img src="/el/resources/img/emp/delete.svg" alt="" class="plus" onclick="eduDeleteBtn();">
												</div>
											</div>
											<c:forEach items="${eduList}" var="item" varStatus="status">
												<div class="item">
													<div class="separator"></div>
													<input type="hidden" name="evList[${status.index}].educationNo" value="${item.educationNo}">
													<div class="grid">
														<div class="list">
															<p>학교 종류</p>
															<div>
																<input type="text" name="evList[${status.index}].education" class="input" value="${item.education}">
															</div>
														</div>
														<div class="list">
															<p>학교명</p>
															<div>
																<input type="text" name="evList[${status.index}].schoolName" class="input" value="${item.schoolName}">
															</div>
														</div>
														<div class="list">
															<p>전공</p>
															<div>
																<input type="text" name="evList[${status.index}].major" class="input"  value="${item.major}">
															</div>
														</div>
														<!-- 드롭다운 변경 예정 -->
														<div class="list">
															<p>졸업 여부</p>
															<div>
																<select name="evList[${status.index}].status" class="input" value="">
																	<option value="1">졸업</option>
																	<option value="2">재학</option>
																	<option value="3">중퇴</option>
																</select>
															</div>
														</div>
														<div class="list">
															<p>입학날짜</p>
															<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
																<input type="text" id="edu-start-${status.index}" aria-label="Date-Time" class="input" name="evList[${status.index}].enterSchool" value="${item.enterSchool}" placeholder="0000년 00월"/>
																	<span class="tui-ico-date"></span>
															</div>
															<div id="edu-start-container-${status.index}" style="margin-top: -1px;"></div>
														</div>
														<div class="list">
															<p>졸업날짜</p>
															<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
																<input type="text" id="edu-graduate-${status.index}" aria-label="Date-Time" class="input" name="evList[${status.index}].graduate" value="${item.graduate}" placeholder="0000년 00월"/>
																	<span class="tui-ico-date"></span>
															</div>
															<div id="edu-graduate-container-${status.index}" style="margin-top: -1px;"></div>	
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="company-wrapper">
										<div class="wrapper">
											<div class="list-wrapper" id="career-list">
												<div class="list-title">
													<h4>업무 경험</h4>
													<div class="list-btn">
														<img src="/el/resources/img/emp/plus.svg" alt="" class="plus" onclick="careerPlusBtn();">
														<img src="/el/resources/img/emp/delete.svg" alt="" class="plus" onclick="careerDeleteBtn();">
													</div>
												</div>
												<c:forEach items="${careerList}" var="item" varStatus="status">
													<div class="item">
														<div class="separator"></div>
														<input type="hidden" name="cvList[${status.index}].careerNo" value="${item.careerNo}">
														<div class="grid">
															<div class="list">
																<p>회사명</p>
																<div>
																	<input type="text" name="cvList[${status.index}].companyName" class="input" value="${item.companyName}">
																</div>
															</div>
															<div class="list">
																<p>부서명</p>
																<div>
																	<input type="text" name="cvList[${status.index}].team" class="input" value="${item.team}">
																</div>
															</div>
															<div class="list">
																<p>직책</p>
																<div>
																	<input type="text" name="cvList[${status.index}].position" class="input" value="${item.position}"> 
																</div>
															</div>
															<!-- 드롭 다운 -->
															<div class="list">
																<p>근무유형</p>
																<div>
																	<select name="cvList[${status.index}].type" class="input">
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
																	<input type="text" id="cv-enter-${status.index}" aria-label="Date-Time" class="input" name="cvList[${status.index}].joinCompany" value="${item.joinCompany}" placeholder="0000년 00월 00일"/>
																		<span class="tui-ico-date"></span>
																</div>
																<div id="cv-enter-container-${status.index}" style="margin-top: -1px;"></div>	
															</div>
															<div class="list">
																<p>퇴사일</p>
																<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
																	<input type="text" id="cv-leave-${status.index}" aria-label="Date-Time" class="input" name="cvList[${status.index}].leave" value="${item.leave}" placeholder="0000년 00월 00일"/>
																		<span class="tui-ico-date"></span>
																</div>
																<div id="cv-leave-container-${status.index}" style="margin-top: -1px;"></div>	
															</div>
															<!-- 드롭 다운 -->
															<div class="list">
																<p>재직 여부</p>
																<div>
																	<select name="cvList[${status.index}].currentYN" class="input">
																		<option value="Y">재직중</option>
																		<option value="N">퇴사</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 보유 역량 -->
						<section class="section">
							<div class="title">
								<h3>보유 역량</h3>
							</div>
							<div class="content">
								<div class="content-wrapper">
									<div class="award-wrapper">
										<div class="wrapper">
											<div class="list-wrapper" id="award-list">
												<div class="list-title">
													<h4>수상</h4>
													<div class="list-btn">
														<img src="/el/resources/img/emp/plus.svg" alt="" class="plus" onclick="awardPlusBtn();">
														<img src="/el/resources/img/emp/delete.svg" alt="" class="plus" onclick="awardDeleteBtn();">
													</div>
												</div>
												<c:forEach items="${awardList}" var="item" varStatus="status">
												<div class="item">
													<div class="separator"></div>
													<input type="hidden" name="avList[${status.index}].awardNo" value="${item.awardNo}">
													<div class="grid">
														<div class="list">
															<p>수상내역</p>
															<div>
																<input type="text" name="avList[${status.index}].awardName" class="input" value="${item.awardName}">
															</div>
														</div>
														<div class="list">
															<p>수상년도</p>
															<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
																<input type="text" id="av-date-${status.index}" aria-label="Date-Time" class="input" name="avList[${status.index}].awardDate" value="${item.awardDate}" placeholder="0000년 00월"/>
																	<span class="tui-ico-date"></span>
															</div>
															<div id="av-date-container-${status.index}" style="margin-top: -1px;"></div>	
														</div>
														<!-- textarea -->
														<div class="list">
															<p>수상기관</p>
															<div>
																<input type="text" name="avList[${status.index}].awardAgency" class="input" value="${item.awardAgency}">
															</div>
														</div>
													</div>
												</div>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="certificate-wrapper">
										<div class="wrapper">
											<div class="list-wrapper" id="certificate-list">
												<div class="list-title">
													<h4>자격증</h4>
													<div class="list-btn">
														<img src="/el/resources/img/emp/plus.svg" alt="" class="plus" onclick="certificatePlusBtn();">
														<img src="/el/resources/img/emp/delete.svg" alt="" class="plus" onclick="certificateDeleteBtn();">
													</div>
												</div>
												<c:forEach items="${certificateList}" var="item" varStatus="status">
												<div class="item">
													<div class="separator"></div>
													<input type="hidden" name="cfvList[${status.index}].certificateNo" value="${item.certificateNo}">
													<div class="grid">
														<div class="list">
															<p>자격증명</p>
															<div>
																<input type="text" name="cfvList[${status.index}].certificateName" class="input" value="${item.certificateName}">
															</div>
														</div>
														<!-- textarea -->
														<div class="list">
															<p>취득일</p>
															<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
																<input type="text" id="cfv-date-${status.index}" aria-label="Date-Time" class="input" name="cfvList[${status.index}].certificateDate" value="${item.certificateDate}" placeholder="0000년 00월"/>
																	<span class="tui-ico-date"></span>
															</div>
															<div id="cfv-date-container-${status.index}" style="margin-top: -1px;"></div>	
														</div>
														<div class="detail">
															<p>발급기관</p>
															<div>
																<input type="text" name="cfvList[${status.index}].certificateAgency" class="input"  value="${item.certificateAgency}">
															</div>
														</div>
													</div>
												</div>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="language-wrapper">
										<div class="wrapper">
											<div class="list-wrapper" id="language-list">
												<div class="list-title">
													<h4>언어</h4>
													<div class="list-btn">
														<img src="/el/resources/img/emp/plus.svg" alt="" class="plus" onclick="languagePlusBtn();">
														<img src="/el/resources/img/emp/delete.svg" alt="" class="plus" onclick="languageDeleteBtn();">
													</div>
												</div>
												<c:forEach items="${langList}" var="item" varStatus="status">
												<div class="item">
													<div class="separator"></div>
													<input type="hidden" name="lvList[${status.index}].languageNo" value="${item.languageNo}">
													<div class="grid">
														<div class="list">
															<p>언어명</p>
															<div>
																<input type="text" name="lvList[${status.index}].language" class="input" value="${item.language}">
															</div>
														</div>
														<!-- 드롭다운 -->
														<div class="list">
															<p>수준</p>
															<div>
																<select name="lvList[${status.index}].languageLevel" class="input">
																	<option value="1">상</option>
																	<option value="2">중</option>
																	<option value="3">하</option>
																</select>
															</div>
														</div>
													</div>
												</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 자기소개 -->
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

						<!-- 추가 정보 -->
						<section class="section">
							<div class="title">
								<h3>추가정보</h3>
							</div>
							<div class="content">
								<div class="content-wrapper">
									<div class="list" id="link-item">
										<div class="list-title">
											<h4>링크</h4>
											<div class="list-btn">
												<img src="/el/resources/img/emp/plus.svg" alt="" class="plus" onclick="linkPlusBtn();">
												<img src="/el/resources/img/emp/delete.svg" alt="" class="plus" onclick="linkDeleteBtn();">
											</div>
										</div>
										<c:if test="${rv.link != null}">
											<div class="additional">
												<input type="text" name="link" class="input additional" value="${rv.link}">
											</div>
										</c:if>
									</div>
									<div class="list">
										<div class="list-title">
											<h4>첨부파일</h4>
											<img src="/el/resources/img/emp/delete.svg" alt="" class="plus" onclick="attachDeleteBtn();">
										</div>
										<div class="filebox-wrapper">
											<c:if test="${not empty rv.attachName}">
												<div id="attach">
													<input type="hidden" name="attachName" value="${rv.attachName}">
													<a href="/el/resources/upload/${rv.attachName}" download="${rv.attachName}">${rv.attachName}</a>
													<img src="/el/resources/img/emp/delete.svg" alt="" class="plus" onclick="attachDelete();">
												</div>
											</c:if>
											<input type="file" id="att" name="attach"
												class="additional" value="${rv.attach}">
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
					<c:if test="${not empty loginMember }">
					<div class="button-wrapper">
						<button type="submit" class="save-btn">저장</button>
					</div>
					</c:if>
			</form>
		</article>
	</main>

	<script>

	document.querySelector('select[name="category"] option[value="${rv.category}"]').setAttribute('selected', '');

		const DatePicker = tui.DatePicker;
		<c:if test="${not empty eduList}">
		let eduIndex = ${eduList.size()};
		</c:if>

		<c:if test="${empty eduList}">
		let eduIndex = 0;
		</c:if>
		
		<c:forEach items="${eduList}" var="item" varStatus="status">
			document.querySelector('select[name="evList[${status.index}].status"] option[value="${item.status}"]').setAttribute('selected', '');

			new DatePicker(document.getElementById(`edu-start-container-${status.index}`), {
				language: 'ko',
				type: 'month',
				input: {
						element: document.getElementById(`edu-start-${status.index}`),
						format: 'yyyy-MM'
				},
				date: new Date(`${item.enterSchool}`)
				
			});
	
			new DatePicker(document.getElementById(`edu-graduate-container-${status.index}`), {
				language: 'ko',
				type: 'month',
				input: {
						element: document.getElementById(`edu-graduate-${status.index}`),
						format: 'yyyy-MM'
				},
				date: new Date(`${item.graduate}`)
				
			});
		</c:forEach>

		<c:if test="${not empty careerList}">
		let careerIndex = ${careerList.size()};
		</c:if>

		<c:if test="${empty careerList}">
		let careerIndex = 0;
		</c:if>

		<c:forEach items="${careerList}" var="item" varStatus="status">
		document.querySelector('select[name="cvList[${status.index}].type"] option[value="${item.type}"]').setAttribute('selected', '');

		new DatePicker(document.getElementById(`cv-enter-container-${status.index}`), {
			language: 'ko',
			type: 'date',
			input: {
					element: document.getElementById(`cv-enter-${status.index}`),
					format: 'yyyy-MM-dd'
			},
			date: new Date(`${item.joinCompany}`)
			
		});

		new DatePicker(document.getElementById(`cv-leave-container-${status.index}`), {
			language: 'ko',
			type: 'date',
			input: {
					element: document.getElementById(`cv-leave-${status.index}`),
					format: 'yyyy-MM-dd'
			},
			date: new Date(`${item.leave}`)
			
		});
		</c:forEach>

		<c:if test="${not empty awardList}">
		let awardIndex = ${awardList.size()};
		</c:if>

		<c:if test="${empty awardList}">
		let awardIndex = 0;
		</c:if>
		
		<c:forEach items="${awardList}" var="item" varStatus="status">
		new DatePicker(document.getElementById(`av-date-container-${status.index}`), {
			language: 'ko',
			type: 'month',
			input: {
					element: document.getElementById(`av-date-${status.index}`),
					format: 'yyyy-MM'
			},
			date: new Date(`${item.awardDate}`)
			
		});
		</c:forEach>

		<c:if test="${not empty certificateList}">
		let certificateIndex = ${certificateList.size()};
		</c:if>

		<c:if test="${empty certificateList}">
		let certificateIndex = 0;
		</c:if>
		
		
		<c:forEach items="${certificateList}" var="item" varStatus="status">
		new DatePicker(document.getElementById(`cfv-date-container-${status.index}`), {
			language: 'ko',
			type: 'month',
			input: {
					element: document.getElementById(`cfv-date-${status.index}`),
					format: 'yyyy-MM'
			},
			date: new Date(`${item.certificateDate}`)
			
		});
		</c:forEach>
		
		<c:if test="${not empty langList}">
		let languageIndex = ${langList.size()};
		</c:if>

		<c:if test="${empty langList}">
		let languageIndex = 0;
		</c:if>
		<c:forEach items="${langList}" var="item" varStatus="status">
			document.querySelector('select[name="lvList[${status.index}].languageLevel"] option[value="${item.languageLevel}"]').setAttribute('selected', '');
		</c:forEach>

		<c:if test="${not empty rv.link}">
		let link = 1;
		</c:if>
		
		<c:if test="${empty rv.link}">
		let link = 0;
		</c:if>
		
	</script>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="/el/resources/js/emp/resume.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>