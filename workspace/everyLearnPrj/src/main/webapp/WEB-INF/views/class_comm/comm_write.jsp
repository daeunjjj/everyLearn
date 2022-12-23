<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/class_comm/comm_write.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

            <main id="container">
            <br><br><br><br>
        <div id="contain-write">
            <form method="post" action="/el/class/write" onsubmit="enroll()">
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
        </div>

				<script type="text/javascript">
					function enroll() {
						return true;
					}
				</script>

    </main>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>



</html>