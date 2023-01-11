<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/mail/send-common.css">
<link rel="stylesheet" href="/el/resources/css/admin/mail/all-send.css">
<script type="text/javascript" defer src="/el/resources/js/admin/send-mail.js"></script>
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>전체메일발송</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <h2>메일쓰기</h2>
                <div class="mail-wrap">
                    <form action="/el/admin/mail/all-send" method="POST"  enctype="multipart/form-data" onsubmit="return sendCheck();">
                        <div class="input-area">
                            <label>선택</label>
                            <div class="radio-wrap">
                                <label>학생회원
                                    <input name="toAddress" type="radio" value="1">
                                </label>
                                <label>강사회원
                                    <input name="toAddress" type="radio" value="2">
                                </label>
                                <label>기업회원
                                    <input name="toAddress" type="radio" value="3">
                                </label>
                            </div>
                        </div>

                        <div class="input-area">
                            <label for="title">제목</label>
                            <div>
                                <input type="text" id="title" name="title">
                            </div>
                        </div>
                        <div class="input-area">
                            <label for="multipartFile">첨부파일</label>
                            <div class="attach-wrap" >
                                <input type="file" id="multipartFile" name="multipartFile" >
                            </div>
                        </div>
                        <div id="add-next"></div>
                        <div class="input-area content">
                            <label>내용</label>
                            <div  class="text-wrap">
                                <textarea name="content"></textarea>
                            </div>
                        </div>
                        <div class="btn-area">
                            <button>
                                보내기
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
    <script>
        function sendCheck(){

            const title = $("#title").val();
            const content = $("#content").val();
            

            if(title == '' && content == ''){
                return false;
            }


            return true;
        }
    </script>
</body>
</html>