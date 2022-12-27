<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">

<link rel="stylesheet" href="/el/resources/css/notice/adminList.css">
<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
        <h1>NOTICE</h1>
        <div id="line"></div>
        <div class="main-wrap">
			<div class="list-wrap">
				
					<div class="th"><input type="checkbox" id="allCheck"></div>
					<div class="th">번호</div>
	                <div class="th">제목</div>
	                <div class="th"></div>
	                <div class="th">작성일시</div>
	                <div class="th">조회수</div>
	                <div class="th"></div>
	                <div class="th"></div>
				
				<c:forEach items="${list}" var="n">
					<div class="td" id="check"><input type="checkbox" class="checkbox-del" value="${n.no}"></div>
					<div class="td" id="no">${n.no}</div>
	                <div class="td" id="title"><a href="/el/notice/detail?no=${ n.no }" target="_blank" id="title-a">${n.title}</a></div>
	                <div class="td" id="adminNick">관리자</div>
	                <div class="td" id="enrollDate">${n.enrollDate}</div>
	                <div class="td" id="hit">${n.hit}</div>
	                <div class="td"><button onclick="location.href = '/el/notice/edit?no=${ n.no }'" id="edit">수정</button></div>
	                <div class="td"><button onclick="del();" id="del">삭제</button></div>
				</c:forEach>
					
			

					<div id="main-bot">
						<a href="/el/notice/write" class="btn btn-light" id="write">작성하기</a>
					</div>
		
				<!-- 페이징 start -->
				
	       	    
	       	    <div id="page-area" >
	   				<ul>
				        	<c:if test="${page.startPage != 1}">
				        <li>
								<a href="${page.startPage - 1}">이전</a>
				        </li>
							</c:if>
        
		         		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">

                        <li>
                           <c:if test="${page.currentPage != i and i <= page.lastPage}">
                           		<a class="numBtn" href="/el/notice/adminList/${i}">${i}</a>                           
                           </c:if>
                           <c:if test="${page.currentPage == i and i <= page.lastPage}">
                           		<a class="numBtn" href="/el/notice/adminList/${i}">${i}</a> 
                           </c:if>
                        </li>
               			</c:forEach>   

					        <c:if test="${page.endPage < page.lastPage}">
				        <li>
								<a href="${page.endPage + 1}">다음</a>
				        </li>
							</c:if>
				    </ul>
				</nav>
	            <!-- 페이지 end -->	
	       	    
			</div>
		</div>
        </main>
    </div>
    
    
    
    <script type="text/javascript">
		//전체 선택
		//let allCheck = document.querySelector('#allCheck');
		let allCheck = document.querySelector('div input[type=checkbox]');
		let delArr = document.getElementsByClassName('checkbox-del');
		
		allCheck.onchange = function(e){
			//console.log(e.target.checked);
			console.log(this.checked);
			if(this.checked){
				for(let i=0; i<delArr.length; i++){
					delArr[i].checked = true;
				}
			}else{
				for(let i=0; i<delArr.length; i++){
					delArr[i].checked = false;
				}
			}
		}
		
		//삭제하기
		function del() {
			//삭제할 번호(들) 가져오기
			let delArr = document.getElementsByClassName('checkbox-del');
			//가져온 번호(들)을 하나의 문자열로 합치기
			let result = "";
			
			for(let i = 0; i<delArr.length; i++){
				let t = delArr[i];
				if(t.checked){
					//children[1]가 no가 있음
					//console.log(t.parentNode.parentNode.children[1].innerText);					
					console.log(t.value);	
					result += t.value + ',';
				}
			}
			
			$.ajax({
				url : "/el/notice/delete",
				data : {"str" : result},
				type : "post",
				success : function(data){
					confirm('삭제하시겠습니까?');
					confirm('정말?');
					console.log(data);
				}, 
				error : function(error){
					console.log(error)
				},
				complete : function(){
					//새로고침
					window.location.reload();
				}
			});
		}//del()
	</script>
</body>
</html>