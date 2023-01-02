

function check() {

    var cate_no = $('input[name=cate_no]:checked').val();


    $.ajax({
        url : "/el/class/report",	
        type : "post",
        data : {
                "cate_no" : cate_no
                }
        ,
        success : function(result){
            if(result != ''){
                // alert("데이터 넘어갔음~")
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
