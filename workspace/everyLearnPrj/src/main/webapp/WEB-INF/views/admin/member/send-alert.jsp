<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림보내기</title>
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
    (function() {
    var link = document.createElement('link');
    link.type = 'image/x-icon';
    link.rel = 'shortcut icon';
    link.href = '/el/resources/img/logo/favicon-16x16.png';
    document.getElementsByTagName('head')[0].appendChild(link);
    }());
</script>
<style>

    h1 {
        background-color: #1187CF;
        text-align: center;
        padding: 30px;
        margin: 15px 0 10px 0;
        font-size: 21px;
        color: #fff;
    }

    .input-wrap{
        display: flex;
        flex-direction: row;
        border-bottom: 1px solid rgb(244, 244, 244);
    }

    .input-wrap>div:first-child{
        width: 120px;
        padding: 13px 0px 13px 20px;
        background-color: rgb(247, 245, 248);
        border-top: 1px solid rgb(244, 244, 244);
        text-align: left;
        font-weight: 500;
    }

    input{
        width: 100%;
        height: 40px;
        padding: 0px 11px 1px 15px;
        border-radius: 4px;
        border: 1px solid rgb(221, 221, 221);
        font-weight: 400;
        font-size: 16px;
        line-height: 1.5;
        color: rgb(51, 51, 51);
        outline: none;
        box-sizing: border-box;
    }
    .btn-area{
        display: flex;
        width: 100%;
        padding: 20px 0px;
        justify-content: center;
    }
    button{
        display: block;
        padding: 0px 10px;
        text-align: center;
        overflow: hidden;
        width: 80px;
        height: 42px;
        border-radius: 3px;
        color: rgb(255, 255, 255);
        background-color: #005297;
        border: 0px none;
    }

    .textarea-wrap{
        position: relative;
        display: flex;
        flex-direction: column;
        height: 225px;
        background-color: rgb(255, 255, 255);
        border: none;
    }

    textarea{
        display: block;
        width: 100%;
        height: 100%;
        padding: 15px 16px;
        font-size: 16px;
        line-height: 21px;
        word-break: break-all;
        z-index: 1;
        background: none;
        border-radius: 4px;
        outline: none;
        resize: none;
        border: 1px solid rgb(221, 221, 221);
    }

    .input-wrap>.message{
        height: 200px;
    }
</style>
</head>
<body>
	<main>
        <h1>알림메시지</h1>
        <div>
            <div class="input-wrap">
                <div>
                    <label for="blacklist">아이디</label>
                </div>
                <div>
                    <input type="text" name="id" id="id" readonly>
                </div>
            </div>
            <div class="input-wrap">
                <div class="message">
                    <label for="message">회원메시지</label>
                </div>
                <div class="textarea-wrap">
                    <textarea name="title" id="message"></textarea>
                </div>
            </div>
        </div>
        <div class="btn-area">
            <button onclick="sendBtn();">보내기</button>
        </div>
    </main>
    <script>
        // 부모창에서 값가져오기
        const id = opener.$("#id").val();
        const no = opener.$("#no").val();
        // 현재 창에 값 넣어주기
        $("#id").val(id);

        function sendBtn(){
            const message = $('#message').val();
            if(message != ""){
                $.ajax({
                    url : "/el/admin/member/send-alert",
                    method : "POST",
                    data : {
                        "memberNo" : no ,
                        "title" : message ,
                        "category" : "4"
                    },
                    success : function(data){
                        opener.parent.alert(); 
                        window.close();
                    },
                    error : function(){
                        alert("통신실패");
                    }
                });
            }
        }
    </script>
</body>
</html>