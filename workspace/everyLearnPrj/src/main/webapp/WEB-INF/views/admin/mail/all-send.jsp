<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/mail/all-send.css">
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
                    <form action="">
                        <div class="input-area">
                            <label>선택</label>
                            <div class="radio-wrap">
                                <label>학생회원
                                    <input name="all-receiver" type="radio" value="student">
                                </label>
                                <label>강사회원
                                    <input name="all-receiver" type="radio" value="teacher">
                                </label>
                                <label>기업회원
                                    <input name="all-receiver" type="radio" value="corporate">
                                </label>
                                <label>관리자
                                    <input name="all-receiver" type="radio" value="admin">
                                </label>
                            </div>
                        </div>
<!--                    <div class="input-area" id="add-next">
                           <label for="receiver">받는사람</label>
                           <div class="receiver-wrap">
                               <input type="text" id="receiver" name="receiver">
                            </div>
                            <div class="add-btn-area">
                                <button type="button" class="add-btn" onclick="add();">
                                    <span>
                                        <i class="bi bi-plus"></i>
                                    </span>
                                </button>
                            </div> 
                        </div>-->   
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

</body>
</html>