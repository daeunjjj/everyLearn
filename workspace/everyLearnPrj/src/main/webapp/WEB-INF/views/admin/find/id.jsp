<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="/el/resources/css/admin/find/id.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
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
        <div class="main">
            <div class="logo-wrap">
                <img src="/el/resources/img/admin/logo2.png" alt="로고" width="100%" height="100%">
            </div>
            <div class="find-wrap">
                <div class="title">
                    <h1>아이디(이메일) 찾기</h1>
                    <p>계정에 등록된 휴대폰 번호를 입력하시면
                        <br>
                        계정의 이메일 주소를 알려드립니다.
                    </p>
                </div>
                <form action="/el/admin/find/result/id" method="post">
                    <section class="auth-area input-area">
                        <div>
                            <div class="left">
                                <label>휴대폰 번호</label>
                                <div class="input-area">
                                    <input id="phone" name="phone" type="tel" placeholder="휴대폰 번호를 입력" oninput="autoHyphen(this)" maxlength="13" >
                                </div>
                            </div>
                            <div class="right">
                                <button type="button" onclick="authRequest();">
                                    <span id="auth-span">인증요청</span>
                                </button>
                            </div>
                        </div>
                        <p id="phoneMsg" class="hidden">휴대폰 번호를 입력해주세요.</p>
                    </section>
                    <section id="auth-number" class="auth-area input-area hidden">
                        <div>
                            <div class="left">
                                <label>인증번호</label>
                                <div class="input-area">
                                    <input id="auth-num" type="tel" placeholder="인증번호를 입력">
                                </div>
                            </div>
                            <div class="right" id="auth-check">
                                <button id="auth-btn" type="submit" disabled>
                                    <span>인증</span>
                                </button>
                            </div>
                        </div>
                        <p id="numMsg" class="hidden">인증번호를 입력해주세요.</p>
                    </section>
                    <!-- <section class="btn-area">
                        <button id="findBtn" type="button" disabled="true" class="non-click">
                            <span>아이디 찾기</span>
                        </button>
                    </section> -->
                </form>
            </div>
        </div>
    </div>
    <script>
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
        
        // 휴대폰 하이픈 추가
        const autoHyphen = (target) => {
            target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
            .replace(/(\-{1,2})$/g, "");
        };


        function authRequest(){
            let phone = $('#phone').val();
            const phoneReg = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;
            
            console.log(phone);
            if(!phoneReg.test(phone)){
                $('#phoneMsg').removeClass('hidden');
            }else if(phone == ''){
                $('#phoneMsg').removeClass('hidden');
            } else{
                $('#phoneMsg').removeClass('hidden');
                $('#phoneMsg').css("color", "blue");
                $('#auth-span').text('재발송');
                $('#phoneMsg').text('인증번호가 발송되었습니다.');
                $('#auth-number').removeClass('hidden');


                $.ajax({
                    url : "/el/admin/send",
                    type : "post",
                    data : {"phoneNumber": phone},
                    success : function(result){
                        console.log(result);
                        
                        $('#auth-check').click(function(){
                            let inputNum = $('#auth-num').val();
                            if(result != inputNum){
                                $('#numMsg').removeClass('hidden');
                                $('#numMsg').text('인증번호를 다시 확인해주세요.');
                            } else if(result == inputNum){
                                $('#auth-btn').removeAttr('disabled');
                            }
                        })
                            

                    },
                    error : function() {
                        alert("실패");
                    }
                });
            }
        }

    </script>
</body>
</html>