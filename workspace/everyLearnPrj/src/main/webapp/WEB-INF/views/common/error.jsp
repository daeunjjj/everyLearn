<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<style>
.main{
    width: 100%;
    height: 100%;
    padding: 20px;
}

.main-text{
    padding: 100px
}

#h1{
    font-size: 85px;
    font-weight: 600;
    margin-bottom: 50px;
    background-color: #1187CF;
    color: white;
    padding: 15px;
    width: 40%;
    text-align: center;
}

#p{
    font-size: 25px;
    margin-bottom: 50px;
}

#p1{
    font-size: 50px;

}

#a{
    text-decoration: none;
    width: 13%;
    height: 50px;
    border: 1px solid lightgray;
    border-radius: 35px;
    display: flex;
    justify-content: center;
    flex-direction: column;
}

#a1{
    text-align: center;
    color: #1187CF;
}

#a:hover{
    background-color: lightgray;
}


</style>

<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">

</head>
<body>

	<main class="main">

        <div class="main-text">
            <div id="h1">
                <h1>ERROR 404!</h1>
            </div>
            <div id="p">
                <span id="p1">페이지를 찾을 수 없습니다.</span>
                <br><br>
                <span id="p2">올바른 URL을 입력하셨는지 확인해 주세요.</span>
            </div>
            <div id="a">
                <a href="/main" id="a1">메인으로 돌아가기</a>
            </div>
        </div>
    </main>

</body>
</html>