<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<link rel="stylesheet" href="/el/resources/css/emp-comm/write.css">
<link rel="stylesheet" href="/el/resources/css/emp-comm/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- 썸머노트 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>



</head>
<body>
	<%@ include file="/WEB-INF/views/common/emp-header.jsp" %>
  <main id="main">
    
    <form action="/el/emp-comm/write" method="post" id="write-fr">
        <br><br> 
                  <div id="category">
                      <select name="category" id="category-btn">
                          <option value="1">취업 / 이직</option>
                          <option value="2">커리어고민</option>
                          <option value="3">회사생활</option>
                          <option value="4">인간관계</option>
                      </select>
                  </div>
        <button id="edit" onclick="edit()" class="btn btn-outline-secondary me-md-2" type="button">수정</button>
	    <button id="save" onclick="save()" class="btn btn-outline-secondary me-md-2" type="button">수정 완료</button>
        <div id="title"><input type="text" name="title" required  value="${ n.title }"></div>
        <!-- <div id="summernote" name="content"></div> -->
         <textarea id="summernote" name="content"></textarea>
         
        <div id="write"><button type="submit" class="btn btn-light" id="submit-btn">수정하기</button></div>
    </form>
  </main>
    
    
    <script>
   		

    $(document).ready(function () {

        console.log($.summernote.options);

        // 실행시 언어 설정을 한글로 설정 

        $.summernote.options.lang = 'ko-KR';

        $.summernote.options.airMode = false;

    });


    var a = $('#summernote');


    // 수정버튼

    var edit = function () {

        a.summernote({ focus: true });

    };

    // 수정 종료

    var save = function () {

        var markup = a.summernote('code');

        a.summernote('destroy');

    };
    
    	
    const submitBtn = document.querySelector("#submit-btn");
	
    submitBtn.addEventListener('click', function(){
        confirm('수정하시겠습니까?');
    })
      
    </script>
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>