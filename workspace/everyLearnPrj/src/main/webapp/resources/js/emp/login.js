// 이메일 정규식
const emailId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

const activeBtn = () => {
  const inputId = document.getElementById('id');
  const inputPwd = document.getElementById('pwd');
  const idValue = inputId.value;
  const pwdValue = inputPwd.value;

  if(emailId.test(idValue) && pwdValue.length >= 8){
    const btn = document.getElementById('loginBtn')
    btn.removeAttribute('disabled');
  }
}

