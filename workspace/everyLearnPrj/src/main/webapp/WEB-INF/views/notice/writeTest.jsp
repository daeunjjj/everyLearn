<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<link rel="stylesheet" href="/el/resources/css/notice/writeTest.css">
<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">

<!-- TOAST UI Editor CDN URL(CSS)-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<!-- 파비콘 -->
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>

	
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>공지사항</h1>

            <div id="line"></div>

            <div class="main-wrap">

                <!-- TOAST UI Editor가 들어갈 div태그 -->
    			<div id="editor"></div>	
    			<!-- !!여기!! 에디터 내용을 받을 div태그-->
    			<div id="contents"></div>
    			
    			<!-- TOAST UI Editor CDN URL(JS) -->
    			<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

			</div>

        </main>

    </div>
    
    <!-- TOAST UI Editor 생성 JavaScript 코드 -->
    <script>
        const editor = new toastui.Editor({
            el: document.querySelector('#editor'),
            previewStyle: 'vertical',
            height: '650px',
            initialValue: '',
            language: 'ko'
        });
        
	     // !!여기!! editor.getHtml()을 사용해서 에디터 내용 받아오기
	     document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHtml());
	     console.log(editor.getHtml());
    </script>

</body>
</html>