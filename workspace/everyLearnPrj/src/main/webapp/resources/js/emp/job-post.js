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

const inputCategory = document.getElementById('category');
const inputTitle = document.getElementById('title');
const inputIntroduce = document.getElementById('introduce');
const inputResponsibility= document.getElementById('responsibility');
const inputQualification= document.getElementById('qualification');
const inputCareer = document.getElementById('career');
const inputSalary = document.getElementById('salary');
const inputSector = document.getElementById('sector');
const inputAddress = document.getElementById('address');
const inputdate = document.getElementById('date');
const inputCheckbox = document.getElementById('checkbox');


const dateValue = inputdate.value;

// 저장 버튼 
const validate = () => {
  const titleValue = inputTitle.value;
  const introduceValue = inputIntroduce.value;
  const responsibilityValue = inputResponsibility.value;
  const qualificationValue = inputQualification.value;
  const careerValue = inputCareer.value;
  const salaryValue = inputSalary.value;
  const sectorValue = inputSector.value;
  const addressValue = inputAddress.value;
  const dateValue = inputdate.value;

  if(titleValue && introduceValue && responsibilityValue && qualificationValue && careerValue && salaryValue && sectorValue && addressValue) {
    if(dateValue || inputCheckbox.checked){
      const btn = document.getElementById('submit-btn')
      btn.removeAttribute('disabled');
    }
  }else{
    const btn = document.getElementById('submit-btn')
    btn.setAttribute('disabled', '');
  }
  validateTitle(true);
  validateIntroduce(true);
  validateResponsibility(true);
  validateQualification(true);
  validateCareer(true);
  validateSalary(true);
  validateSector(true);
  validateAddress(true);
}


const validateTitle = (isTyping) => {
  const titleValue = inputTitle.value;
  const show = document.getElementById('input-title');

  if (titleValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

const validateIntroduce = (isTyping) => {
  const introduceValue = inputIntroduce.value;
  const show = document.getElementById('input-introduce');

  if (introduceValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

const validateResponsibility = (isTyping) => {
  const responsibilityValue = inputResponsibility.value;
  const show = document.getElementById('input-responsibility');

  if (responsibilityValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

const validateQualification = (isTyping) => {
  const qualificationValue = inputQualification.value;
  const show = document.getElementById('input-qualification');

  if (qualificationValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

const validateCareer = (isTyping) => {
  const careerValue = inputCareer.value;
  const show = document.getElementById('input-career');

  if (careerValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

const validateSalary = (isTyping) => {
  const salaryValue = inputSalary.value;
  const show = document.getElementById('input-salary');

  if (salaryValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}
const validateSector = (isTyping) => {
  const sectorValue = inputSector.value;
  const show = document.getElementById('input-sector');

  if (sectorValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

const validateAddress = (isTyping) => {
  const addressValue = inputAddress.value;
  const show = document.getElementById('input-address');

  if (addressValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}

const validateDate = (isTyping) => {
  const dateValue = inputdate.value;
  const show = document.getElementById('input-date');

  if (dateValue.length) {
    show.style.display = 'none';
  } else if (!isTyping) {
    show.style.display = 'flex';
  }
}




