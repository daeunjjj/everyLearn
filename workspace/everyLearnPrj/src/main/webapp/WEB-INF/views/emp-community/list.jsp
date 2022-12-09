<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>commList</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


<link rel="stylesheet" href="/el/resources/css/emp-community/list.css">
<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">

<link rel="stylesheet" href="/el/resources/css/common/header.css">
<link rel="stylesheet" href="/el/resources/css/common/footer.css">



</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main>

	  <div id="container">

        <div id="main">

            <div class="th">NO</div>
            <div class="th"></div>
            <div class="th">TITLE</div>
            <div class="th">NICK</div>
            <div class="th"></div>
            <div class="th"></div>

            <div class="td">1</div>
            <div class="td">취업고민</div>
            <div class="td" id="title">안녕하세요ㅜㅜ</div>
            <div class="td">딩동댕</div>
            <div class="td">22.10.11</div>
            <div class="td">111</div>

            <div class="td">2</div>
            <div class="td">취업고민</div>
            <div class="td">안녕하세요ㅜㅜ</div>
            <div class="td">딩동댕</div>
            <div class="td">22.10.11</div>
            <div class="td">111</div>

            <div class="td">3</div>
            <div class="td">취업고민</div>
            <div class="td">안녕하세요ㅜㅜ</div>
            <div class="td">딩동댕</div>
            <div class="td">22.10.11</div>
            <div class="td">111</div>

            <div class="td">4</div>
            <div class="td">취업고민</div>
            <div class="td">안녕하세요ㅜㅜ</div>
            <div class="td">딩동댕</div>
            <div class="td">22.10.11</div>
            <div class="td">111</div>

            <div class="td">5</div>
            <div class="td">취업고민</div>
            <div class="td">안녕하세요ㅜㅜ</div>
            <div class="td">딩동댕</div>
            <div class="td">22.10.11</div>
            <div class="td">111</div>

            <div class="td">6</div>
            <div class="td">취업고민</div>
            <div class="td">안녕하세요ㅜㅜ</div>
            <div class="td">딩동댕</div>
            <div class="td">22.10.11</div>
            <div class="td">111</div>

            <div class="td">7</div>
            <div class="td">취업고민</div>
            <div class="td">안녕하세요ㅜㅜ</div>
            <div class="td">딩동댕</div>
            <div class="td">22.10.11</div>
            <div class="td">111</div>

            <div class="td">8</div>
            <div class="td">취업고민</div>
            <div class="td">안녕하세요ㅜㅜ</div>
            <div class="td">딩동댕</div>
            <div class="td">22.10.11</div>
            <div class="td">111</div>

            <div class="td">9</div>
            <div class="td">취업고민</div>
            <div class="td">안녕하세요ㅜㅜ</div>
            <div class="td">딩동댕</div>
            <div class="td">22.10.11</div>
            <div class="td">111</div>

            <div class="td">10</div>
            <div class="td">취업고민</div>
            <div class="td">안녕하세요ㅜㅜ</div>
            <div class="td">딩동댕</div>
            <div class="td">22.10.11</div>
            <div class="td">111</div>

            <div id="main-bot">
                <a href="/#/board/write" class="btn btn-light" id="write">작성하기</a>
            </div>

            <div id="page-area" class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
                <div id="page-area2" class="btn-group me-2" role="group" aria-label="First group">
                <a href="/#/board/list?p=1" class="btn btn-outline-secondary"><</a>
                <a href="/#/board/list?p=1" class="btn btn-outline-secondary">1</a>
                <a href="/#/board/list?p=2" class="btn btn-outline-secondary">2</a>
                <a href="/#/board/list?p=3" class="btn btn-outline-secondary">3</a>
                <a href="/#/board/list?p=4" class="btn btn-outline-secondary">4</a>
                <a href="/#/board/list?p=5" class="btn btn-outline-secondary">5</a>
                <a href="/#/board/list?p=1" class="btn btn-outline-secondary">></a>
                </div>
            </div>

            <div id="searchBar">
                <select name="searchBar" id="search">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="keyword" id="search2" placeholder="Search" >
                <button type="submit" class="search-button">
                    <span class="material-symbols-outlined" id="dodbogi">search</span>
                </button>
                
            </div>

        </div>

    </div>
    
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>