<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<link rel="stylesheet" href="/el/resources/css/qna/memberWrite.css">
<link rel="stylesheet" href="/el/resources/css/emp-comm/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">

<!-- 썸머노트 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script src="/el/resources/js/common/chat.js"></script>
</head>
<body>


<%-- <%@ include file="/WEB-INF/views/notice/notice-header.jsp" %> --%>

<div class="banner">
	<a href="/el/qna/list">< everyLearn Q&A</a>
</div>

<div class="wrap">
	<main id="main">
		
		<h1 id="qna">문의하기</h1>
	
	   	<div id="line"></div>
	
		<form action="/el/qna/memberWrite" method="post" id="write-fr" enctype="multipart/form-data">
	        <br><br> 
	                  <div id="category">
	                      <select name="category" id="category-btn">
	                          <option value="1">강의</option>
	                          <option value="2">결제</option>
	                          <option value="3">채용</option>
	                          <option value="4">기타</option>
	                      </select>
	                  </div>
	        <div id="title"><input type="text" name="title" required placeholder="제목"></div>
	        <textarea id="summernote" name="content"></textarea>
	        <div id="write"><button type="submit" class="btn btn-light" id="submit-btn">작성하기</button></div>
	    </form>
	 </main>
    
</div>



    
 	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
 <script>
 $(document).ready(function() {

 	var toolbar = [
  		// 글꼴 설정
          ['fontname', ['fontname']],
          // 글자 크기 설정
          ['fontsize', ['fontsize']],
          // 굵기, 밑줄, 취소 선, 서식지우기
          ['style', ['bold', 'underline','strikethrough', 'clear']],
           // 글자색
          ['color', ['forecolor','color']],
          // 글머리 기호, 번호매기기, 문단정렬
           ['para', ['paragraph']],
           // 표만들기
           ['table', ['table']],
           // 그림첨부, 링크만들기, 동영상첨부
           ['insert', ['link', 'picture', 'video']],
           // 줄간격
          ['height', ['height']]
 		  ];

 	var setting = {
             height : 550,
             minHeight : null,
             maxHeight : null,
             disableResizeEditor: true,
          	// 추가한 글꼴
     		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
     		 // 추가한 폰트사이즈
     		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
             focus : true,
             lang : 'ko-KR',
             toolbar : toolbar,
             callbacks : { //이미지 첨부
             onImageUpload : function(files, editor,
             welEditable) {
             for (var i = files.length - 1; i >= 0; i--) {
             uploadSummernoteImageFile(files[i],
             this);
             		}
             	}
             }
          };

         $('#summernote').summernote(setting);
         });
 
 
	 function sendFile(file, el) {
	     var form_data = new FormData();
	     form_data.append('file', file);
	     $.ajax({
	       data: form_data,
	       type: "POST",
	       url: "/uploadSummernoteImageFile",
	       cache: false,
	       contentType: false,
	       enctype: 'multipart/form-data',
	       processData: false,
	       success: function(url) {
	         $(el).summernote('editor.insertImage', url);
	         $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
	       }
	     });
	   }
   
 </script>
	
	
	

</body>
</html>