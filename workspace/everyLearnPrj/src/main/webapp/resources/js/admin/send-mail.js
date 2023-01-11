
function add(){
    $("#add-next").append('<div class="input-area" > <label for="multipartFile"></label> <div class="attach-wrap"> <input type="file" id="multipartFile" name="multipartFile" > </div> </div>');
}
// 포커스 효과
let inputArr = $('input[type="text"]');
for(let i = 0; i < inputArr.length; i++){
    
    inputArr[i].addEventListener('focus',()=>{
        inputArr[i].style.border="1px solid #005297";
    });
}

// 블러효과
for(let i = 0; i < inputArr.length; i++){

    inputArr[i].addEventListener('blur',()=>{
        inputArr[i].style.border="";
    });
}

// 포커스 효과
$('textarea').on("focus", function(){
    $('textarea').css("border","1px solid #005297");
});
// 블러
$('textarea').on("blur", function(){
    $('textarea').css("border","");
});

