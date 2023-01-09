function maintain(params) {
    window.close();
}

function pwdCheck(params) {

    // opener.location.href='/el/member/login'; 
    // window.close();
    let password = $('#password').val();
    let memberNo = $('#memberNo').val();
    console.log(password);
    console.log(memberNo);
    
    
    $.ajax({
        url : "/el/member/deleteAjax"
        ,type : "post"
        ,data : {
            "password" : password,
            "memberNo" : memberNo
            
        }
        ,success : function name(data) {
            console.log(data);
            if(data == "success"){
                Swal.fire(
                    '정말 탈퇴하시겠습니까?'
                  );
                deleteMember();
            }else{
                Swal.fire(
                    '올바르지 않은 비밀번호입니다.',
                    '비밀번호 확인 후 다시 입력해주세요.'
                  );
            }
        }
        ,error : function name(params) {
            alert("실해");
        }
    });

}

function deleteMember(params) {
    let memberNo = $('#memberNo').val();

    $.ajax({
        url : "/el/member/delete"
        ,type : "post"
        ,data : {
            
            "memberNo" : memberNo
            
        }
        ,success : function name(data) {
            console.log(data);
            if(data == "ok"){
                Swal.fire(
                    '탈퇴 완료!'
                  ).then(() => {
                      opener.location.href='/el/member/login'; 
                      window.close();
                  })
            
            }else{
                Swal.fire(
                    '탈퇴오류 발생!'
                  );
            }
        }
        ,error : function name(params) {
            alert("실해");
        }
    })

}