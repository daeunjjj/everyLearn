<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeHeader</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


<link rel="stylesheet" href="/el/resources/css/notice/notice-header.css">
<link rel="stylesheet" href="/el/resources/css/emp-comm/common.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
</head>
<body>

<header>
	<nav class="navbar bg-light fixed-top">
        <div class="container-fluid">
          

            <div class="navbar-toggler-btn">
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            
            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="a offcanvas-title" id="offcanvasNavbarLabel">everyLearn</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
            
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class=" nav-link active" aria-current="page" href="/el/main">Home 
                                <div id="home"><span class="material-symbols-outlined">home</span></div>
                            </a> 
                        </li>
                        <hr>

                       

                        <li class="nav-item dropdown">
                            <a class="a nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              	  강의
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="a1 dropdown-item" href="#">강의</a></li>
                                <li><a class="a1 dropdown-item" href="#">강의 커뮤니티</a></li>
                                <li>
                                <hr class="dropdown-divider">
                                </li>
                                <li><a class="a1 dropdown-item" href="#">장바구니</a></li>
                            </ul>
                        </li>
                        <br>
                        <li class="nav-item dropdown">
                            <a class="a nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                	채용
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="a1 dropdown-item" href="#">채용</a></li>
                                <li><a class="a1 dropdown-item" href="/el/emp-comm/list">채용 커뮤니티</a></li>
                                <li>
                                <hr class="dropdown-divider">
                                </li>
                                <li><a class="a1 dropdown-item" href="#">내 이력서</a></li>
                            </ul>
                        </li>
                        <br>

                        <li class="nav-item">
                            <a class="a nav-link" href="/el/notice/list">공지사항</a>
                        </li>
                        <br>

                        <li class="nav-item">
                            <a class="a nav-link" href="/el/faq/list">자주 묻는 질문</a>
                        </li>
                        <br>

                        <li class="nav-item">
                            <a class="a nav-link" href="/el/qna/list">1:1 문의</a>
                        </li>
                        <br><br><br><br>
                        <li>좋은 하루 되세요 :)</li>

                      
                    </ul>
                    
                </div>
            </div> 
            
        </div>
        

        <div class="nav-menu-area">
            <div id="nav-img">
                <a class="navbar-brand" href="#"> <img src="/el/resources/img/logo/logo.svg" alt="Logo" width="60" height="60" class="d-inline-block align-text-top" /></a>
            </div>
            <div id="nav-menu">
                <a class="nav-menu" href="">에브리런 고객센터 </a>
                <!-- <a class="nav-menu" href="">공지사항 </a>
                <a class="nav-menu" href="">자주 묻는 질문 </a> -->
            </div>
        </div>

        <div class="nav-info1">
            <a><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
            </svg></a>          
        </div>

        <div class="nav-info2">
            <a><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
            </svg></a>
        </div>

        
      </nav>
      
</header>

<script>
    (function() {
    var link = document.createElement('link');
    link.type = 'image/x-icon';
    link.rel = 'shortcut icon';
    link.href = '/el/resources/img/logo/favicon-16x16.png';
    document.getElementsByTagName('head')[0].appendChild(link);
    }());
</script>

</body>


</html>