<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 강사회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/info.css">

</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>내 정보</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <form action="/el/admin/info/modify" method="post" enctype="multipart/form-data">
                    <div class="info-wrap">
                        <div class="info-items">
                            <div class="title-wrap" id="profile-wrap">
                                <label for="profile">프로필</label>
                            </div>
                            <div class="input-wrap">
                                <img id="profile-img" src="/el/resources/img/admin/default-profile.png" alt="관리자사진" width="150px" height="200px">
                            </div>
                            <div id="input-file">
                                <button>삭제</button>
                                <input type="file" id="profile" name="profile">
                            </div>

                        </div>
                         <div class="info-items">
                            <div class="title-wrap">
                                <label for="name">이름</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="name" value="${loginAdmin.name}" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="nick">닉네임</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="nick" value="${loginAdmin.nick }">
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="id">아이디</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="id" value="${loginAdmin.id }" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="password">비밀번호</label>
                            </div>
                            <div class="input-wrap">
                                <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <span>비밀번호 형식을 맞춰주세요.</span>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="password">비밀번호 확인</label>
                            </div>
                            <div class="input-wrap">
                                <input type="password" name="checkPwd" placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <span>비밀번호가 일치하지 않습니다.</span>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="phone">전화번호</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="phone" placeholder="번호만 입력해주세요." value="${loginAdmin.phone }">
                            </div>
                            <span>필수 정보입니다.</span>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="position">직급</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" value="${loginAdmin.position }" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="permission">권한</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" value="${loginAdmin.permission }" readonly>
                            </div>
                        </div>

                    </div>
                    <div class="btn-area">
                        <button>수정</button>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script>
        // 프로필 이미지 프리뷰 띄어주기
        $('#profile').on("change", function(event){
            let file = event.target.files[0];

            let reader = new FileReader(); 
            reader.onload = function(e) {

                $("#profile-img").attr("src", e.target.result);
            }

            reader.readAsDataURL(file);
        });
        
        // 이미지 파일 맞는지 확인
        function isImageFile(file) {
            let ext = file.name.split(".").pop().toLowerCase(); // 파일명 확장자 명 가져오기

            return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
        }

        // 파일의 최대 사이즈 확인
        function isOverSize(file) {

        var maxSize = 3 * 1024 * 1024; // 3MB로 제한 

        return (file.size > maxSize) ? true : false;
        }
    </script>
</body>
</html>