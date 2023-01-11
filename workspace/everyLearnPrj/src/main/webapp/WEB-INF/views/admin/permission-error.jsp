<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
</head>
<script>
    (function() {
    var link = document.createElement('link');
    link.type = 'image/x-icon';
    link.rel = 'shortcut icon';
    link.href = '/el/resources/img/logo/favicon-16x16.png';
    document.getElementsByTagName('head')[0].appendChild(link);
    }());
</script>
<body>
    <section style="
    height: 100%;
    display: flex;
    position: relative;
    justify-content: center;
  ">
    
    <div style="
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      position: absolute;
      margin-top: 90px;
    ">
    <div class="logo-wrap">
        <img src="/el/resources/img/admin/logo2.png" alt="로고" width="320" height="320">
    </div>
      <h1 style="
        margin: 0 0 32px !important;
        text-align: center;
        line-height: 1.5;
        font-size: 32px;
        font-weight: 500;
      ">
        EveryLearn Platform
        <br>
        Management Center
       
      </h1>
      <!-- <span style="
      color: #FF0000;
      margin-bottom: 20px;
      ">
        접근 권한이 없습니다.
    </span> -->
      <button style="background: #1187CF; color: rgb(255, 255, 255); border-radius: 4px; padding: 10px; font-size: 15px; border: 0px; width: 350px; margin-bottom: 20px; cursor: pointer;" onclick="window.location.href='/el/admin/login'" onmouseover="this.style.filter='brightness(0.95)';" onmouseout="this.style.filter='';">
        로그인
      </button>
      
    </div>
  </section>
</body>
</html>