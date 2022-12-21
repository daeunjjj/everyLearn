// 이메일 정규식
const emailId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

const activeBtn = () => {
  const inputId = document.getElementById('id');
  const inputpwd = document.getElementById('pwd');
  const inputName = document.getElementById('name');
  const inputcompanyName = document.getElementById('companyName');
  const inputphone = document.getElementById('phone');

  const idValue = inputId.value;
  const pwdValue = inputpwd.value;
  const nameValue = inputName.value;
  const companyNameValue = inputcompanyName.value;
  const phoneValue = inputphone.value;

  if (emailId.test(idValue) && pwdValue.length >= 8 && nameValue.length && companyNameValue && phoneValue.length === 13) {
    const btn = document.getElementById('joinBtn')
    btn.removeAttribute('disabled');
  }
  validateId(true);
}

// 전화번호 정규식(하이픈 자동추가)
const autoHyphen = (target) => {
  target.value = target.value
    .replace(/[^0-9]/g, '')
    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");

  activeBtn();
}

const validateId = (isTyping) => {
  const inputId = document.getElementById('id');
  const idValue = inputId.value;
  const show = document.getElementById("input-id")

  if (emailId.test(idValue)) {
    show.style.display = 'none';
  }else if(!isTyping) {
    show.style.display = 'block';
  }

}


