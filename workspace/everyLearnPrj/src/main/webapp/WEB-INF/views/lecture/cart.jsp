<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/0c7f523053.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
<link rel="stylesheet" href="/el/resources/css/lecture/cart.css" />
<link rel="stylesheet" href="/el/resources/js/lecture/payment.js" />
</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<main id="container">
	
	<div class="wrap">
	
		<div id="wrap-top">
			<div id="cate-name">장바구니</div>
			<c:choose>
			<c:when test="${empty list}">
			<div style="margin-top:100px; text-align:center; font-size:22px; font-weight:600;">장바구니에 담긴 강의가 없습니다.</div>
			</c:when>
			<c:otherwise>
			<div id="carts-num"> <span id="cnt">0</span>개 강의가 선택되었습니다.</div>
			
			
		</div>
		<div id="cart-wrap">
			<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input id="all" type="checkbox" onchange="classCheckAll()"><label for="all">전체선택</label>
				</div>						
				
			<!-- <div id="cart-item">
				<div id="leccart-check"><input type="checkbox" class="individual-checkbox" checked="checked"></div>
				<div id="leccart-img"><a href='#'><img src="/el/resources/img/lecture/lecpic.png" alt="강의이미지"></a></div>
				<div id="leccart-name">아이패드로 일상 그리기, 프로크리에트를 이용한 드로잉 클래스</div>
				<div id="leccart-price">49,900원</div>
				<div id="leccart-teacher">강사이름</div>
				
			</div> -->
			
			
				<c:forEach items="${list}" var="list">
		            <div id="cart-item" class="cart_info_div">
						<!-- <div id="leccart-check"><input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked"></div> -->
						<div id="leccart-check"><input type="checkbox" name="check" value="${list.classNo}" onchange="classCheckOne()"></div>
						<input type="hidden" name="price" value="${list.price}">
						<input type="hidden" name="classNo" value="${list.classNo}">
						<input type="hidden" name="no" value="${list.no }">
						<%-- <input type="hidden" class="individual_totalPrice_input" value="${list.price}"> --%>
						<div id="leccart-img"><a href='#'><img src="/el/resources/img/lecture/lecpic.png" alt="강의이미지"></a></div>
						<div id="leccart-name">${list.className}</div>
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
		     
			
				<c:choose>
					<c:when test="${empty list}">
					</c:when>
					<c:otherwise>
						<div id="pay-wrap">
							
								<div id="all-pr">선택상품 금액</div>
								<div id="all-price"><span class="productPrice">0</span> 원</div>
								<div id="using-po">포인트 사용</div>
								
								<div id="using-point"><input type="text" name="use-point" id="use-point" onchange="inputValueChange()" width="60%" placeholder="사용할 포인트를 입력해주세요.">
								</div>
								
								
									<div id="usable-point">보유금액 ${mp } 원</div>
								
								
								<div id="checked-pr">결제금액</div>
								<div id="checked-price"><span class="finalPrice" id="finalPrice">0</span> 원</div>
								<input type="hidden" name="finalTotalPrice" id="finalTotalPrice" value=""/>
								<input type="hidden" name="finalTotalPrice" id="finalTotalPrice" value=""/>
								
								<div id="pay-btn"><button id="btns" onclick="requestPay();">결제하기</button></div>
								
						
						</div>
					</c:otherwise>
				</c:choose>

		</div>
		

	</div>
	



</main>

<script type="text/javascript">

		$(document).ready(function(){
			
			/* 종합 정보 섹션 정보 삽입 */
			setTotalInfo();	
			
			/* 이미지 삽입 
			$(".image_wrap").each(function(i, obj){
			
				const bobj = $(obj);
				
				if(bobj.data("bookid")){
					const uploadPath = bobj.data("path");
					const uuid = bobj.data("uuid");
					const fileName = bobj.data("filename");
					
					const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
					
					$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
				} else {
					$(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
				}
				
			}); */
			
			
		});	
		// 전체선택
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
		
		//장바구니 삭제
		function deleteOne(classNo) {
			  $.ajax({
			      method: 'POST',
			      url: '/el/cart/delete',
			      traditional : true,
			      data: {
			          classNo: [classNo]
			      },
			      success: function (result){			          
			        $('input[value='+ classNo +']').parent().remove() // 페이지 새로고침
			        setTotalInfo();
			      }  
			  })
			}
		
		function inputValueChange(){
	        let usedPoint = document.getElementById('use-point').value;
	        console.log("usedPoint :: " + usedPoint)
	        setTotalInfo();
	    }
		
		var finalPrice = 0;
		var usedPoint = 0;
		
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		function setTotalInfo(){
			
			let checkArr = document.querySelectorAll('.cart_info_div input[name=check]');
		    let price = document.querySelectorAll('.cart_info_div input[name=price]');
		    let cnt = 0;
		    let totalPrice = 0;
		    
		    for(let i = 0; i < checkArr.length; i++){
		        if(checkArr[i].checked === true){
		            totalPrice += parseInt(price[i].value);
		            cnt += 1;
		        }
		    }
		    console.log("price : " + price);
		    console.log("total price : " + totalPrice);
			
			console.log("cnt: " + cnt);
			
		    let productPrice = document.getElementsByClassName('productPrice')
		    for(let i = 0; i < productPrice.length; i++){
		       productPrice[i].innerHTML = totalPrice.toLocaleString(undefined, {maximumFractionDigits: 5});
		    }
			console.log("product price : " + productPrice);
		
			document.getElementById('cnt').innerText = cnt;
			
			 //포인트
			usedPoint = document.getElementById('use-point').value;
			finalPrice = 0; 
						
			if(usedPoint == null || usedPoint == 0){
				finalPrice  += totalPrice;
			}else if(usedPoint > ${mp}){
				alert('보유 포인트보다 입력한 포인트가 많습니다.');
			}else{
				finalPrice = totalPrice - usedPoint;
			} 
			
			//finalPrice.innerHTML = finalPricetoLocaleString(undefined, {maximumFractionDigits: 5});
			console.log("finalprice : " + finalPrice);
			document.getElementById('finalPrice').innerText = finalPrice.toLocaleString(undefined, {maximumFractionDigits: 5});
			document.getElementById('finalTotalPrice').value = finalPrice;
		
			
			
		}
		
    	            
        let prodName = '${list.get(0).className}';
        console.log("prodName : " + prodName);
        const cnt = ${list.size()};
        if(cnt > 1){
            prodName += ' 외 ' +(cnt-1) +'건'
        }
        const name = '${loginMember.memberName}';
        console.log("name : " + name);
        const email = '${loginMember.email}';
        const phone = '${loginMember.phone}';
          

/////////////////////////////////결제
		var IMP = window.IMP; // 생략 가능
    	IMP.init("imp06204768"); //가맹점 식별코드
    	
    	 function requestPay() {
      	      // IMP.request_pay(param, callback) 결제창 호출
      	      IMP.request_pay({ // param
      	          pg: "INIpayTest",
      	          merchant_uid : 'merchant_'+new Date().getTime(),
      	          name: prodName,
      	          amount: finalPrice,
      	          buyer_email: email,
      	          buyer_name: name,
      	          buyer_tel: phone,
      	          // buyer_postcode: "01181"
      	      }, function (rsp) { // callback
      	    	  if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
      	    	        // jQuery로 HTTP 요청
      	    	        jQuery.ajax({
      	    	            url: "/el/payment/info", // 예: https://www.myservice.com/payments/complete
      	    	            method: "POST",
      	    	            headers: { "Content-Type": "application/x-www-form-urlencoded" },
      	    	            data: {
      	    	                imp_uid: rsp.imp_uid,
      	    	                merchant_uid: rsp.merchant_uid,
      	    	                amount: finalPrice,
      	    	                usePoint: usedPoint,
      	    	                //classNum : $('.cart_info_div input[name=check]').val()
      	    	            }
      	    	            
      	    	        })

   						/* .done(function (data) {
      	    	           //가맹점 서버 결제 API 성공시 로직
      	    	        }) */
      	    	      } 
      	    	  else {
      	    	        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
      	    	      }

      	    	    })
    	}
  		  
            </script>



	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	
</body>
</html>