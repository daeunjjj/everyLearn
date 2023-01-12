<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>everyLearn</title>
<script src="https://kit.fontawesome.com/0c7f523053.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="/el/resources/css/lecture/cart.css" />
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	
	<div class="wrap">
	
		<div id="wrap-top">
			<div id="cate-name">찜</div>
			<c:choose>
			<c:when test="${empty list}">
			<div style="margin-top:100px; text-align:center; font-size:22px; font-weight:600;">찜 목록에 담긴 강의가 없습니다.</div>
			</c:when>
			<c:otherwise>
			<div id="carts-num"> <span id="cnt">0</span>개 강의가 선택되었습니다.</div>
			
		</div>
		<div id="cart-wrap">
			<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input id="all" type="checkbox" onchange="classCheckAll()"><label for="all">전체선택</label>
				</div>	
			
			
			
				<c:forEach items="${list}" var="list">
		            <div id="cart-item" class="cart_info_div">
						<!-- <div id="leccart-check"><input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked"></div> -->
						<div id="leccart-check"><input type="checkbox" name="check" value="${list.classNo}" onchange="classCheckOne()"></div>
						<input type="hidden" name="price" value="${list.price}">
						<input type="hidden" name="classNo" value="${list.classNo}">
						<%-- <input type="hidden" class="individual_totalPrice_input" value="${list.price}"> --%>
						<div id="leccart-img"><a href='#'><a href='#'><img src="/el/resources/upload/${list.thumb}" width="300px" height="140px"alt="강의이미지"></a></div>
						<a href="/el/lecture/detail?bno=${list.classNo}" class="atag"><div id="leccart-name">${list.className}</div></a>
						<div id="leccart-price">${list.price} 원</div>
						<button type="button" class="remove" onclick="deleteOne(${list.classNo})">삭제</button>
						<div id="leccart-teacher">${list.teacherNo}</div>
					</div>
			        </c:forEach>
			        
			        <c:set var="total" value="0" />
	             <c:set var="totalCnt" value="0"/>
	             <c:forEach var="list" items="${list}">
	                 <c:set var="total" value="${total + Integer.parseInt(list.price)}" />
	                 <c:set var="totalCnt" value="${totalCnt + 1}"/>
	             </c:forEach>
		     </c:otherwise>
		    </c:choose>
			
				

		</div>
		

	</div>
	



</main>

<script type="text/javascript">

$(document).ready(function(){
			
			/* 종합 정보 섹션 정보 삽입 */
			setTotalInfo();	
			
		});	

function setTotalInfo(){
	let checkArr = document.querySelectorAll('.cart_info_div input[name=check]');
	let cnt = 0;

	for(let i = 0; i < checkArr.length; i++){
		        if(checkArr[i].checked === true){
		            
		            cnt += 1;
		        }
	}	
	console.log("cnt: " + cnt);
	document.getElementById('cnt').innerText = cnt;

}

//전체선택
function chooseAll(e){
  // product-area에 있는 모든 input을 꺼내와서 checkbox에 담아준다.
  const checkbox = document.querySelectorAll('.cart_info_div input[type="checkbox"]')
  for (let i = 0; i < checkbox.length; i++) {
    // 타겟이 전체선택 checkbox가 체크 되면 product-area에 있는 checkbox들이 체크 된다.
    checkbox[i].checked = e.target.checked
  }

  setTotalInfo();
 
}
document.querySelector('#all').addEventListener('change', chooseAll)

$('#all').click();


//전체
function classCheckAll(){
    setTotalInfo();
}

//각각선택
function classCheckOne() {
    
    document.querySelector('#all').checked = false;
    setTotalInfo();
}
		
		//찜 목록 삭제
		function deleteOne(classNo) {
			  $.ajax({
			      method: 'POST',
			      url: '/el/cart/wish/delete',
			      traditional : true,
			      data: {
			          classNo: [classNo]
			      },
			      success: function (result){			          
			        $('input[value='+ classNo +']').parent().remove() // 페이지 새로고침
			        console.log("잉?")
			      }  
			  })
			}
		
	</script>



	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>