<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 메일 발송</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/mail/send.css">
<link rel="stylesheet" href="/el/resources/css/admin/mail/send-common.css">
<script type="text/javascript" defer src="/el/resources/js/admin/send-mail.js"></script>
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>메일발송</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <h2>메일쓰기</h2>
                <div class="mail-wrap">
                    <form action="/el/admin/mail/send" method="post" enctype="multipart/form-data" onsubmit="return sendCheck();">
                        <input type="hidden" name="name" id="name">
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
                        <div class="input-area">
                            <label for="multipartFile">첨부파일</label>
                            <div class="attach-wrap" >
                                <input type="file" id="multipartFile" name="multipartFile" >
                            </div>
                            <div class="add-btn-area">
                                <button type="button" class="add-btn" onclick="add();">
                                    <span>
                                        <i class="bi bi-plus"></i>
                                    </span>
                                </button>
                            </div> 
                        </div>
                        <div id="add-next"></div>
                        <div class="input-area content">
                            <label>내용</label>
                            <div  class="text-wrap">
                                <textarea id="content" name="content"></textarea>
                            </div>
                        </div>
                        <div class="btn-area">
                            <button type="submit">
                                보내기
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
    <script>
        // 쿼리스트링에 메일 가져오기
        const urlSearch = new URLSearchParams(location.search);
        const mailAddress = urlSearch.get('address');

        
        // 널이 아니면 input에 값 넣어주기
        if(mailAddress != ''){
            $("#toAddress").val(mailAddress);
        }


        function sendCheck(){
            let emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            const toAddress = $("#toAddress").val();
            const title = $("#title").val();
            const content = $("#content").val();
            
            if(!emailReg.test(toAddress)){
                return false;
            }

            if(title == '' && content == ''){
                return false;
            }


            return true;
        }

    </script>
</body>
</html>