<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqList</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />



<link rel="stylesheet" href="/el/resources/css/faq/list.css">
<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
</head>
<body>

<main>
<%@ include file="/WEB-INF/views/notice/notice-header.jsp" %>
    <div class="banner">
        <div id="banner-text"><span>✨에브리런의 궁금한 점을 검색해 주세요!✨</span></div>
        <div id="banner-input">
            <form action="" method="post">
                <input id="searchBar" type="text" name="search" placeholder="Search..">
                <button type="submit" class="search-button">
                    <span class="material-symbols-outlined" id="dodbogi">search</span>
                </button>
            </form>
        </div>
    </div>

    <div class="container">

        <div class="a1">
            <div id="h1">개인 회원 FAQ</div>
            <br>
            <button class="accordion">구매했던 강의가 전부 사라졌습니다.</button>
            <div class="panel">
                <br>
                <p>어쩔 수 없죵,,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">비밀번호를 바꾸고 싶습니다.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">에브리런 서비스 중 오류가 발생해요.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">에브리런 서비스 중 오류가 발생해요.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">에브리런 서비스 중 오류가 발생해요.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

        </div>
        <div id="hr"></div>
        <div class="a2">
            <div id="h1">기업 회원 FAQ</div>
            <br>

            <button class="accordion">기업 서비스 가입, 이용 절차가 궁금합니다.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">등록된 기업 회사 정보는 어디에 노출되나요?</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">에브리런 서비스 중 오류가 발생해요.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">에브리런 서비스 중 오류가 발생해요.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">에브리런 서비스 중 오류가 발생해요.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">기업 서비스 가입, 이용 절차가 궁금합니다.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">기업 서비스 가입, 이용 절차가 궁금합니다.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

            <button class="accordion">기업 서비스 가입, 이용 절차가 궁금합니다.</button>
            <div class="panel">
                <br>
                <p>,Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <br>
            </div>

        </div>

    </div>

</main>

<script>


var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>

</body>
</html>