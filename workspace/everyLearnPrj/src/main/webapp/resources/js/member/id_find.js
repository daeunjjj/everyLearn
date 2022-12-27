function idFind() {
    let memberName = $('#memberName').val();
    let memberEmail = $('#memberEmail').val();
    console.log(memberName);
    console.log(memberEmail);
    
    $.ajax({
        url : "/el/member/idFindAjax"
        , type : "post"
        , data : 
        {"memberName" : memberName,
         "memberEmail" : memberEmail
        }
        , success : function(findId){

            if(findId == ''){
                // alert('등록되지 않은 정보입니다. 확인 후 다시 입력해주세요')
                // Swal.fire(
                //     '등록되지 않은 정보입니다',
                //     '확인 후 다시 입력해주세요.',
                //     '확인'
                    
                //   )
                Swal.fire({
                    title: '등록된 아이디가 없습니다.',
                    
                    icon: 'question',
                    iconHtml: '?',
                    confirmButtonText: '다시입력',
                    confirmButtonColor: '#1187CF', 
                    cancelButtonText: '메인으로',
                    showCancelButton: true,
                    showCloseButton: true
                  })
            }else{
                window.open("/el/member/successIdFind?findId=" + findId);
            }
            

        }
        , error : function name(params) {
            alert('아작스실패');
        }
        
    });

}