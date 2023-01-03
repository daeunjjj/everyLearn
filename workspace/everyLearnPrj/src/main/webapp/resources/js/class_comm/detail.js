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

function commentWrite(){
	let content = document.getElementById("data1").value;
	let memberNo = document.getElementById("memberNo").value;
	let classCommNo = document.getElementById("classCommNo").value;

    console.log(content);
    console.log(memberNo);
    console.log(classCommNo);

    $.ajax({
        url : "/el/class/commentAjax"
        , type : "post"
        , data : {
            "content" : content
            , "memberNo" : memberNo
            , "classCommNo" : classCommNo
        }
        // ,dataType : "json"
        // ,contentType: "application/x-www-form-urlencoded; charset=UTF-8"
        ,success : function (data) {

            console.log(data);
            location.reload();

            // const wrap = document.querySelector('#comment-wrap')
            // for(let i=0; i<arr.length; ++i){
            //     const data = arr[i];

            //     const commWrite =document.querySelector("#commWriter");
            //     commWrite.append(data.comWriter);
            //     wrap.appendChild(commWrite.append(data.comWriter));

            //     // const writer = $("#writer").html("비번 필수입력사항입니다.")
            // //    $("#commWriter").html(data.comWriter);
               
               
            // }
          
        }
        , error : function (params) {
            alert('댓글에이젝스에러');
        }
    });


}

function write() {
			
    let comment_content = $('#comment_content').val();
    let memberNo = $('#memberNo').val();
    let classCommNo = $('#classCommNo').val();
    console.log(comment_content);
    // $.ajax({
    //     url : "/el/commentAjax"
    //     , type : "post"
    //     , data : {
    //         "content" : comment_content
    //     }
    //     , success : function (x) {
    //         if(x != null){
    //             console.log("성 공ㅇㅇㅇㅇㅇ" + x);
    //             return true;
    //         }
    //     }
    //     , error : function () {
    //         alert("아 작 스 실 패");
    //     }
    // });// 댓글 비동기 끝
    
};// 댓글등록 이벤트 끝

function commentEnroll() {
    let content = $('#content').val();
    let memberNo = $('#memberNo').val();
    let classCommNo = $('#classCommNo').val();
    console.log(content);
    $.ajax({
        url : "/el/commentAjax"
        , type : "post"
        , data : {
            "content" : content
        }
        , success : function (x) {
            if(x != null){
                console.log("성 공ㅇㅇㅇㅇㅇ" + x);
                return true;
            }
        }
        , error : function () {
            alert("아 작 스 실 패");
        }
    });

}


function postData() {


    let blacklistNo = $('#blacklistNo').val();
    let accusor = $('#accusor').val();

    let board = $('#board').val();

    $.ajax({
        url : "/el/class/reportInfo",	
        type : "post",
        data : {"blacklistNo" : blacklistNo
                , "accusor" : accusor
                , "board" : board
                }
        ,
        success : function(result){
            if(result != ''){
                 alert("데이터 넘어갔음~")

           
            }	
        },
        error : function(){
             alert("아 작 스 실 패") 
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

function modify() {
    let memberNick = $('#hidden-member').val();
    let writer = $('#hidden-writer').val();
    console.log(memberNick);
    console.log(writer);

    if(memberNick != writer){
        alert('작성자 본인만 수정 가능합니다');
    }

    return true;
}

function mainDelete() {
    let memberNick = $('#hidden-member').val();
    let writer = $('#hidden-writer').val();
    let classCommNo = $('#hidden-classCommNo').val();
    console.log(memberNick);
    console.log(writer);
    console.log(classCommNo);

    $.ajax({
        url : "/el/class/deleteAjax"
        , type : "post"
        , data : {
            "classCommNo" : classCommNo
        }
        , success : function(result){
            if(result != null){
                alert("삭제가 완료되었습니다.");
                let url = "/el/class/qna"
                location.replace(url);
            }

        }
        , error : function () {
            alert("에이젝스 오 류")
        }
    })

    // if(memberNick != writer){
    //     alert('작성자 본인만 수정 가능합니다');
    // }

    return true;
}