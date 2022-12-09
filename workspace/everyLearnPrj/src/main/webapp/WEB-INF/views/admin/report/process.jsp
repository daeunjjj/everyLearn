<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 신고처리</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/report/process.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>신고처리</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <h2>신고내역</h2>
                <div class="list-items-wrap">
                    <div class="list-items">
                        <div>번호</div>
                        <div>신고자</div>
                        <div>피신고자</div>
                        <div>신고사유</div>
                        <div>신고시간</div>
                        <div>보기</div>
                        <div>상태</div>
                    </div>


                   <div class="list-items list">
                        <div>1</div>
                        <div>user01</div>
                        <div>user02</div>
                        <div>욕설/비방</div>
                        <div>2022-01-21 23:23:42</div>
                        <div>
                            <a href="">
                                게시물
                                <i class="bi bi-box-arrow-up-right"></i>
                            </a>
                        </div>
                        <div>미처리</div>
                   </div>
                </div>
                <div class="process-wrap">
                    <h2>신고작성</h2>
                    <div class="form-wrap">
                        <form action="">
                            <div class="input-wrap">
                                <div>
                                    <label for="blacklist">피신고자</label>
                                </div>
                                <div>
                                    <input type="text" id="blacklist" value="user01" name="blacklist" readonly>
                                </div>
                            </div>
                            <div class="input-wrap">
                                <div>
                                    처리방법
                                </div>
                                <div>
                                    <label>회원정지<input type="radio" name="method"></label>
                                    <label>사유불충분<input type="radio" name="method"></label>
                                </div>
                            </div>
                            <div class="input-wrap">
                                <div class="message">
                                    <label for="message">회원메시지</label>
                                </div>
                                <div class="textarea-wrap">
                                    <textarea name="message" id="message">[신고]회원님께서는 2022-01-21 23:23:42 시간에 작성한 게시물이 신고 당하여 금일부터 7일간 회원정지 처리되었습니다. ::: 회원정지 누르면 이 문장 띄어주고 사유 불충분 누르면 없애주기!</textarea>
                                </div>
                            </div>
                            <div class="input-wrap input-date">
                                <div>
                                    <label for="start">시작일-만료일</label>
                                </div>
                                <div>
                                    <input type="date" name="start" id="start">
                                    <span>-</span>
                                    <input type="date" name="finish" id="finish">
                                </div>
                                    
                            </div>
                            <div class="btn-area">
                                <button id="list-btn">목록</button>
                                <button>처리</button>
                            </div>
                        </form>
                    </div>
                </div>
        </main>
    </div>
</body>
</html>