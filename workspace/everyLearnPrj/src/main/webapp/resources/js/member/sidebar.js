function memberNo() {

    window.open("/el/member/writeList");
    
    let memberNo = $('#memberNo').val();
    console.log(memberNo);
    
    $.ajax({
        url : "/el/member/writeList"
        , type : "get"
        , data : {
            "memberNo" : memberNo
        }
        , success : function name() {
            alert("성공!")
            
        }
        , error : function name(params) {
            
        }
    });


}

function test(params) {
    console.log("js 됨!");
}

function listView(memberNo){
    console.log(memberNo);
    let f = document.createElement('form');
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'memberNo');
    obj.setAttribute('value', memberNo);
    
    f.appendChild(obj);
    f.setAttribute('method', 'get');
    f.setAttribute('action', '/el/member/writeList');
    document.body.appendChild(f);
    f.submit();
}