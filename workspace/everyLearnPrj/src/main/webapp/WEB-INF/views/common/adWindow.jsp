<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업</title>
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
    main{
        width: 100%;
        height: 100%;
    }
    label{
        margin-left: 10px;
    }
</style>
<body>
	<main>
        <img src="/el/resources/img/main/popup.png" alt="" width="450" height="380">
        <div>
            <label for="check">
                <input id="check" name="check" type="checkbox" onchange="check();">
                오늘 하루 이 창을 열지 않음
            </label>
        </div>
    </main>
    <script>
        //쿠키
        function check(){
            $.ajax({
                url : "/el/closePopup",
                method : "GET",
                success : function(data){
                    if(data != null){
                        window.close();
                    }
                },
                error : function(){
                    alert("ajax통신실패");
                }
            });
        
            
        }


    </script>
</body>
</html>