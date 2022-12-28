function memberDelete() {
    window.open(
        "http://127.0.0.1:8888/el/member/delete",
        "modify",
        "width=500px, height=500px, top=100, left=100"
    );
}


function previewImage(targetObj, View_area) {
    var preview = document.getElementById(View_area); //div id
    var ua = window.navigator.userAgent;

    //ie일때(IE8 이하에서만 작동)
    if (ua.indexOf("MSIE") > -1) {
        targetObj.select();
        try {
            var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
            var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }

            var img = document.getElementById(View_area); //이미지가 뿌려질 곳

            //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "', sizingMethod='scale')";
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + View_area)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + View_area;
                info.innerHTML = e.name;
                preview.insertBefore(info, null);
            }
        }
        //ie가 아닐때(크롬, 사파리, FF)
    } else {
        var files = targetObj.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
                continue;
            var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }
            var img = document.createElement("img");
            img.id = "prev_" + View_area;
            img.classList.add("obj");
            img.file = file;
            img.style.width = '150px';
            img.style.height = '150px';
            preview.appendChild(img);
            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function (aImg) {
                    return function (e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                    + View_area)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + View_area;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}

function noModi() {
    alert('아이디는 변경할 수 없습니다.');
}


// 비밀번호 유효성
function checkPw() {
    let pw = $("#memberPwd1").val();
    let number = pw.search(/[0-9]/g);
    let english = pw.search(/[a-z]/ig);
    let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

    if(pw.length == 0){
        $('#pwdch').html("* 필수입력 사항입니다.");
        return false;
    }else if (pw.length < 8 || pw.length > 20) {
        $('#pwdch').html("* 8자리 ~ 20자리 이내로 입력해주세요.");
        return false;

    } else if (pw.search(/\s/) != -1) {
        $('#pwdch').html("* 비밀번호는 공백 없이 입력해주세요.");
        return false;

    } else if (number < 0 || english < 0 || spece < 0) {
        $('#pwdch').html("* 영문,숫자,특수문자를 혼합하여 입력해주세요.");
        return false;

    } 
    // else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
    //     $('#pwdch').html("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.")
    //     return false;

    // } 
    else {
        $('#pwdch').html("비밀번호가 정상적으로 입력되었습니다.");
        return true;
    }


}

//비밀번호 재확인
function pwdDup() {
    let pwd = $('#memberPwd1').val();
    let pwd2 = $('#memberPwd2').val();

    if(pwd == pwd2 && pwd != ''){
        $('#pwdDup').html("* 비밀번호가 일치합니다.").css("color","green");
        let pwdDup = true;
        return true;
    }else if(pwd2 == ''){
        $('#pwdDup').html("").css("color","green");

    }
    else{
        $('#pwdDup').html("* 비밀번호가 일치하지 않습니다. 다시 입력해주세요.").css("color","red");
        $('#memberPwd2').val("");
        return false;
    }

}

//닉네임 중복확인
function nickDup() {
    let memberNick = $('#memberNick').val();
    
    $.ajax({
        url : "/el/member/nickDup"
        , type : "post"
        , data : {"memberNick" : memberNick}
        , success : function (result) {
            if(result == '1'){
                $('#nickDup').html("중복된 닉네임입니다.").css("color", "red");
                return false;
            }else{
                $('#nickDup').html("사용가능한 닉네임입니다.").css("color", "green");
                return true;

            }
        }
        , error : function name(params) {
            alert("아 작 스 실 패")
        }
    });

}


//휴대폰 번호 - 붙이기
function chk_tel(str, id) {
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';

    if (str.substring(0, 2) == "02") {
        if (str.length < 3) {
            $("#"+id).val(str);
        } else if (str.length < 6) {
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2);
            $("#"+id).val(tmp);
        } else if (str.length < 10) {
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2, 3);
            tmp += '-';
            tmp += str.substr(5);
            $("#"+id).val(tmp);
        } else {
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2, 4);
            tmp += '-';
            tmp += str.substr(6, 4);
            $("#"+id).val(tmp);
        }
    } else {
        if (str.length < 4) {
            $("#"+id).val(str);
        } else if (str.length < 7) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            $("#"+id).val(tmp);
        } else if (str.length < 11) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            $("#"+id).val(tmp);
        } else {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            $("#"+id).val(tmp);
        }
    }
}

function modifySubmit() {
    return true;
}