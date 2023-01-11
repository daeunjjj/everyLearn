const sendMail = (target) => {
  Swal.fire({
    position: 'center',
    icon: 'success',
    title: '이메일 전송 완료!',
    showConfirmButton: false,
    timer: 1500
  }).then(() => {
    target.submit();
  })

  return false;
}

const inputId = document.getElementById('id');

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
        warn.innerHTML = "가입된 아이디를 입력해주세요.";
        show.style.display = 'none';
        isOk.style.display = 'flex';
      } else {
        okId.innerHTML = "가입된 아이디입니다.";
        isOk.style.display = 'none';
        show.style.display = 'flex';
      }
    }
  });
}