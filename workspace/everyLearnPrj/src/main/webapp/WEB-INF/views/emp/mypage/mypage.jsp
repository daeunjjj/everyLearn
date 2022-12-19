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
</head>
<body>

    <div class="container">
        <%@ include file="/WEB-INF/views/emp/mypage/navbar.jsp"%>
        <div class="content">
            <div class="wrapper">
                <main class="main">
                        <form action="">
                            <h1 class="company-info">회사 정보</h1>
                            <section class="info-section">
                                <div class="name">
                                    <div class="">
                                        <span>회사명</span>
                                        <span>*</span>
                                    </div>
                                    <input type="text" name="name" placeholder="회사이름">
                                </div>
                                <div>
                                    <div>
                                        <span>사업자등록번호</span>
                                        <span>*</span>
                                    </div>
                                    <input type="text" name="name" placeholder="000-00-00000">
                                </div>
                                <div>
                                    <div>
                                        <span>회사주소</span>
                                        <span>*</span>
                                    </div>
                                    <input type="text" name="name" placeholder="주소">
                                    <input type="text" name="name"placeholder="상세주소">
                                </div>
                                <div>
                                    <div>
                                        <span>회사 소개</span>
                                        <span>*</span>
                                    </div>
                                    <textarea name="" id="" cols="30" rows="10"></textarea>
                                </div>
                                <div>
                                    <div>
                                        <!-- 드롭다운 -->
                                        <span>산업군</span>
                                        <span>*</span>
                                    </div>
                                    <input type="text" name="name">
                                </div>
                                <div>
                                    <div>
                                        <span>직원수</span>
                                        <span>*</span>
                                    </div>
                                    <input type="text" name="name">
                                </div>
                                <div>
                                    <div>
                                        <span>연 매출</span>
                                        <span>*</span>
                                    </div>
                                    <input type="text" name="name" placeholder=""><span>억원</span>
                                </div>
                                <div>
                                    <div>
                                        <span>홈페이지 주소</span>
                                        <span>*</span>
                                    </div>
                                    <input type="text" name="name" placeholder="https:// 또는 http://">
                                </div>
                            </section>
                        </form>
                    </main>
                    
            </div>
            
        </div>
    </div>

</body>
</html>