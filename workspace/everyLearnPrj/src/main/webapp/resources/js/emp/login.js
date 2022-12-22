const inputId = document.getElementById('id');
const inputPwd = document.getElementById('pwd');

// 이메일 정규식
const emailId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

// 로그인 버튼 활성화
const activeBtn = () => {
  const idValue = inputId.value;
  const pwdValue = inputPwd.value;

  if(emailId.test(idValue) && pwdValue.length >= 8){
    const btn = document.getElementById('loginBtn')
    btn.removeAttribute('disabled');
  }
  validateId(true);
  validatePwd(true);
}

// 아이디를 입력해주세요
const validateId = (isTyping) => {
  const idValue = inputId.value;
  const show = document.getElementById("input-id")

  if (emailId.test(idValue)) {
    show.style.display = 'none';
  }else if(!isTyping) {
    show.style.display = 'flex';
  }

}

// 비밀번호를 입력해주세요
const validatePwd = (isTyping) => {
  const pwdValue = inputPwd.value;
  const show = document.getElementById("input-pwd")

  if(pwdValue.length >= 8){
    show.style.display = 'none';
  }else if(!isTyping){
    show.style.display = 'flex';
  }
}

