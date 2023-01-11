function memberNo(params) {
    let memberNo = $('#memberNo').val();
    console.log(memberNo);

    $.ajax({
        url : "/el/teacher/info"
        , type : "get"
        , data : {
            "memberNo" : memberNo
        }
        , success : (data) => {
            // location.href
            alert('성공');
            location.href = "/el/teacher/info";
            console.log(data);
        }
        , error : ()=>{
            alert('에러')
        }
    })

}

function memberStudy(memberNo){
    let f = document.createElement('form');
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'memberNo');
    obj.setAttribute('value', memberNo);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/el/member/memberStudy');
    document.body.appendChild(f);
    f.submit();
}




