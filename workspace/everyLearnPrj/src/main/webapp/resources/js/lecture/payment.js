
		/////////////////////////////////결제
		var IMP = window.IMP; // 생략 가능
    	IMP.init("imp60434644"); //가맹점 식별코드
    	
    	 function requestPay() {
    	      // IMP.request_pay(param, callback) 결제창 호출
    	      IMP.request_pay({ // param
    	          pg: "INIpayTest",
    	          merchant_uid : 'merchant_'+new Date().getTime(),
    	          name: prodName,
    	          amount: finalTotalPrice,
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
    	    	            headers: { "Content-Type": "application/json" },
    	    	            data: {
    	    	                imp_uid: rsp.imp_uid,
    	    	                merchant_uid: rsp.merchant_uid
    	    	            }
    	    	        })
						//.done(function (data) {
    	    	          // 가맹점 서버 결제 API 성공시 로직
    	    	        //})
    	    	      } else {
    	    	        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    	    	      }
    	    	    })
    	    	    };