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
                <form action="/el/admin/request/edit" method="post">
                    <div class="question-content">
                        
                        <c:forEach items="${voList}" var="list" varStatus="status">
                            <input name="voList[${status.index+1 }].no" value="${list.no}" hidden>
							<div class="question-area grid-area">
                                <div>${status.index+1}</div>
	                            <div>
	                                <input type="text" name="voList[${status.index+1 }].type" value="${list.type }">
	                            </div>
	                            <div class="quit-btn">
                                    <!-- <button type="button" onclick="deleteBtn('${list.no}','${status.index+1 }');">삭제</button> -->
	                            </div>
	                        </div>
						</c:forEach>
                        <div id="add"></div>
                        <div class="add-btn-area btn">
                            <button id="addBtn" type="button" onclick="add();">
                                <span>
                                    질문
                                    <i class="bi bi-plus"></i>
                                </span>
                            </button>
                        </div>
                        <div class="btn-area btn">
                            <button type="submit">수정</button>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script>
        function add(){
            $("#add").append('<div class="question-area grid-area new-div"> <div><i class="bi bi-plus"></i></div> <div> <input type="text" name="voList[0].type"> </div> <div class="quit-btn"> <button type="button" onclick="deleteBox();">삭제</button> </div> </div>');
            $("#addBtn").attr("disabled", true);
        }
        
        function deleteBox(){
            $(".new-div").remove();
            $("#addBtn").attr("disabled", false);
        }

        // function deleteBtn(no, idx){
        //     console.log(no);
        //     if(confirm(idx+'번 질문을 삭제하시겠습니까?')){
        //         $.ajax({
        //             url : "/el/admin/request/delete",
        //             method : "post",
        //             data : { "no" : no },
        //             success : function(result){
        //                 if(result != ""){
        //                     window.location.href = "/el/admin/request/edit";
        //                 }
        //             },
        //             error : function(){
        //                 alert('통신실패');
        //             }


        //         });
        //     } 
        // }
    </script>
</body>
</html>