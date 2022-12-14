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

    <%@ include file="/WEB-INF/views/common/emp-header.jsp" %>
	<main id="container">
        <article class="article">
            <div class="title">
                <h5>정확하게 입력했는지 다시 한번 확인해주세요!</h5>
            </div>
            <form action="">
                <div class="main">
                    <div class="main-wrapper">
                        <section class="first">
                            <div class="title">
                                <h3>기본정보</h3>
                            </div>
                            <div class="info-wrapper">
                                <div class="basic-info">
                                    <div class="wrapper">
                                        <p>이름</p>
                                        <div>
                                            <input type="text" name="name" class="input">
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <p>전화번호</p>
                                        <div>
                                            <input type="text" name="phone" class="input">
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <p>이메일</p>
                                        <div>
                                            <input type="text" name="email" class="input">
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <p>개인 블로그 주소</p>
                                        <div>
                                            <input type="text" name="blog" class="input">
                                        </div>
                                    </div>
                                    <!-- 주소 api -->
                                    <div class="wrapper">
                                        <p>주소</p>
                                        <div>
                                            <input type="text" name="address" class="input">
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <p>상세주소</p>
                                        <div>
                                            <input type="text" name="address-deatail" class="input">
                                        </div>
                                    </div>
                                    <!-- 드롭다운으로 변경 예정 -->
                                    <div class="wrapper">
                                        <p>관심 직군</p>
                                        <div>
                                            <input type="text" name="job" class="input">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="second">
                            <div class="title">
                                <h3>경력</h3>
                            </div>
                            <div class="info-wrapper">
                                <div class="basic-info">
                                    <div class="school-wrapper">
                                        <div class="school">
                                            <h4>학력</h4>
                                            <div class="bottom"></div>
                                        </div>
                                        <div class="grid">
                                            <div class="wrapper">
                                                <p>학교</p>
                                                <div>
                                                    <input type="text" name="name" class="input">
                                                </div>
                                            </div>
                                            <div class="wrapper">
                                                <p>학교명</p>
                                                <div>
                                                    <input type="text" name="phone" class="input">
                                                </div>
                                            </div>
                                            <div class="wrapper">
                                                <p>전공</p>
                                                <div>
                                                    <input type="text" name="email" class="input">
                                                </div>
                                            </div>
                                            <!-- 드롭다운 변경 예정 -->
                                            <div class="wrapper">
                                                <p>졸업 여부</p>
                                                <div>
                                                    <input type="text" name="blog" class="input">
                                                </div>
                                            </div>
                                            <div class="wrapper">
                                                <p>교육기간</p>
                                                <div>
                                                    <input type="text" name="address" class="input">
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
                                            <div class="wrapper">
                                                <p>회사명</p>
                                                <div>
                                                    <input type="text" name="name" class="input">
                                                </div>
                                            </div>
                                            <div class="wrapper">
                                                <p>부서명</p>
                                                <div>
                                                    <input type="text" name="phone" class="input">
                                                </div>
                                            </div>
                                            <div class="wrapper">
                                                <p>직책</p>
                                                <div>
                                                    <input type="text" name="email" class="input">
                                                </div>
                                            </div>
                                            <div class="wrapper">
                                                <p>재직기간</p>
                                                <div>
                                                    <input type="text" name="blog" class="input">
                                                </div>
                                            </div>
                                            <!-- 드롭 다운 -->
                                            <div class="wrapper">
                                                <p>근무유형</p>
                                                <div>
                                                    <input type="text" name="address" class="input">
                                                </div>
                                            </div>
                                            <!-- 드롭 다운 -->
                                            <div class="wrapper">
                                                <p>재직 여부</p>
                                                <div>
                                                    <input type="text" name="address" class="input">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="third">
                            <div class="title">
                                <h3>보유 역량</h3>
                            </div>
                            <div class="info-wrapper">
                                <div class="basic-info">
                                    <div class="wrapper">
                                        <p>수상내역</p>
                                        <div>
                                            <input type="text" name="name" class="input">
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <p>수상년도</p>
                                        <div>
                                            <input type="text" name="phone" class="input">
                                        </div>
                                    </div>
                                    <!-- textarea -->
                                    <div class="wrapper">
                                        <p>상세설명</p>
                                        <div>
                                            <input type="text" name="email" class="input">
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <p>자격증명</p>
                                        <div>
                                            <input type="text" name="blog" class="input">
                                        </div>
                                    </div>
                                    <!-- textarea -->
                                    <div class="wrapper">
                                        <p>상세설명</p>
                                        <div>
                                            <input type="text" name="address" class="input">
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <p>취득일</p>
                                        <div>
                                            <input type="text" name="name" class="input">
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <p>발급기간</p>
                                        <div>
                                            <input type="text" name="phone" class="input">
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <p>언어명</p>
                                        <div>
                                            <input type="text" name="email" class="input">
                                        </div>
                                    </div>
                                    <!-- 드롭다운 -->
                                    <div class="wrapper">
                                        <p>수준</p>
                                        <div>
                                            <input type="text" name="blog" class="input">
                                        </div>
                                    </div>
                                    <!-- textarea -->
                                    <div class="wrapper">
                                        <p>자기소개</p>
                                        <div>
                                            <input type="text" name="address" class="input">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="fourth">
                            <div class="title">
                                <h3>추가정보</h3>
                            </div>
                            <div class="info-wrapper">
                                <div class="basic-info">
                                    <div class="wrapper">
                                        <p>링크</p>
                                        <div>
                                            <input type="text" name="name" class="input">
                                        </div>
                                    </div>
                                    <div class="wrapper">
                                        <p>첨부파일</p>
                                        <div>
                                            <input type="text" name="phone" class="input">
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

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>