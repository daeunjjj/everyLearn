<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 보낸내역</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/mail/detail.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>보낸내역</h1>
            <div class="main-wrap">
                <div class="mail-wrap">
                    <form action="/el/admin/mail/send" method="post" onsubmit="return sendCheck();">
                        <div class="input-area" >
                            <label>보낸사람</label>
                            <div class="sender-wrap">
                                <p>엄격한</p>
                                <p>everylearn352@gmail.com</p>
                             </div>
                         </div>
                        <div class="input-area" >
                           <label for="toAddress">받는사람</label>
                           <div class="receiver-wrap">
                               <input type="text" id="toAddress" name="toAddress" >
                            </div>
                        </div>
                        <div class="input-area">
                            <label for="title">제목</label>
                            <div>
                                <input type="text" id="title" name="title">
                            </div>
                        </div>
                        <div id="add-next"></div>
                        <div class="input-area content">
                            <label>내용</label>
                            <div  class="text-wrap">
                                <textarea id="content" name="content"></textarea>
                            </div>
                        </div>
                        <div class="input-area">
                            <label for="multipartFile">첨부파일</label>
                            <div class="attach-wrap" >
                                <a href="/el/resources/upload/default-profile.png" download="테스트">테스트</a>
                            </div>
                        </div>
                        <div class="btn-area">
                            <button type="submit">
                                삭제
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
</body>
</html>