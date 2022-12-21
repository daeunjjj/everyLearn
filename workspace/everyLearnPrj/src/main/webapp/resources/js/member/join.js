//아이디 중복
function idDup() {

        let memberId = $('#memberId').val();

		$.ajax({
			url : "/el/member/idDup",	
			type : "post",
            data : {"memberId" : memberId}
			,
			success : function(result){
				if(result == '1') {
					$("#idDup").html("중복된 ID입니다. ").css("color", "red");
                    return false;
				}	
                else {
					$("#idDup").html("사용가능한 ID입니다. ").css("color", "green");
                    return true;
				}			
			},
			error : function(){
				alert("아 작 스 실 패") 
			}
		});
	}

//아이디 비어있는지 여부
function emptyId() {
    let emptyId = $('#memberId').val();

    if(emptyId == ''){
        $("#idDup").html("필수입력사항입니다.").css("color", "red");
        return false;
    }
}

//패스워드 비어있는지 여부
function emptyPwd() {
    let emptyPwd = $('#memberPwd').val();

    if(emptyPwd == ''){
        $("#pwdch").html("비번 필수입력사항입니다.").css("color", "red");
        return false;
    }
}

function emptyName() {
    let emptyName = $('#memberNick').val();

    if(emptyName == ''){
        $('#Namech').html("필수입력사항입니다.").css("color", "red");
        return false;
    }
}

// 비밀번호 유효성
function checkPw() {
    let pw = $("#memberPwd").val();
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
    let pwd = $('#memberPwd').val();
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

//이메일 유효성
function emailCh(){
    var email = $('#email').val();
    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

        if(exptext.test(email)==false){

        //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
        $('#emailCheck').html("이메일형식이 올바르지 않습니다.");
        return false;
    }else{
        $('#emailCheck').html("");
        return true;
        }
    
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

function jin() {

    alert("회원가입이 완료되었습니다.");

    return true;

}