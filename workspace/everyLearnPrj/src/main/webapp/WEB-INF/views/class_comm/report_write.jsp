<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>신고</title>
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
              <img src="/el/resources/img/class-comm/warning2.png" alt="">
              <p style="height: 45px; width: 280px; "> ${reportMap.blacklist}</p>
              
            </div>
            <form action="/el/class/report" method="post" onsubmit="completion();">
              <input type="hidden" name="blacklistNo" id="blacklistNo" value="${vo.blacklistNo}">
              <input type="hidden" name="accusor" id="accusor" value="${vo.accusor}">

              
              <!-- <input type="hidden" name="cate_no" id="cate_no" value="1"> -->
              <input type="hidden" name="board" id="board" value="${vo.board}">
            <div class="form-check">
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" name="type" value="1" >
                <strong>1. 욕설</strong>
                <label class="form-check-label" for="radio1"></label>
              </div>
            </div>
            <div class="form-check">
            
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" name="type" value="2">
                <strong>2. 광고</strong>
                <label class="form-check-label" for="radio2"></label>
              </div>
            </div>
            <div class="form-check">
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" name="type" value="3" > 
                <strong>3. 음란성</strong>
                <label class="form-check-label" for="radio2"></label>
              </div>
            </div>
            <div class="form-check">
              <div class="check-wrap">
                <input style="margin-left: -10px; margin-right: 10px;" type="radio" class="form-check-input" name="type" value="4" >
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