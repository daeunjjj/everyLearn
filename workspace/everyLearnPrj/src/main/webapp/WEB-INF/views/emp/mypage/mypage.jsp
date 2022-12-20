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
                            <section class="info-section">
                                <h1 class="company-info">회사 정보</h1>
                                <div class="info-wrapper">
                                    <div class="grid interval">
                                        <div>
                                            <div class="title">
                                                <span>회사명</span>
                                                <span>*</span>
                                            </div>
                                            <input type="text" name="name" placeholder="회사이름">
                                        </div>
                                        <div>
                                            <div class="title">
                                                <span>사업자등록번호</span>
                                                <span>*</span>
                                            </div>
                                            <input type="text" name="name" placeholder="000-00-00000">
                                        </div>
                                    </div>
                                    <div class="second interval">
                                        <div class="title">
                                            <span>회사주소</span>
                                            <span>*</span>
                                        </div>
                                        <div class="grid">
                                            <input type="text" name="name" placeholder="주소">
                                            <input type="text" name="name"placeholder="상세주소">
                                        </div>
                                    </div>
                                    <div class="third interval">
                                        <div class="title">
                                            <span>회사 소개</span>
                                            <span>*</span>
                                        </div>
                                        <textarea name="" id="" class="introduce"></textarea>
                                    </div>
                                    <div class="grid interval">
                                        <div>
                                            <div class="title">
                                                <!-- 드롭다운 -->
                                                <span>산업군</span>
                                                <span>*</span>
                                            </div>
                                            <input type="text" name="name">
                                        </div>
                                        <div>
                                            <div class="title">
                                                <span>직원수</span>
                                                <span>*</span>
                                            </div>
                                            <input type="text" name="name">
                                        </div>
                                    </div>
                                    <div class="sales interval">
                                        <div class="title">
                                            <span>연 매출</span>
                                            <span>*</span>
                                        </div>
                                        <input type="text" name="name" placeholder=""><span>억원</span>
                                    </div>
                                    <div >
                                        <div class="title">
                                            <span>홈페이지 주소</span>
                                            <span>*</span>
                                        </div>
                                        <input type="text" name="name" placeholder="https:// 또는 http://">
                                    </div>
                                </div>
                            </section>
                            <section class="img-section">
                                <h1>이미지</h1>
                                <div class="img-wrapper">
                                    <span class="img-title">
                                        <span>회사 로고</span>
                                        <span>*</span>
                                    </span>
                                    <div class="upload">
                                        <input type="file" class="file">
                                        <div class="img-logo">
                                            <svg width="32" height="32" fill="none" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path d="M.889 4.966a1.86 1.86 0 0 1 1.864-1.855H23.53c1.03 0 1.864.83 1.864 1.855v7.83a.794.794 0 0 1-.799.788.794.794 0 0 1-.799-.788v-7.83a.266.266 0 0 0-.266-.265H2.753a.266.266 0 0 0-.266.265v16.43c0 .146.12.264.266.264h3.125a.82.82 0 0 1 .14-.195l9.706-10.106a1.947 1.947 0 0 1 2.766-.035l3.394 3.357c.155.153.242.36.242.577 0 .73-.894 1.094-1.416.578l-3.39-3.354a.278.278 0 0 0-.396.005l-8.81 9.173h6.671a.8.8 0 0 1 .807.795.8.8 0 0 1-.806.795H2.753A1.86 1.86 0 0 1 .89 21.395V4.966z" fill="#c6cad0"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M8.08 13.71a3.454 3.454 0 0 0 3.463-3.444A3.454 3.454 0 0 0 8.08 6.82a3.454 3.454 0 0 0-3.462 3.445A3.454 3.454 0 0 0 8.08 13.71zm0-1.59a1.86 1.86 0 0 0 1.865-1.854A1.86 1.86 0 0 0 8.08 8.41a1.86 1.86 0 0 0-1.864 1.855A1.86 1.86 0 0 0 8.08 12.12z" fill="#c6cad0"></path><path d="M25.18 16.246a.859.859 0 0 0-1.206 0 .835.835 0 0 0-.25.595v4.763h-4.83a.858.858 0 0 0-.602.246.834.834 0 0 0 0 1.189c.16.158.376.246.602.246h4.83v4.764c0 .222.09.436.25.594a.858.858 0 0 0 1.205 0 .835.835 0 0 0 .25-.595v-4.763h4.83a.858.858 0 0 0 .602-.246.834.834 0 0 0 0-1.189.858.858 0 0 0-.602-.246h-4.83v-4.763a.835.835 0 0 0-.25-.595z" fill="#c6cad0"></path></svg>
                                        </div>
                                        <p class="img-p">업로드할 이미지를 첨부해 주세요.</p>
                                        <button type="button" class="upload-btn">이미지 업로드</button>
                                    </div>
                                </div>
                            </section>
                        </form>
                    </main>
                    
            </div>
            
        </div>
    </div>

</body>
</html>