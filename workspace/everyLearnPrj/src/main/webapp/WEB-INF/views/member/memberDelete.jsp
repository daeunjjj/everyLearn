<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/el/resources/css/member/memberDelete.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        
        <div id="report-wrap">
          <br><br>
            <div id="report-top"><h1>회원탈퇴</h1></div>
          
            <div id="blacklist">
              <p style="margin-bottom: 5px;">에브리런님 정말 탈퇴하시겠어요..?</p>
              <p style="margin-bottom: 5px;">다양한 강의와 채용서비스 폭넓은 커뮤니티까지</p>
              <p style="margin-bottom: 5px;">에브리런에서 만나볼 수 있어요!</p>
            </div>

            <div id="deletement">* 탈퇴를 원하시면 비밀번호 입력 후 탈퇴하기 버튼을 눌러주세요.</div>
            <div class="form-check">
              <div class="check-wrap">
                <input id="password" type="password">
              </div>
            </div>

            <div id="btn-wrap">
              <button class="report-btn">회원유지하기</button>
            </div>
            <div id="btn-wrap">
              <button class="report-btn" id="deletebtn">탈퇴하기</button>
            </div>
            

        </div>

    </body>



</html>