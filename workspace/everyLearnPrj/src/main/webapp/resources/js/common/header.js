function memberNo(params) {
    let memberNo = $('#memberNo').val();
    console.log(memberNo);

    $.ajax({
        url : "/el/teacher/info"
        , type : "post"
        , data : {
            "memberNo" : memberNo
        }
        , success : (data) => {
            // location.href
            alert('성공');
            location.href = "/el/teacher/info";
        }
        , error : ()=>{
            alert('에러')
        }
    })

}