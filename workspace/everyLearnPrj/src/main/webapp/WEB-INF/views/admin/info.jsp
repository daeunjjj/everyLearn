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
                <form action="/el/admin/info/modify" method="post" enctype="multipart/form-data" onsubmit="return checkBtn();">
                    <div class="info-wrap">
                        <div class="info-items">
                            <div class="title-wrap" id="profile-wrap">
                                <label for="profile">프로필</label>
                            </div>
                            <div class="input-wrap">
                            	<c:if test="${loginAdmin.profileName != null}">
	                                <img id="profile-img" src="/el/resources/upload/${loginAdmin.profileName}" alt="관리자사진" width="150px" height="200px">                        	
                            	</c:if>
                            </div>
                            <div id="input-file">
                                <button type="button" onclick="deleteProfile();">삭제</button>
                                <input type="file" id="profile" name="profile">
                                <input type="text" name="check" id="check" hidden>
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
                                <input id="nick" type="text" name="nick" value="${loginAdmin.nick }">
                            </div>
                            <span id="nickMsg" hidden>필수항목입니다.</span>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="id">아이디</label>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="id" name="id" value="${loginAdmin.id }" readonly>
                            </div>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="pwd">비밀번호</label>
                            </div>
                            <div class="input-wrap">
                                <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <span id="pwdMsg" hidden></span>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="checkPwd">비밀번호 확인</label>
                            </div>
                            <div class="input-wrap">
                                <input type="password" id="checkPwd" name="checkPwd" placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <span id="checkPwdMsg" hidden></span>
                        </div>
                        <div class="info-items">
                            <div class="title-wrap">
                                <label for="phone">전화번호</label>
                            </div>
                            <div class="input-wrap">
                                <input class="input" id="phone" type="text" name="phone" placeholder="번호만 입력해주세요." value="${loginAdmin.phone}" oninput="autoHyphen(this)" maxlength="13" >
                            </div>
                            <span id="phoneMsg" hidden>필수 정보입니다.</span>
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
                        <button type="submit">수정</button>
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

        // 프로필 사진 삭제
        function deleteProfile() {
            $('#profile-img').attr("src","/el/resources/img/admin/default-profile.png");
            $('#profile').val('');
            $('#check').val('null');
        }

        // 유효성체크
        const loginNick = $('#nick').val();

        //닉네임 체크
        let nickCheck = true;
        $('#nick').on('keyup', function(){
            let nick = $('#nick').val();
            console.log(nick);
            if(nick == ""){
                $('#nickMsg').addClass('not-available');
                $('#nickMsg').text('필수항목입니다.');
                nickCheck = false;
            } else if(nick.length == 1){
                $('#nickMsg').addClass('not-available');
                $('#nickMsg').text('닉네임은 2자 이상입니다.');
                nickCheck = false;
            } else{
                $('#nickMsg').removeClass('not-available');
                nickCheck = true;
            }

        })

        $('#nick').on('blur', function(){
            let nick = $('#nick').val();

            if(nick == ""){
                $('#nickMsg').addClass('not-available');
                $('#nickMsg').text('필수항목입니다.');
                nickCheck = false;
            } else if(nick.length == 1){
                $('#nickMsg').addClass('not-available');
                $('#nickMsg').text('닉네임은 2자 이상입니다.');
                nickCheck = false;
            } else if(nick == loginNick){
                $('#nickMsg').removeClass('not-available');   
                nickCheck = true;
            } else{
                // 중복체크 (에이잭스)
                $.ajax({
                    url : "/el/admin/dup-check",
                    method : "POST",
                    data : {"nick" : nick},
                    success : function(result){
                        if(result == ""){
                            // 중복
                            $('#nickMsg').addClass('not-available');
                            $('#nickMsg').text('중복된 닉네임입니다.');
                        } else{
                            // 사용가능
                            $('#nickMsg').addClass('available');
                            $('#nickMsg').text('사용가능합니다.');
                            nickCheck = true;
                        }

                    },
                    error : function(){
                        alert('통신실패');
                    }
                })
            }

        })

        // 휴대폰 하이픈 추가
        const autoHyphen = (target) => {
            target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
            .replace(/(\-{1,2})$/g, "");
        };

        // 휴대폰 체크
        let phoneCheck = true;
        $('#phone').on('keyup', function(){
            let phone = $('#phone').val();
            const phoneReg = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;
            
            if(!phoneReg.test(phone)){
                $('#phoneMsg').addClass('not-available');
                $('#phoneMsg').text('번호를 확인해주세요.');
                phoneCheck = false;
            } else if(phone == ""){
                $('#phoneMsg').addClass('not-available');
                $('#phoneMsg').text('필수항목입니다.');
                phoneCheck = false;
            } else{
                $('#phoneMsg').removeClass('not-available');
                phoneCheck = true;
            }
        })

        // 비밀번호
        let pwd1Check = true;
        $('#pwd').keyup(function(){
            const pwdReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
            const pwd = $('#pwd').val();


            if(!pwdReg.test(pwd)){
                $('#pwdMsg').addClass('not-available');
                $('#pwdMsg').text('영문 숫자 특수문자 조합의 8자 이상');
                pwd1Check = false;

            } else{
                $('#pwdMsg').removeClass('not-available');
                pwd1Check = true;
            }

        });

        $('#pwd').blur(function(){
            const pwd = $('#pwd').val();

            if(pwd.length == 0){
                $('#pwdMsg').removeClass('not-available');
                pwd1Check = true;
            }
        });

        // 비밀번호 확인
        let pwd2Check = true;
        $('#checkPwd').keyup(function(){
            const pwd = $('#pwd').val();
            const checkPwd = $('#checkPwd').val();
        
            if(pwd != checkPwd){
                $('#checkPwdMsg').addClass('not-available');
                $('#checkPwdMsg').text('동일한 비밀번호를 입력해주세요.');
                pwd2Check = false;
            } else{
                $('#checkPwdMsg').removeClass('not-available');
                pwd2Check = true;
            }
        });

        function checkBtn() {
            if(!nickCheck){
                Swal.fire({
                    icon: 'error',
                    title: '닉네임을 확인해주세요.',
                    confirmButtonColor: '#1187CF'
                })
                return false;
            }

            if(!pwd1Check){
                Swal.fire({
                    icon: 'error',
                    title: '비밀번호 확인해주세요.',
                    confirmButtonColor: '#1187CF'
                })
                return false;
            }

            if(!pwd2Check){
                Swal.fire({
                    icon: 'error',
                    title: '비밀번호가 일치하지않습니다.',
                    confirmButtonColor: '#1187CF'
                })
                return false;
            }

            if(!phoneCheck){
                Swal.fire({
                    icon: 'error',
                    title: '휴대폰 번호를 확인해주세요.',
                    confirmButtonColor: '#1187CF'
                })
                return false;
            }
            
            confirm('입력하신 정보로 등록하시겠습니까?')

            return true;
        }
    </script>
</body>
</html>