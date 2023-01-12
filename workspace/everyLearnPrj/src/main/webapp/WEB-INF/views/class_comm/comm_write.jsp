<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>커뮤니티 게시글 등록</title>
        <link rel="stylesheet" href="/el/resources/css/class_comm/comm_write.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="sweetalert2.min.js"></script>
        <link rel="stylesheet" href="sweetalert2.min.css">
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

            <main id="container">
            <br><br><br><br>
        <div id="contain-write">
            <form method="post" action="/el/class/write" onsubmit="return enroll();">
            	<input type="hidden" value="${loginMember.memberNo}" name="writer" >
                <select class="form-select" id="sel1" name="cateNo" aria-placeholder="카테고리를 선택해주세요.">
                    <option value= "1">질문과 답변</option>
                    <option value= "2">스터디</option>
                    <option value= "3">자유주제</option>
                    <option value= "4">블로그</option>
                </select>
                    <div class="mb-3 mt-3">
                        <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title">
                    </div>
                    <textarea class="form-control" rows="18" id="comment" name="content" placeholder="내용을 입력해주세요."></textarea>
                    <br>
                    <button type="submit" class="btn btn-primary" id="btn-write">등록하기</button>
               </form>
               <input type="hidden" id="memberNo" value="${loginMember.memberNo}">
             
        </div>

				<script type="text/javascript">
                    function enroll() {
                        
                        let memberNo = $('#memberNo').var();
                        console.log(memberNo);
                        if(memberNo == null){
                            Swal.fire(
                            'The Internet?',
                            'That thing is still around?',
                            'question'
                            )
                            return false;
                        }


						return true;
					}
				</script>

    </main>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>



</html>