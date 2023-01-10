// 포커스 효과
let arr = $('.input-wrap');
let inputArr = $('.input');
for(let i = 0; i < arr.length; i++){

    inputArr[i].addEventListener('focus',()=>{
        arr[i].style.border="1px solid #005297";
    });
}

// 블러효과
for(let i = 0; i < arr.length; i++){

    inputArr[i].addEventListener('blur',()=>{
        arr[i].style.border="";
    });
}

// 아이디 체크
let idCheck = false;

$('#id').on("keyup", function(){
    
    const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    let id = $('#id').val();


    if(id == ""){
        $('#idMsg').addClass('not-available');
        $('#idMsg').text('필수항목입니다.');
    } else if(!emailReg.test(id)){
        $('#idMsg').addClass('not-available');
        $('#idMsg').text('아이디는 이메일 형식입니다.');
    } else {
        $('#idMsg').removeClass('not-available');
    }
   
});


$('#id').on("blur", function(){
    
    const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    let id = $('#id').val();


    if(id == ""){
        $('#idMsg').addClass('not-available');
        $('#idMsg').text('필수항목입니다.');
    } else if(!emailReg.test(id)){
        $('#idMsg').addClass('not-available');
        $('#idMsg').text('아이디는 이메일 형식입니다.');
    } else {
        // 중복체크 (에이잭스)
        $.ajax({
            url : "/el/admin/dup-check",
            method : "POST",
            data : {"id" : id},
            success : function(result){
                if(result == ""){
                    // 중복
                    $('#idMsg').addClass('not-available');
                    $('#idMsg').text('이미 가입한 이메일입니다.');
                } else{
                    // 사용가능
                    $('#idMsg').removeClass('not-available');
                    idCheck = true;
                }

            },
            error : function(){
                alert('통신실패');
            }
        })
    }
   
});

let pwdCheck = false;

// 비밀번호 체크
$('#pwd').on("keyup", function(){
    console.log('클릭됨');
    const pwdReg = /^(?=.*[a-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
    const pwd = $('#pwd').val();

    if(pwd == ""){
        $('#pwdMsg').addClass('not-available');
        $('#pwdMsg').text('필수항목입니다.');
    } else if(!pwdReg.test(pwd)){
        $('#pwdMsg').addClass('not-available');
        $('#pwdMsg').text('특수문자 포함 8~16자입니다.');
    } else {
        $('#pwdMsg').removeClass('not-available');
    }
})

// 비번확인 체크
$('#pwd2').on("keyup", function(){
    const pwd = $('#pwd').val();
    const pwd2 = $('#pwd2').val();

    if(pwd2 == ""){
        $('#pwd2Msg').addClass('not-available');
        $('#pwd2Msg').text('필수항목입니다.');
    } else if(pwd2 != pwd){
        $('#pwd2Msg').addClass('not-available');
        $('#pwd2Msg').text('비밀번호가 일치하지 않습니다.');
    } else {
        $('#pwd2Msg').removeClass('not-available');
        pwdCheck = true;
    }
});

// 이름 체크
let nameCheck = false;
$('#name').on('keyup', function(){
    let name = $('#name').val();

    if(name == ""){
        $('#nameMsg').addClass('not-available');
        $('#nameMsg').text('필수항목입니다.');
    } else if(name.length == 1){
        $('#nameMsg').addClass('not-available');
        $('#nameMsg').text('이름을 입력해주세요.');
    } else{
        $('#nameMsg').removeClass('not-available');
        nameCheck = true;
    } 

})
//닉네임 체크
let nickCheck = false;
$('#nick').on('keyup', function(){
    let nick = $('#nick').val();

    if(nick == ""){
        $('#nickMsg').addClass('not-available');
        $('#nickMsg').text('필수항목입니다.');
    } else if(nick.length == 1){
        $('#nickMsg').addClass('not-available');
        $('#nickMsg').text('닉네임은 2자 이상입니다.');
    } else{
        $('#nickMsg').removeClass('not-available');
    }

})

$('#nick').on('blur', function(){
    let nick = $('#nick').val();

    if(nick == ""){
        $('#nickMsg').addClass('not-available');
        $('#nickMsg').text('필수항목입니다.');
    } else if(nick.length == 1){
        $('#nickMsg').addClass('not-available');
        $('#nickMsg').text('닉네임은 2자 이상입니다.');
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
                    $('#nickMsg').removeClass('not-available');
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
let phoneCheck = false;
$('#phone').on('keyup', function(){
    let phone = $('#phone').val();
    const phoneReg = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;
    
    if(!phoneReg.test(phone)){
        $('#phoneMsg').addClass('not-available');
        $('#phoneMsg').text('번호를 확인해주세요.');
    } else if(phone == ""){
        $('#phoneMsg').addClass('not-available');
        $('#phoneMsg').text('필수항목입니다.');
    } else{
        $('#phoneMsg').removeClass('not-available');
        phoneCheck = true;
    }
})

// 모든 유효성 검사
function joinCheck() {
    if(!idCheck){
        Swal.fire({
            icon: 'error',
            title: '아이디를 확인해주세요.',
            confirmButtonColor: '#1187CF'
        })
        return false;
    }
    if(!pwdCheck){
        Swal.fire({
            icon: 'error',
            title: '비밀번호를 확인해주세요.',
            confirmButtonColor: '#1187CF'
        })
        return false;
    }
    if(!nameCheck){
        Swal.fire({
            icon: 'error',
            title: '이름을 확인해주세요.',
            confirmButtonColor: '#1187CF'
        })
        return false;
    }

    if(!nickCheck){
        Swal.fire({
            icon: 'error',
            title: '닉네임을 확인해주세요.',
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