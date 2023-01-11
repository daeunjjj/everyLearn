// //아이디 중복
// function idDup() {

//         let memberId = $('#memberId').val();

// 		$.ajax({
// 			url : "/el/member/idDup",	
// 			type : "post",
//             data : {"memberId" : memberId}
// 			,
// 			success : function(result){
// 				if(result == '1') {
// 					$("#idDup").html("중복된 ID입니다. ").css("color", "red");
//                     return false;
// 				}	
//                 else {
// 					$("#idDup").html("사용가능한 ID입니다. ").css("color", "green");
//                     return true;
// 				}			
// 			},
// 			error : function(){
// 				alert("아 작 스 실 패");
// 			}
// 		});
// 	}

function updateY(params) {
    let detailClassNo2 = document.getElementById('ddd').innerHTML
    let detailClassNo = $('#detailClassNo2').val();
    console.log(detailClassNo2);
}