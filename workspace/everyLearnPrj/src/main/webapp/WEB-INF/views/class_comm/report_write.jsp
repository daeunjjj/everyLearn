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
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <!-- <script src="/el/resources/js/class_comm/detail.js"></script> -->
    </head>

    <body>
        
        <div id="report-wrap">
          <br><br>
            <div id="report-top"><h1>신고</h1></div>
          <br>
            <div id="blacklist">
              <p style="margin-bottom: 5px;">[신고대상] ${reportMap.blacklist}</p>
            </div>
            <form action="/el/class/report" method="post" onsubmit="completion()">
            <div class="form-check">
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" name="cate_no" value="1" >
                <strong>1. 욕설</strong>
                <label class="form-check-label" for="radio1"></label>
              </div>
            </div>
            <div class="form-check">
            
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" name="cate_no" value="2">
                <strong>2. 광고</strong>
                <label class="form-check-label" for="radio2"></label>
              </div>
            </div>
            <div class="form-check">
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" name="cate_no" value="3" > 
                <strong>3. 음란성</strong>
                <label class="form-check-label" for="radio2"></label>
              </div>
            </div>
            <div class="form-check">
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" name="cate_no" value="4" >
                <strong>4. 불법성</strong>
                <label class="form-check-label" for="radio2"></label>
              </div>
            </div>
          </select>
            <div id="btn-wrap">
              <button id="report-btn" type="submit" >신고하기</button>
            </div>
          </form>

        </div>

    </body>



</html>