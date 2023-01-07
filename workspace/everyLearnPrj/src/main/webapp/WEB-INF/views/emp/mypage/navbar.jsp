<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/el/resources/css/emp/mypage/navbar.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="stylesheet" href="/el/resources/css/common/font.css">
<script>
  (function() {
  var link = document.createElement('link');
  link.type = 'image/x-icon';
  link.rel = 'shortcut icon';
  link.href = '/el/resources/img/logo/favicon-16x16.png';
  document.getElementsByTagName('head')[0].appendChild(link);
  }());
</script>
</head>
<body>

	<div class="container">
    <div class="nav-wrapper">
      <nav class="nav">
        <header class="header">
          <a href="/el/emp/main" class="logo"><img src="/el/resources/img/logo/logo_white.png"
            alt=""></a> <a href="/el/corp/register-position" class="create">
            
            <c:choose>
				<c:when test="${corpMember.statusYn eq 'Y' }">
					<button class="create-btn">+ 새 채용 공고 만들기</button>
				</c:when>
				<c:otherwise>
					<button class="create-btn" disabled>+ 새 채용 공고 만들기</button>
				</c:otherwise>
			</c:choose>
            
          </a>
        </header>
        <div class="menu">
          <div class="menu-wrapper">
            <div class="nav-list-title">
              <h3>마이페이지</h3>
            </div>
            <div class="nav-list-wrapper">
              <div class="nav-list">
                <div class="corp-info-menu">
                  <div>
                    <a href="/el/corp/mypage" class="icon"><img src="/el/resources/img/emp/company.svg" alt=""> 회사 정보 관리</a>
                  </div>
                </div>
                <div class="employment-wrapper">
                  <div class="nav-list-title">
                    <h5>채용관리</h5>
                  </div>
                  <div class="employment">
                    <div class="sort">
                        <div id="total" class="total">
                          <a class="icon" href="/el/corp/total"><img src="/el/resources/img/emp/right-arrow.svg">전체</a>
                        </div>
                        <div id="hiring" class="hiring">
                          <a class="icon" href="/el/corp/hiring"><img src="/el/resources/img/emp/right-arrow.svg">채용중</a>
                        </div>
                        <div id="deadLine" class="deadLine">
                          <a class="icon" href="/el/corp/deadline"><img src="/el/resources/img/emp/right-arrow.svg">채용 마감</a>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div>
            <div class="logout">
              <div class="logout-icon"><svg width="20" height="20" fill="none" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M1.875 2.708c0-.805.688-1.458 1.537-1.458h4.831c.364 0 .659.28.659.625s-.295.625-.659.625h-4.83a.214.214 0 0 0-.22.208v14.584c0 .115.098.208.22.208h4.83c.364 0 .659.28.659.625s-.295.625-.659.625h-4.83c-.85 0-1.538-.653-1.538-1.458V2.708z" fill="#535961"></path><path d="m15.935 10.625-2.9 2.903a.603.603 0 0 0 .025.884.684.684 0 0 0 .932-.024l3.953-3.958a.602.602 0 0 0 0-.86l-3.953-3.958a.684.684 0 0 0-.932-.024.603.603 0 0 0-.025.884l2.9 2.903H8.682c-.363 0-.658.28-.658.625s.295.625.658.625h7.253z" fill="#535961"></path></svg></div>
              <a href="/el/corp/logout">로그아웃</a>
            </div>
          </div>
        </div>
      </nav>
    </div>

	</div>

</body>
</html>