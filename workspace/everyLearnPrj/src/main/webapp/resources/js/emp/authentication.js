const inputPwd = document.getElementById('pwd');
const inputPwdCheck = document.getElementById('pwdCheck');

// 비밀번호 정규식(문자/ 특수문자/ 번호 포함 8~15자리)
const pwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

// 회원 가입 버튼 활성화
const activeBtn = () => {
  const pwdValue = inputPwd.value;
  const pwdCheckValue = inputPwdCheck.value;

  if(pwd.test(pwdValue) && pwdValue === pwdCheckValue) {
    const btn = document.getElementById('resetPwd')
    btn.removeAttribute('disabled');
  }else{
    const btn = document.getElementById('resetPwd')
    btn.setAttribute('disabled', '');
  }

  validatePwd(true);
  validateCheck(true);
}

// 비밀번호를 입력해주세요
const validatePwd = (isTyping) => {
  const pwdValue = inputPwd.value;
  const show = document.getElementById("input-pwd");
  const okPwd = document.getElementById("use-pwd");

  if (pwd.test(pwdValue)) {
    show.style.display = 'none';
    okPwd.style.display = 'flex';
  } else if (!isTyping) {
    show.style.display = 'flex';
    okPwd.style.display = 'none';
  }
}

// 비밀번호 확인
const validateCheck = (isTyping) => {
  const pwdValue = inputPwd.value;
  const pwdCheckValue = inputPwdCheck.value;
  const show = document.getElementById('use-pwdCheck');
  const failPwd = document.getElementById('input-pwdCheck');

  if(pwdValue === pwdCheckValue){
    show.style.display = 'flex';
    failPwd.style.display = 'none';
  } else {
    failPwd.style.display = 'flex';
    show.style.display = 'none';
  }

}
