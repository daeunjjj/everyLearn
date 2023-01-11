<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">


    
<link rel="stylesheet" href="/el/resources/css/emp-comm/detail.css">
<link rel="stylesheet" href="/el/resources/css/emp-comm/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
 

 <!-- 썸머노트 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


</head>


</head>

<body>
<%@ include file="/WEB-INF/views/common/emp-header.jsp" %>

	
 	<main>
 	
        <div class="container">
            <div class="detailBar">
                <div id="category">${ n.category }</div>
                <div id="btn">
                	
                    <a href="/el/emp-comm/list?no=${ n.no }" class="btn btn-outline-secondary me-md-2" type="button" >목록</a>
                    
                    <c:if test="${ n.mno == loginMember.memberNo }">
	                    <button id="edit" onclick="location.href = '/el/emp-comm/edit?no=${ n.no }'" class="btn btn-outline-secondary me-md-2" type="button">수정</button>
	                    <button id="delete-btn" onclick="deleteDetail()" class="btn btn-outline-secondary me-md-2" type="button">삭제</button>
                    </c:if>	
                </div>
            </div>
            <div class="title"><span id="title">${ n.title }</span></div>
            <div class="info"><span id="nick" name="nick">${ n.nick }	|	${ n.enrollDate }	|	${ n.hit }</span></div>
            <div class="content" id="summernote" name="content">${ n.content }</div>
            
            
            <div class="etc">
            
            
<!-- !!!!!!좋아요 버튼 <span class="material-symbols-outlined" id="favorite">favorite</span> -->
                <div>
	               <a class="heart" style = "text-decoration-line: none;">
						<img id="heart" src="/el/resources/img/emp-community/icon/heart-fill.svg" width="21px" height="21px" />
					</a>
                </div>
<!-- !!!!!!!!!!!좋아요 끝 -->



                <div>
                    <button type="button" id="more"><span class="material-symbols-outlined" id="more">more_horiz</span></button>
                </div>
            </div>
            
            
<!-- ~~~ 댓글 시작 ~~~ ----------------------------------------------------------------------------->            

            <div class="comment-area">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
                        <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                    </svg>
            </div>
            
            <div class="comment">

                <div class="profile">
                    <div id="info">
                        <div id="photo"></div>
                        <div id="info2"><span id="nick">가나다</span> <span id="enroll-date">22.1.13 15:30</span></div>
                        <div id="ed">
                        	<c:if test = " ${ n.mno == loginMember.memberNo } ">
                            	<a href="" id="edit1">수정</a>
                            	<a href="" id="delete1">삭제</a>
                            </c:if>
                        </div>
                    </div>
                    
                </div>

                <div class="comment-content">
                   		고민이 많으시겠네요 ㅠㅠ 힘내시길 바랍니다!
                   	<br>
                  	
                </div>

                <div class="profile">
                    <div id="info">
                        <div id="photo"></div>
                        <div id="info2"><span id="nick">삥뽕</span> <span id="enroll-date">22.11.30 15:30</span></div>
                    </div>
                </div>

                <div class="comment-content">
                    	파이팅!!!
                    <br>
                </div>

                <div class="profile">
                    <div id="info">
                        <div id="photo"></div>
                        <div id="info2"><span id="nick">iliilili</span> <span id="enroll-date">22.11.30 15:30</span></div>
                    </div>
                </div>

                <div class="comment-content">
                    	저도 걱정이 많습니다 그래도 힘내요!!!
                    <br>
             
                </div>
                
                
                
		
                <div class="my-comment-area">
	                <c:choose>
	                	<c:when test="${ empty loginMember }">
		                    <div id="my-comment-div">
		                        <form action="" method="post">
		                            <textarea id="my-comment2" placeholder="로그인 후 작성하실 수 있습니다." disabled></textarea>

		                        </form>
		                    </div>
	                    </c:when>
	                    <c:otherwise>
	                    
	                    	<div id="info">
		                        <div id="photo"></div>
		                        <div id="info2"><span id="nick">${ loginMember.memberNick }</span></div>
		                    </div>
<!--  댓글 작성 폼 start----------------------------------------------------------------------------------------------->
				            <div id="my-comment-div">
				                <form action="/el/emp-comm/comment/write" method="post" name="comment-form" autocomplete="off">
				                	<input type="hidden" name="no" th:value="*{no}" />
				                    <textarea id="my-comment2" placeholder="댓글을 입력해 주세요." name="content"></textarea>
				                    <button type="submit" class="btn btn-success" id="submit-btn">등록</button>
				                </form>
				           	</div>	
<!-- - 댓글 작성 폼 end -------------------------------------------------------------------------------------------------------->
	                    </c:otherwise>
	                </c:choose> 
                </div>

	
	
            </div> 
<!-- ~~~~ 댓글 끗 ~~~ -------------------------------------------->
        </div>

        <nav class="navbar sticky-bottom bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#"><span class="material-symbols-outlined">arrow_upward</span></a>      
            </div>
        </nav>
    </main>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>


    <script>
    
  	//썸머노트
    $(document).ready(function () {

        console.log($.summernote.options);

        // 실행시 언어 설정을 한글로 설정 

        $.summernote.options.lang = 'ko-KR';

        $.summernote.options.airMode = false;

    });
    
 	//삭제
    function deleteDetail() {
    	
    	var result = confirm("작성 글을 삭제하시겠습니까?")
    	
        if (result == true) {
        	location.href = "/el/emp-comm/delete?no=${ n.no }";
        } else {      	
            alert("삭제 취소");
        }
    }
    

 // 좋아요 버튼을 생성하는 코드
	// 좋아요 이미지는 부트스트랩 아이콘의 heart.svg, heart-fill.svg 저장해서 사용
	// heart : 좋아요O, heart-fill : 좋아요X
	
	 $(document).ready(function () {
			
			// 좋아요가 있는지 확인한 값을 heartval에 저장
	        var heartval = '${heart}';
	        // heartval이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드
	        if(heartval>0) {
	            console.log(heartval);
	            $("#heart").prop("src", "/el/resources/img/emp-community/icon/heart-fill.svg");
	            $(".heart").prop('name',heartval);
	        } else {
	            console.log(heartval);
	            $("#heart").prop("src", "/el/resources/img/emp-community/icon/heart.svg");
	            $(".heart").prop('name',heartval);
	        }
    
		});
	 
	// 좋아요 버튼을 클릭 시 실행되는 코드
        $(".heart").on("click", function () {
            var that = $(".heart");
	    $.ajax({
	    	
	    	url :'/emp-comm/heart',
	    	
	        type :'POST',
	        
	        data : {'no' : '${n.no}', 
	        	'memberNo' : '${loginMember.memberNo}'
        	},
		        	
	        
	    	success : function(data){
	    		that.prop('name',data);
	        	if(data==1) {
	        		$("#heart").prop("src", "/el/resources/img/emp-community/icon/heart-fill.svg");
	        	} else {
	        		$("#heart").prop("src", "/el/resources/img/emp-community/icon/heart.svg");
	        	}
             }
	    });
       });
 	
    
//댓글	
	$(document).ready(function(){
		getCommentList();
	});
	
	
	function getCommentList(){
		var no = $('input[name=no]').val();
		$.ajax({
			type : 'GET',
			url : '/getCommentList',
			data : {no},
			success : function(result){
				console.log(result);
				for(var i = 0; i < result.length; i++){
					var str = "<div class=\"comment\">"
					str += result[i].content + "</div><hr>"
					$("#comment").append(str);
				}
			},
			error : function(result){
				
			},
			complete : function(){
				
			}
		});
};
    
    
    </script>

</body>

</html>