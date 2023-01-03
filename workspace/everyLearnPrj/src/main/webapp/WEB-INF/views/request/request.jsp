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
				<form action="/el/request" method="post" onsubmit="return check();">
					<div class="main-wrap question-area">
						<fieldset class="radio-area">
							<legend>
								<span>1.</span>
								<span>에브리런에 어떤 것을 요청하고 싶은가요?</span>
							</legend>
							<div class="select-area">
								<label id="lecture">
									<span>A</span>
									<span>새로운 강의를 듣고싶어요.</span>
									<i class="bi bi-check-lg"></i>
									<input type="radio" name="request" value="1" id="lecture">
								</label>
							</div>
							<div class="select-area">
								<label id="request">
									<span>B</span>
									<span>개선 및 기능 요청이 있어요.</span>
									<i class="bi bi-check-lg"></i>
									<input type="radio" name="request" value="2" id="request">
								</label>
							</div>
							<div class="select-area"> 
								<label id="cheer">
									<span>C</span>
									<span>에브리런을 응원해주세요.</span>
									<i class="bi bi-check-lg"></i>
									<input type="radio" name="request" value="3" id="cheer">
								</label>
							</div>
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

		
			
			if($(':radio[name="request"]:checked').length < 1){
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

		$("input[name='request']:radio").change(function () {
        //라디오 버튼 값을 가져온다.
        var requestVal = this.value;

			if(requestVal == '1'){
				$('#lecture').addClass('check');
				$('#cheer').removeClass('check');
				$('#request').removeClass('check');
			} else if(requestVal == '2'){
				$('#request').addClass('check');
				$('#cheer').removeClass('check');
				$('#lecture').removeClass('check');
			} else if(requestVal == '3'){
				$('#cheer').addClass('check');
				$('#request').removeClass('check');
				$('#lecture').removeClass('check');
			}
                  
		});
	</script>
	
</body>
</html>