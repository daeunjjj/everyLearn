<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원기능요청</title>
<link rel="stylesheet" href="/el/resources/css/admin/request/edit.css">
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>질문수정 & 등록</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <div class="question-title grid-area">
                    <div>
                        번호
                    </div>
                    <div>
                        질문내용
                    </div>
                </div>
                <form action="">
                    <div class="question-content">
                        <div class="question-area grid-area">
                            <div>1</div>
                            <div>
                                <input type="text" name="content" value="어떤 기능을 추가하고싶으신가요?">
                            </div>
                            <div class="quit-btn">
                                <button>삭제</button>
                            </div>
                        </div>
                        <div class="question-area grid-area">
                            <div>2</div>
                            <div>
                                <input type="text" name="content" value="에브리런에서 어떤 강의를 듣고 싶으신가요?">
                            </div>
                            <div class="quit-btn">
                                <button>삭제</button>
                            </div>
                        </div>
                        <div class="question-area grid-area" id="add">
                            <div>3</div>
                            <div>
                                <input type="text" name="content" value="응원해주세요!">
                            </div>
                            <div class="quit-btn">
                                <button>삭제</button>
                            </div>
                        </div>      
                        <div class="add-btn-area btn">
                            <button type="button" onclick="add();">
                                <span>
                                    질문
                                    <i class="bi bi-plus"></i>
                                </span>
                            </button>
                        </div>
                        <div class="btn-area btn">
                            <button type="submit">등록</button>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script>
        function add(){
            $("#add").append('<div id="add-icon"><i class="bi bi-plus"></i></div><div class="question-area grid-area" id="add-question"><input type="text" name="content"></div><div class="quit-btn"><button>삭제</button></div>');}
    </script>
</body>
</html>