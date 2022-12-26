<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/emp/mypage/mypage.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>

    <div class="container">
        <%@ include file="/WEB-INF/views/emp/mypage/navbar.jsp"%>
        <div class="content">
            <div class="wrapper">
                <main class="main">
                        <form action="">
                            <section class="info-section">
                                <h1 class="section-title">회사 정보</h1>
                                <div class="info-wrapper">
                                    <div class="grid interval">
                                        <div>
                                            <div class="title">
                                                <span>회사명</span>
                                                <span>*</span>
                                            </div>
                                            <input type="text" name="companyName" placeholder="회사이름">
                                        </div>
                                        <div>
                                            <div class="title">
                                                <span>사업자등록번호</span>
                                                <span>*</span>
                                            </div>
                                            <input type="text" name="companyNum" placeholder="000-00-00000">
                                        </div>
                                    </div>
                                    <div class="second interval">
                                        <div class="title">
                                            <span>회사주소</span>
                                            <span>*</span>
                                        </div>
                                        <div class="grid">
                                            <input type="text" name="companyAddress" placeholder="주소">
                                            <input type="text" name="companyAddress"placeholder="상세주소">
                                        </div>
                                    </div>
                                    <div class="third interval">
                                        <div class="title">
                                            <span>회사 소개</span>
                                            <span>*</span>
                                        </div>
                                        <textarea name="introduce" class="introduce"></textarea>
                                    </div>
                                    <div class="grid interval">
                                        <div>
                                            <div class="title">
                                                <!-- 드롭다운 -->
                                                <span>산업군</span>
                                                <span>*</span>
                                            </div>
                                            <input type="text" name="sector">
                                        </div>
                                        <div>
                                            <div class="title">
                                                <span>직원수</span>
                                                <span>*</span>
                                            </div>
                                            <input type="text" name="empNum">
                                        </div>
                                    </div>
                                    <div class="grid">
                                        <div class="sales interval">
                                            <div class="title">
                                                <span>연 매출</span>
                                                <span>*</span>
                                            </div>
                                            <div class="input-sales">
                                                <input type="text" name="sales" placeholder=""><span>억원</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div >
                                        <div class="title">
                                            <span>홈페이지 주소</span>
                                            <span>*</span>
                                        </div>
                                        <input type="text" name="homepage" placeholder="https:// 또는 http://">
                                    </div>
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

</body>
</html>