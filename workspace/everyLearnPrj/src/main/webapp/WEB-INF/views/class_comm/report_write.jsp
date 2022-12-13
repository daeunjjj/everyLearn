<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/class_comm/report_write.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        
        <div id="report-wrap">
          <br><br>
            <div id="report-top"><h1>신고</h1></div>
          <br>
            <div id="blacklist">
              <p style="margin-bottom: 5px;">[작성자] 투자가답이다</p>
              <p style="margin-bottom: 5px;">[글제목] 코딩 잘하려면..</p>
            </div>

            <div class="form-check">
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>
                <strong>1. 욕설</strong>
                <label class="form-check-label" for="radio1"></label>
              </div>
            </div>
            <div class="form-check">
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">
                <strong>2. 광고</strong>
                <label class="form-check-label" for="radio2"></label>
              </div>
            </div>
            <div class="form-check">
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">
                <strong>3. 음란성</strong>
                <label class="form-check-label" for="radio2"></label>
              </div>
            </div>
            <div class="form-check">
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">
                <strong>4. 불법성</strong>
                <label class="form-check-label" for="radio2"></label>
              </div>
            </div>
            <div id="btn-wrap">
              <button id="report-btn">신고하기</button>
            </div>
            

        </div>

    </body>



</html>