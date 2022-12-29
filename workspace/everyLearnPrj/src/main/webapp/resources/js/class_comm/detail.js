function new_window() {

    let accusor = $('#accusor').val();

    if(accusor == ''){
        alert('로그인 후 이용하세요.')
        window.location.href='/el/member/login';
    }

    let blacklist = $('#blacklist').val();
    let refortTitle = $('#refortTitle').val();
    console.log(refortTitle);

    window.open(
        "http://127.0.0.1:8888/el/class/report?blacklist="+ blacklist,
        "detail",
        "width=500px, height=500px, top=100, left=100"
    );
}

function commentEnroll() {
    let content = $('#content').val();
    let memberNo = $('#memberNo').val();
    let classCommNo = $('#classCommNo').val();

    $.ajax({
        url : "/el/class/comment"
        , type : "post"
        , data : {
            "content" : content
        }
        , success : function (x) {
            if(result != null){
                console.log("성 공ㅇㅇㅇㅇㅇ" + x);
                return true;
            }
        }
        , error : function () {
            // alert("아 작 스 실 패");
        }
    });

}


function postData() {


    let blacklistNo = $('#blacklistNo').val();
    let accusor = $('#accusor').val();

    let board = $('#board').val();

    $.ajax({
        url : "/el/class/report",	
        type : "post",
        data : {"blacklistNo" : blacklistNo
                , "accusor" : accusor
                // , "cate_no" : cate_no
                , "board" : board
                }
        ,
        success : function(result){
            if(result != ''){
                // alert("데이터 넘어갔음~")
            }	
        },
        error : function(){
            // alert("아 작 스 실 패") 
        }
    });
}

function getData() {

    let blacklist = $('#blacklist').val();
    let refortTitle = $('#refortTitle').val();

    console.log("로그에블리 : " + blacklist);

    $.ajax({
        url : "/el/class/report",	
        type : "get",
        data : {"blacklist" : blacklist
                , "refortTitle" : refortTitle}
        ,
        success : function(result){
            window.open(
                "http://127.0.0.1:8888/el/class/report",
                "detail",
                "width=500px, height=500px, top=100, left=100"
            );
            alert('겟 넘어감')
            return true;
        },
        error : function(){
            alert("겟 아 작 스 실 패") 
        }
    });
}

function completion() {
    Swal.fire('신고가 완료되었습니다.')
    // window.close();
    return true;
}
