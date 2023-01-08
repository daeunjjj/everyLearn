// 주소 api
function searchArr() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var addr = ''; // 주소 변수
      var extraAddr = ''; // 참고항목 변수

      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      }

      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
      if (data.userSelectedType === 'R') {
        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
          extraAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if (data.buildingName !== '' && data.apartment === 'Y') {
          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if (extraAddr !== '') {
          extraAddr = ' (' + extraAddr + ')';
        }
        // 조합된 참고항목을 해당 필드에 넣는다.
        document.getElementById("address").value = extraAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById("address").value = addr;
      // 커서를 상세주소 필드로 이동한다.
      document.getElementById("detailAddress").focus();
    }
  }).open();
}


const eduPlusBtn = () => {
  if(eduIndex >= 5){
    Swal.fire({
      icon: 'error',
      title: '앗!',
      text: '최대 5개까지 추가 가능해요..😥',
    })
    return;
  }
  const eduList = document.getElementById('education-list');
  eduList.innerHTML += `
  <div class="item">
    <div class="separator"></div>
    <div class="grid">
      <div class="list">
        <p class="list-top">학교 종류</p>
        <div>
          <input type="text" name="evList[${eduIndex}].education" class="input">
        </div>
      </div>
      <div class="list">
        <p class="list-top">학교명</p>
        <div>
          <input type="text" name="evList[${eduIndex}].schoolName" class="input">
        </div>
      </div>
      <div class="list">
        <p>전공</p>
        <div>
          <input type="text" name="evList[${eduIndex}].major" class="input">
        </div>
      </div>
      <!-- 드롭다운 변경 예정 -->
      <div class="list">
        <p>졸업 여부</p>
        <div>
          <select name="evList[${eduIndex}].status" class="input">
            <option value="1">졸업</option>
            <option value="2">재학</option>
            <option value="3">중퇴</option>
          </select>
        </div>
      </div>
      <div class="list">
        <p>입학날짜</p>
        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
          <input type="text" id="edu-start-${eduIndex}" aria-label="Date-Time" class="input" name="evList[${eduIndex}].enterSchool" placeholder="0000년 00월"/>
            <span class="tui-ico-date"></span>
        </div>
        <div id="edu-start-container-${eduIndex}" style="margin-top: -1px;"></div>
      </div>
      <div class="list">
        <p>졸업날짜</p>
        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
          <input type="text" id="edu-graduate-${eduIndex}" aria-label="Date-Time" class="input" name="evList[${eduIndex}].graduate" placeholder="0000년 00월"/>
            <span class="tui-ico-date"></span>
        </div>
        <div id="edu-graduate-container-${eduIndex}" style="margin-top: -1px;"></div>	
      </div>
    </div>
  </div>
  `
  new DatePicker(document.getElementById(`edu-start-container-${eduIndex}`), {
    language: 'ko',
    type: 'month',
    input: {
        element: document.getElementById(`edu-start-${eduIndex}`),
        format: 'yyyy-MM'
    },
    date: null
    
  });

  new DatePicker(document.getElementById(`edu-graduate-container-${eduIndex}`), {
    language: 'ko',
    type: 'month',
    input: {
        element: document.getElementById(`edu-graduate-${eduIndex}`),
        format: 'yyyy-MM'
    },
    date: null
    
  });
  eduIndex += 1;
}

const eduDeleteBtn = () =>{
  document.querySelector('#education-list>.item:last-child').remove();
  eduIndex -= 1;
}


const careerPlusBtn = () => {
  if(careerIndex >= 10){
    Swal.fire({
      icon: 'error',
      title: '앗!',
      text: '최대 10개까지 추가 가능해요..😥',
    })
    return;
  }
  const eduList = document.getElementById('career-list');
  eduList.innerHTML += `
  <div class="item">
    <div class="separator"></div>
    <div class="grid">
      <div class="list">
        <p>회사명</p>
        <div>
          <input type="text" name="cvList[${careerIndex}].companyName" class="input">
        </div>
      </div>
      <div class="list">
        <p>부서명</p>
        <div>
          <input type="text" name="cvList[${careerIndex}].team" class="input" ">
        </div>
      </div>
      <div class="list">
        <p>직책</p>
        <div>
          <input type="text" name="cvList[${careerIndex}].position" class="input"> 
        </div>
      </div>
      <!-- 드롭 다운 -->
      <div class="list">
        <p>근무유형</p>
        <div>
          <select name="cvList[${careerIndex}].type" class="input">
            <option value="1">인턴</option>
            <option value="2">계약직</option>
            <option value="3">정규직</option>
            <option value="4">개인사업</option>
            <option value="5">프리랜서</option>
          </select>
        </div>
      </div>
      <div class="list">
        <p>입사일</p>
        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
          <input type="text" id="cv-enter-${careerIndex}" aria-label="Date-Time" class="input" name="cvList[${careerIndex}].joinCompany" placeholder="0000년 00월 00일"/>
            <span class="tui-ico-date"></span>
        </div>
        <div id="cv-enter-container-${careerIndex}" style="margin-top: -1px;"></div>	
      </div>
      <div class="list">
        <p>퇴사일</p>
        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
          <input type="text" id="cv-leave-${careerIndex}" aria-label="Date-Time" class="input" name="cvList[${careerIndex}].leave" placeholder="0000년 00월 00일"/>
            <span class="tui-ico-date"></span>
        </div>
        <div id="cv-leave-container-${careerIndex}" style="margin-top: -1px;"></div>	
      </div>
      <!-- 드롭 다운 -->
      <div class="list">
        <p>재직 여부</p>
        <div>
          <select name="cvList[${careerIndex}].currentYN" class="input">
            <option value="Y">재직중</option>
            <option value="N">퇴사</option>
          </select>
        </div>
      </div>
    </div>
  </div>
  `
  new DatePicker(document.getElementById(`cv-enter-container-${careerIndex}`), {
    language: 'ko',
    type: 'date',
    input: {
        element: document.getElementById(`cv-enter-${careerIndex}`),
        format: 'yyyy-MM-dd'
    },
    date: null
    
  });

  new DatePicker(document.getElementById(`cv-leave-container-${careerIndex}`), {
    language: 'ko',
    type: 'date',
    input: {
        element: document.getElementById(`cv-leave-${careerIndex}`),
        format: 'yyyy-MM-dd'
    },
    date: null
    
  });

  careerIndex += 1;
}

const careerDeleteBtn = () => {
  document.querySelector('#career-list>.item:last-child').remove();
  careerIndex -= 1;
}

const awardPlusBtn = () => {
  if(awardIndex >=10){
    Swal.fire({
      icon: 'error',
      title: '앗!',
      text: '최대 10개까지 추가 가능해요..😥',
    })
    return;
  }
  const eduList = document.getElementById('award-list');
  eduList.innerHTML += `
  <div class="item">
    <div class="separator"></div>
    <div class="grid">
      <div class="list">
        <p>수상내역</p>
        <div>
          <input type="text" name="avList[${awardIndex}].awardName" class="input" >
        </div>
      </div>
      <div class="list">
        <p>수상년도</p>
        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
          <input type="text" id="av-date-${awardIndex}" aria-label="Date-Time" class="input" name="avList[${awardIndex}].awardDate" placeholder="0000년 00월"/>
            <span class="tui-ico-date"></span>
        </div>
        <div id="av-date-container-${awardIndex}" style="margin-top: -1px;"></div>	
      </div>
      <!-- textarea -->
      <div class="list">
        <p>수상기관</p>
        <div>
          <input type="text" name="avList[${awardIndex}].awardAgency" class="input">
        </div>
      </div>
      </div>
  </div>
  `
  new DatePicker(document.getElementById(`av-date-container-${awardIndex}`), {
    language: 'ko',
    type: 'month',
    input: {
        element: document.getElementById(`av-date-${awardIndex}`),
        format: 'yyyy-MM'
    },
    date: null
    
  });

  awardIndex += 1;
}

const awardDeleteBtn = () => {
  document.querySelector('#award-list>.item:last-child').remove();
  awardIndex -= 1;
}

const certificatePlusBtn = () => {
  if(certificateIndex >=10){
    Swal.fire({
      icon: 'error',
      title: '앗!',
      text: '최대 10개까지 추가 가능해요..😥',
    })
    return;
  }
  const eduList = document.getElementById('certificate-list');
  eduList.innerHTML += `
  <div class="item">
    <div class="separator"></div>
    <div class="grid">
      <div class="list">
        <p>자격증명</p>
        <div>
          <input type="text" name="cfvList[${certificateIndex}].certificateName" class="input">
        </div>
      </div>
      <!-- textarea -->
      <div class="list">
        <p>취득일</p>
        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
          <input type="text" id="cfv-date-${certificateIndex}" aria-label="Date-Time" class="input" name="cfvList[${certificateIndex}].certificateDate" placeholder="0000년 00월"/>
            <span class="tui-ico-date"></span>
        </div>
        <div id="cfv-date-container-${certificateIndex}" style="margin-top: -1px;"></div>	
      </div>
      <div class="detail">
        <p>발급기관</p>
        <div>
          <input type="text" name="cfvList[${certificateIndex}].certificateAgency" class="input">
        </div>
      </div>
    </div>
  </div>
  `
  new DatePicker(document.getElementById(`cfv-date-container-${certificateIndex}`), {
    language: 'ko',
    type: 'month',
    input: {
        element: document.getElementById(`cfv-date-${certificateIndex}`),
        format: 'yyyy-MM'
    },
    date: null
    
  });

  certificateIndex += 1;
}

const certificateDeleteBtn = () => {
  document.querySelector('#certificate-list>.item:last-child').remove();
  certificateIndex -= 1;
}

const languagePlusBtn = () => {
  if(languageIndex >=10){
    Swal.fire({
      icon: 'error',
      title: '앗!',
      text: '최대 10개까지 추가 가능해요..😥',
    })
    return;
  }
  const eduList = document.getElementById('language-list');
  eduList.innerHTML += `
  <div class="item">
    <div class="separator"></div>
    <div class="grid">
      <div class="list">
        <p>언어명</p>
        <div>
          <input type="text" name="lvList[${languageIndex}].language" class="input">
        </div>
      </div>
      <!-- 드롭다운 -->
      <div class="list">
        <p>수준</p>
        <div>
          <select name="lvList[${languageIndex}].languageLevel" class="input">
            <option value="1">상</option>
            <option value="2">중</option>
            <option value="3">하</option>
          </select>
        </div>
      </div>
    </div>
  </div>
  `
  languageIndex += 1;
}

const languageDeleteBtn = () => {
  document.querySelector('#language-list>.item:last-child').remove();
  languageIndex -= 1;
}

