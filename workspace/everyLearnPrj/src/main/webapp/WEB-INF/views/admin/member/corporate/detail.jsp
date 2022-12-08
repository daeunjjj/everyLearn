<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 기업회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/corporate/detail.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/common/detail.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>기업회원</h1>
            <div id="line"></div>
           	<div class="main-wrap">
                <div class="info-wrap">
                    <h2>기업정보</h2>
                    <div class="info-area">
                        <div class="info-top">
                            <div class="flex-items">
                                <div>기업이름</div>
                                <div>kh352</div>
                            </div>
                            <div class="flex-items">
                                <div>대표자명</div>
                                <div>심투용</div>
                            </div>
                            <div class="flex-items">
                                <div>직군</div>
                                <div>IT</div>
                            </div>
                            <div class="flex-items">
                                <div>주소</div>
                                <div>서울특별시 강남구 테헤란로 무슨빌딩 5층</div>
                            </div>
                            <div class="flex-items">
                                <div>전화번호</div>
                                <div>010-1234-5678</div>
                            </div>
                            <div class="flex-items">
                                <div>이메일</div>
                                <div>2dragon@gmail.com</div>
                            </div>
                            <div class="flex-items">
                                <div>사업자번호</div>
                                <div>123-45-67890</div>
                            </div>
                        </div>
                        <div class="map-area">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d50646.0540677786!2d127.03290900000002!3d37.498993000000006!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x3565475c3365c5bb!2zS0jsoJXrs7TqtZDsnKHsm5A!5e0!3m2!1sko!2skr!4v1670336673821!5m2!1sko!2skr" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                    <div class="detail-list-wrap">
                        <h3>채용목록</h3>
                        <div class="detail-list-area">
                            <div>직군</div>
                            <div>제목</div>
                            <div>마감일</div>
                            <div>수정날짜</div>
                            <div>관리</div>
                        </div>
                        <div>
                            <ul>
                                <li class="detail-list-area">
                                    <div>IT</div>
                                    <div>신입 개발자구합니다.</div>
                                    <div>2023-01-15</div>
                                    <div>2022-12-07</div>
                                    <div>
                                        <button>삭제</button>
                                    </div>
                                </li>
                            
                            </ul>
                        </div>
                    </div>
                    <div class="resume-bottom">
                        <div class="btn-area">
                            <button id="refusal-btn">거절</button>
                            <button id="approval-btn">승인</button>
                        </div>
                    </div>
                </div>
           	</div>


        </main>
    </div>
</body>
</html>