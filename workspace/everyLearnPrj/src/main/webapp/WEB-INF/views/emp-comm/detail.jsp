<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    
<link rel="stylesheet" href="/el/resources/css/emp-community/detail.css">
<link rel="stylesheet" href="/el/resources/css/emp-community/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	
 	<main>
        <div class="container">
            <div class="detailBar">
                <div id="category">취업 / 이직</div>
                <div id="btn">
                    <button class="btn btn-outline-secondary me-md-2" type="button">목록</button>
                    <button class="btn btn-outline-secondary me-md-2" type="button">수정</button>
                    <button class="btn btn-outline-secondary me-md-2" type="button">삭제</button>
                </div>
            </div>
            <div class="title"><span id="title">제목입니다</span></div>
            <div class="info"><span id="nick">취준생   |   22.11.29    |   11</span></div>
            <div class="content">
		                어쩌구 저쩌구 내용 쓰는 칸
		        <br>
		                어쩌구 저쩌구 내용 쓰는 칸
		        <br>
		                어쩌구 저쩌구 내용 쓰는 칸
            </div>
            <div class="etc">
                <div>
                    <button type="button" id="more"><span class="material-symbols-outlined" id="favorite">favorite</span></button>
                    <span id="number">0</span>
                </div>

                <div>
                    <button type="button" id="more"><span class="material-symbols-outlined" id="more">more_horiz</span></button>
                </div>
            </div>

            <div class="comment-area">
                    &nbsp<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
                        <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                    </svg>
                    <span>&nbsp&nbsp0 </span>     
            </div>
            
            <div class="comment">

                <div class="profile">
                    <div id="info">
                        <div id="photo"></div>
                        <div id="info2"><span id="nick">삥뽕</span> <span id="enroll-date">22.11.30 15:30</span></div>
                        <div id="ed">
                            <a href="" id="edit">수정</a>
                            <a href="" id="delete">삭제</a>
                        </div>
                    </div>
                    <div id="btn1">
                        <button type="button" id="more"><span class="material-symbols-outlined" id="more">more_horiz</span></button>
                    </div>
                </div>

                <div class="comment-content">
                   	어쩌구 저쩌구 댓글 내용입니다.
                   	<br>
                   	어쩌구 저쩌구 댓글 내용입니다.
                   	<br>
                   	어쩌구 저쩌구 댓글 내용입니다.
                   	<br>
                  	어쩌구 저쩌구 댓글 내용입니다.
                </div>

                <div class="profile">
                    <div id="info">
                        <div id="photo"></div>
                        <div id="info2"><span id="nick">삥뽕</span> <span id="enroll-date">22.11.30 15:30</span></div>
                        <div id="ed">
                            <a href="" id="edit">수정</a>
                            <a href="" id="delete">삭제</a>
                        </div>
                    </div>
                    <div id="btn1">
                        <button type="button" id="more"><span class="material-symbols-outlined" id="more">more_horiz</span></button>
                    </div>
                </div>

                <div class="comment-content">
                    어쩌구 저쩌구 댓글 내용입니다.
                    <br>
                    어쩌구 저쩌구 댓글 내용입니다.
                    <br>
                    어쩌구 저쩌구 댓글 내용입니다.
                    <br>
                    어쩌구 저쩌구 댓글 내용입니다.
                </div>

                <div class="profile">
                    <div id="info">
                        <div id="photo"></div>
                        <div id="info2"><span id="nick">삥뽕</span> <span id="enroll-date">22.11.30 15:30</span></div>
                        <div id="ed">
                            <a href="" id="edit">수정</a>
                            <a href="" id="delete">삭제</a>
                        </div>
                    </div>
                    <div id="btn1">
                        <button type="button" id="more"><span class="material-symbols-outlined" id="more">more_horiz</span></button>
                    </div>
                </div>

                <div class="comment-content">
                    어쩌구 저쩌구 댓글 내용입니다.
                    <br>
                    어쩌구 저쩌구 댓글 내용입니다.
                    <br>
                    어쩌구 저쩌구 댓글 내용입니다.
                    <br>
                    어쩌구 저쩌구 댓글 내용입니다.
                </div>

                <div class="my-comment-area">
                    <div id="info">
                        <div id="photo"></div>
                        <div id="info2"><span id="nick">삥뽕</span></div>
                    </div>
                    <div id="my-comment-div">
                        <form action="" method="post">
                            <textarea id="my-comment2" placeholder="댓글을 입력해 주세요."></textarea>
                            <button type="submit" class="btn btn-success" id="submit-btn">등록</button>
                        </form>
                    </div>
                </div>

            </div>

        </div>

        <nav class="navbar sticky-bottom bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#"><span class="material-symbols-outlined">arrow_upward</span></a>      
            </div>
        </nav>
    </main>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>