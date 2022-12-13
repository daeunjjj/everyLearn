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
                                <div class="wrapper">
                                    <p>직군</p>
                                    <div>
                                        <input type="text" name="job" class="input">
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="second">

                        </section>
                        <section class="third">

                        </section>
                        <section class="fourth">

                        </section>

                    </div>
                </div>
            </form>
        </article>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>