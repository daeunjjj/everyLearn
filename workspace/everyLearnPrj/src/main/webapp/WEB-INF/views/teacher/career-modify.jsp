<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/teacher/career-modify.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        
        <div id="report-wrap">
          <br><br>
            <div id="report-top"><h1>자기소개 / 경력 수정</h1></div>
          
            <div id="ment">
              <p style="margin-bottom: 5px;">한 줄 자기소개와 경력사항을 수정할 수 있어요!</p>
              <p style="margin-bottom: 5px; font-size: small;">* 허위 경력 기재 시, 불이익이 발생할 수 있습니다.</p>
            </div>

            <form>
              <div class="container mt-3">
                <textarea class="form-control" rows="3" id="introModify" name="introModify"></textarea>
              </div>

              <div class="container mt-3">

                  <div class="mb-3 mt-3">
                    <textarea class="form-control" rows="10" id="careerModify" name="careerModify"></textarea>
                  </div>
                  <div id="f">
                    <button id="modifybtn" type="submit" class="btn btn-primary">수정하기</button>
                  </div>
                </div>
            </form>

            

        </div>

    </body>



</html>