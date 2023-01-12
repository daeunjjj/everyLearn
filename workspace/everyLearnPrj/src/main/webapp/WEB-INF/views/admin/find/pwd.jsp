<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 아이디 찾기</title>
<link rel="stylesheet" href="/el/resources/css/admin/find/id.css">
<link rel="stylesheet" href="/el/resources/css/common/reset.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                    <h1>임시 비밀번호 발급</h1>
                    <p>계정의 등록된 이메일(아이디)를
                        <br>
                        정확히 입력해주세요.
                    </p>

                </div>
                <form>
                    <!-- <section class="phone-area input-area">
                        <div>
                            <label for="phone">휴대폰 번호</label>
                            <div class="input-area">
                                <input type="tel" id="phone" name="phone" placeholder="숫자만 입력해주세요.">
                            </div>
                        </div>
                        <p class="hidden">휴대폰 번호를 입력해주세요.</p>
                    </section> -->
                    <section class="phone-area input-area">
                        <div>
                            <label for="email">아이디(이메일)</label>
                            <div class="input-area">
                                <input type="text" id="email" name="email" placeholder="example@gmail.com">
                            </div>
                        </div>
                        <p id="hidden-box" class="hidden"></p>
                    </section>
                    <!-- <section class="auth-area input-area hidden">
                        <div>
                            <div class="left">
                                <label>인증번호</label>
                                <div class="input-area">
                                    <input type="tel" placeholder="인증번호를 입력">
                                </div>
                            </div>
                            <div class="right">
                                <button>
                                    <span>재발송</span>
                                </button>
                            </div>
                        </div>
                        <p class="hidden">인증번호를 입력해주세요.</p>
                    </section> -->
                    <section class="btn-area">
                        <button type="button" onclick="sendMail();">
                            <span>이메일 발송</span>
                        </button>
                    </section>
                </form>
            </div>
        </div>
    </div>

    <script>
        $('#email').on('focus', function(){
            $('#email').css("border","1px solid #005297");
        });

        $('#email').on('blur', function(){
            $('#email').css("border","");
        });

        function sendMail(){
            const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            const inputEmail = $("#email").val();
            
            // 이메일 형식 & 널체크
            if(inputEmail == "" && !emailReg.test(inputEmail)){
                // 틀리면
                $("#hidden-box").removeClass("hidden");
                $("#hidden-box").text("이메일을 확인해주세요.");
            } else{
                $("#hidden-box").addClass("hidden");
                
                // 비밀번호 디비 다녀오기
                $.ajax({
                    url : "/el/admin/find/pwd",
                    method : "post",
                    data : {"email" : inputEmail},
                    success : function(result){
                        // 결과
                        if(result == ""){
                            // 디비에 이메일 일치하는 거 없음
                            $("#hidden-box").removeClass("hidden");
                            $("#hidden-box").text("일치하는 정보가 없습니다.");
                        } else{
                            // 디비에 정보 있음
                            Swal.fire("발송 완료!", "입력하신 이메일로 임시비밀번호가 발송되었습니다.", "success").then((OK) => {
                                if(OK){
                                    // 메일 전송
                                    $.ajax({
                                        url : "/el/admin/send-email",
                                        method : "post",
                                        data : {"id" : inputEmail},
                                    })
                                    
                                    window.location.href = "/el/admin/login";
                                }
                            });
                        }
                    },
                    error : function(){
                        alert("통신오류");
                    }
                });
            }
        }
    </script>
</body>
</html>