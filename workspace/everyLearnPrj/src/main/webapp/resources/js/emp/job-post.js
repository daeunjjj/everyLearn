// 연봉 세자리 콤마
const input = document.querySelector('.number');
input.addEventListener('keyup', function(e) {
  let value = e.target.value;
  value = Number(value.replaceAll(',', ''));
  if(isNaN(value)) {
    input.value = 0;
  }else {
    const formatValue = value.toLocaleString('ko-KR');
    input.value = formatValue;
  }
})

// 채용시 마감 체크박스 활성화 비활성화
function checkDeadLine(){
  const checkbox = document.getElementById('checkbox');
  const date = document.getElementById('date');

  if(checkbox.checked){
    date.setAttribute('disabled', '');
  }else{
    date.removeAttribute('disabled');
  }
}
