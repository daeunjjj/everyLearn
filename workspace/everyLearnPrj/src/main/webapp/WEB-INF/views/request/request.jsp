<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 요청</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="/el/resources/css/everylearn/request.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<main id="container">
		<section id="feedback-header">
			<div class="feedback-wrap">
				<div>에브리런에게 바란다!</div>
				<div>자유롭게 피드백 남겨주시면, 더 좋은 서비스로 만들어 갈게요.</div>
			</div>
		</section>
		<section id="question">
			<div>
				<form action="/el/request/submit" method="post" onsubmit="return check();">
					<div class="main-wrap question-area">
						<fieldset class="radio-area">
							<legend>
								<span>1.</span>
								<span>에브리런에 어떤 것을 요청하고 싶은가요?</span>
							</legend>
							<c:forEach items="${voList}" var="list" varStatus="status">
								
								<div class="select-area">
									<input type="radio" name="type" value="${list.no}" id="${list.no}">
									<label class="uncheck" for="${list.no}">
										<span class="idx">${status.index+1}</span>
										<span>${list.type }</span>
										<i class="bi bi-check-lg"></i>
									</label>
								</div>
							</c:forEach>
						</fieldset>
						<fieldset class="text-area">
							<legend>
								<span>2.</span>
								<span>위에서 체크한 항목에 대해 이야기 해주세요.</span>
							</legend>
							<div class="input-area">
								<input type="text" name="content" placeholder="답변을 입력해주세요.">
							</div>
						</fieldset>
						<div class="btn-area">
							<button type="submit">
								<span>제출
									<i class="bi bi-arrow-return-left"></i>
								</span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</section>
	<!--<%@ include file="/WEB-INF/views/common/footer.jsp" %>-->
	</main>
	<script>
		function check(){
			let content = $('input[name="content"]').val();

		
			
			if($(':radio[name="type"]:checked').length < 1){
				Swal.fire({
					icon: 'error',
					title: '요청을 체크해주세요.',
					confirmButtonColor: '#1187CF'
				})                     
				return false;
			}
			
			if(content == ""){
				Swal.fire({
					icon: 'error',
					title: '내용을 적어주세요.',
					confirmButtonColor: '#1187CF'
				})
				return false;
			}

			return true;
		}

	</script>
	
</body>
</html>