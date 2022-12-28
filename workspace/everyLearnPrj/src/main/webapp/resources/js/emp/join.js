const inputId = document.getElementById('id');
const inputPwd = document.getElementById('pwd');
const inputName = document.getElementById('name');
const inputcompanyName = document.getElementById('companyName');
const inputphone = document.getElementById('phone');
const terms = document.getElementById('terms');
const privacy = document.getElementById('privacy');
const marketing = document.getElementById('marketing');

// 이메일 정규식
const emailId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

// 비밀번호 정규식(문자/ 특수문자/ 번호 포함 8~15자리)
const pwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

// 휴대폰 번호 정규식
const phone = /^(\d{0,3})\-(\d{0,4})\-(\d{0,4})$/g;

// 회원 가입 버튼 활성화
const activeBtn = () => {
  const idValue = inputId.value;
  const pwdValue = inputPwd.value;
  const nameValue = inputName.value;
  const companyNameValue = inputcompanyName.value;
  const phoneValue = inputphone.value;

  if (emailId.test(idValue) && pwd.test(pwdValue) && nameValue.length && companyNameValue && phoneValue.length === 13 && terms.checked && privacy.checked) {
    const btn = document.getElementById('joinBtn')
    btn.removeAttribute('disabled');
  }
  validateId(true);
  validatePwd(true);
  validateName(true);
  validateCompanyName(true);
  validatePhone(true);
}

// 전체 선택
const checkAll = (target) => {
  terms.checked = target.checked;
  privacy.checked = target.checked;
  marketing.checked = target.checked;
  activeBtn();
}

// 전화번호 정규식(하이픈 자동추가)
const autoHyphen = (target) => {
  target.value = target.value
    .replace(/[^0-9]/g, '')
    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");

  activeBtn();
}

// 아이디를 입력해주세요
const validateId = (isTyping) => {
  const idValue = inputId.value;
  const show = document.getElementById("input-id");
  const isOk = document.getElementById("use-id");
  const warn = document.querySelector(".essential");

  isOk.style.display = 'none';
  if (emailId.test(idValue)) {
    show.style.display = 'none';
    if (!isTyping) {
      checkId();
    }
  } else if (!isTyping) {
    warn.innerHTML = "아이디를 입력해 주세요.";
    show.style.display = 'flex';
  }
}

// 아이디 onblur
const checkId = () => {
  const idValue = inputId.value;
  const show = document.getElementById("input-id");
  const isOk = document.getElementById("use-id");
  const warn = document.querySelector(".essential");
  const okId = document.querySelector(".okId");

  $.ajax({
    url: "/el/corp/checkId",
    method: "POST",
    data: {
      id: idValue
    },
    success: function (result) {
      if (result === "okId") {
        okId.innerHTML = "사용가능한 아이디입니다.";
        show.style.display = 'none';
        isOk.style.display = 'flex';
      } else {
        warn.innerHTML = "중복된 아이디입니다.";
        isOk.style.display = 'none';
        show.style.display = 'flex';
      }
    }
  });

}

// 비밀번호를 입력해주세요
const validatePwd = (isTyping) => {
  const pwdValue = inputPwd.value;
  const show = document.getElementById("input-pwd")

  if (pwd.test(pwdValue)) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

// 이름을 입력해주세요
const validateName = (isTyping) => {
  const nameValue = inputName.value;
  const show = document.getElementById("input-name")

  if (nameValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

// 회사명을 입력해주세요
const validateCompanyName = (isTyping) => {
  const companyNameValue = inputcompanyName.value;
  const show = document.getElementById('input-companyName');

  if (companyNameValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

// 휴대폰 번호를 입력해주세요
const validatePhone = (isTyping) => {
  const phoneValue = inputphone.value;
  const show = document.getElementById('input-phone');

  if (phone.test(phoneValue)) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

