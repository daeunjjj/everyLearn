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
        <br><br><br><br><br>
        <div id="contain-write">
            <form action="/action_page.php">
                <select class="form-select" id="sel1" name="sellist1" aria-placeholder="카테고리를 선택해주세요.">
                    <option value="">질문과 답변</option>
                    <option>스터디</option>
                    <option>자유주제</option>
                    <option>블로그</option>
                </select>
                <form action="/action_page.php">
                    <div class="mb-3 mt-3">
                        <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title">
                    </div>
                    <textarea class="form-control" rows="18" id="comment" name="text" placeholder="내용을 입력해주세요."></textarea>
                    <br>
                    <button type="submit" class="btn btn-primary" id="btn-write">등록하기</button>
                </form>
        </div>


    </body>

    </html>