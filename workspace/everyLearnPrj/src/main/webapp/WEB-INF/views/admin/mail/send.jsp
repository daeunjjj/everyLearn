<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/mail/send.css">
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
                    <form action="">
                        <div class="input-area" >
                           <label for="receiver">받는사람</label>
                           <div class="receiver-wrap" id="add-next">
                               <input type="text" id="receiver" name="receiver" >
                            </div>
                            <div class="add-btn-area">
                                <button type="button" class="add-btn" onclick="add();">
                                    <span>
                                        <i class="bi bi-plus"></i>
                                    </span>
                                </button>
                            </div> 
                        </div>
                        <div class="input-area">
                            <label for="title">제목</label>
                            <div>
                                <input type="text" id="title" name="title">
                            </div>
                        </div>
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
        function add(){
            $("#add-next").append('<div class="receiver-wrap  new-receiver"><input type="text" id="receiver" name="receiver" ></div>');
        }
    </script>
</body>
</html>