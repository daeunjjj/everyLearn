<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 관리자</title>
<link rel="stylesheet" href="/el/resources/css/admin/login.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<link rel="icon" type="image/png" sizes="16x16" href="/el/resources/img/logo/favicon-16x16.png">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
	<c:if test="${failMsg != null }">
		<script>
            Swal.fire('아이디(이메일) 또는 비밀번호를 확인해주세요.');
		</script>
	</c:if>
	<c:if test="${cookie.saveId.value != null}">
		<script>
            $(function(){
                $('#save').prop('checked', true)
            })
		</script>
	</c:if>
	<div class="container">
        <div class="main">
            <div class="logo-wrap">
                <img src="/el/resources/img/admin/logo2.png" alt="로고" width="320" height="320">
            </div>
            <div class="login-wrap">
                <form action="/el/admin/login" method="post" onsubmit="return loginCheck();">
                    <div class="input-area">
                        <input id="id" type="text" name="id" placeholder="아이디(이메일)를 입력해주세요." value="${cookie.saveId.value }">
                    </div>
                    <div class="input-area">
                        <input id="pwd" type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
                    </div>
                    <div class="flex-wrap">
                        <div class="save-wrap">
                            <input id="save" type="checkbox" name="save">
                            <label for="save">아이디 저장</label>
                        </div>
                        <div id="find-area">
                            <a href="/el/admin/find/id">아이디 찾기</a>
                            <span> | </span>
                            <a href="/el/admin/find/pwd">비밀번호 찾기</a>
                        </div>
                    </div>
                    <div class="btn">
                        <input type="submit" value="관리자 로그인">
                    </div>
                <!--<div class="btn">
                        <button>
                            <span>카카오 로그인</span>
                        </button>
                    </div> -->
                </form>
            </div>
        </div>
    </div>
    <script>
        function loginCheck(){
            let emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            let pwdReg = /^(?=.*[a-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
            let id = $('#id').val();
            let pwd = $('#pwd').val();

            if(!emailReg.test(id) || !pwdReg.test(pwd)){
                $('#pwd').text("");
                Swal.fire('아이디(이메일) 또는 비밀번호를 확인해주세요.');
                return false;
            } else{
                return true;
            }
        }

        // 포커스 효과
        let inputArr = $('input');
        for(let i = 0; i < inputArr.length; i++){
            
            inputArr[i].addEventListener('focus',()=>{
                inputArr[i].style.border="1px solid #005297";
            });
        }

        // 블러효과
        for(let i = 0; i < inputArr.length; i++){

            inputArr[i].addEventListener('blur',()=>{
                inputArr[i].style.border="";
            });
        }
        
    </script>
</body>
</html>