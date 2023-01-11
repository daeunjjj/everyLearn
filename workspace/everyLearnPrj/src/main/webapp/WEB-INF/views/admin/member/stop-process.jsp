<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정지처리</title>
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
        width: 200px;
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
        margin-left: 10px;
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
    
</style>
</head>
<body>
	<main>
        <h1>정지처리</h1>

        <div class="process-box">
            <div class="input-wrap">
                <div>
                    <label for="blacklist">아이디</label>
                </div>
                <div>
                    <input type="text" name="id" id="id">
                </div>
            </div>
            <div class="input-wrap input-date">
                <div>
                    <label for="start">시작일</label>
                </div>
                <div id="date-box">
                    <input type="date" name="startDate" id="start">
                </div>         
            </div>
            <div class="input-wrap input-date">
                <div>
                    <label for="finish">시작일</label>
                </div>
                <div id="date-box">
                    <input type="date" name="finishDate" id="finish">
                </div>         
            </div>
        </div>
        <div class="btn-area">
            <button onclick="processBtn();">처리</button>
        </div>
    </main>
    <script>
        // 날짜 설정
        const now = new Date();
        const start = new Date(now.setDate(now.getDate()));

        $('#start').attr('min', start.toISOString().slice(0, 10));
        $('#start').val(start.toISOString().slice(0, 10));
        
        $('#finish').attr('min',start.toISOString().slice(0, 10));

        // 부모창에서 값가져오기
        const id = opener.$("#id").val();
        const no = opener.$("#no").val();
        // 현재 창에 값 넣어주기
        $("#id").val(id);


        function processBtn(){
            const start = $("#start").val();
            const finish = $("#finish").val();

            console.log(start);
            console.log(finish);

            if(start != "" && finish != ""){
                $.ajax({
                url : "/el/admin/member/stop-process",
                method : "post",
                data : {
                    "blacklist": no ,
                    "startDate" : start ,
                    "finishDate" : finish
                },
                success : function(data){
                    if(data != ""){
                        $("#finishDate", opener.document).val(finish);
                        opener.parent.alert(); 
                        window.close();
                    }
                },
                error : function(){
                    alert('통신실패');
                }
            });
            }


        }

    </script>
</body>
</html>