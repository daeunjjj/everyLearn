

function check() {

    var cate_no = $('input[name=type]:checked').val();


    $.ajax({
        url : "/el/class/report",	
        type : "post",
        data : {
                "type" : type
                }
        ,
        success : function(result){
            if(result != ''){
                
                alert("신고 데이터 넘어갔음~")
            }	
        },
        error : function(){
            alert("아 작 스 실 패") 
        }
    });
}


function completion() {

    return true;
}
