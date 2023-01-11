const companyName = document.getElementById('companyName');
const companyNum = document.getElementById('companyNum');
const address = document.getElementById('address');
const detailAddress = document.getElementById('detailAddress');
const introduce = document.getElementById('introduce');
const sector = document.getElementById('sector');
const empNum = document.getElementById('empNum');
const sales = document.getElementById('sales');
const homepage = document.getElementById('homepage');
const logo = document.getElementById('logo');
const thumb = document.getElementById('thumb');
const btn = document.querySelector('.admin-btn');
const hiddenLogo = document.getElementById('hiddenLogo');
const hiddenThumb = document.getElementById('hiddenThumb');

// 사업자등록번호 정규식(하이픈 자동추가)
const autoHyphen = (target) => {
	target.value = target.value
		.replace(/[^0-9]/g, '')
		.replace(/^(\d{0,3})(\d{0,2})(\d{0,5})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");

	validate();
}

// 연 매출 세자리 콤마
const input = document.querySelectorAll('.number');

input.forEach((item) => {
	item.addEventListener('keyup', function(e) {
  let value = e.target.value;
  value = Number(value.replaceAll(',', ''));
  if(isNaN(value)) {
    item.value = '';
  }else {
    const formatValue = value.toLocaleString('ko-KR');
    item.value = formatValue;
  }
})})


// 승인 요청 버튼 활성화
const validate = () => {
	const companyNameValue = companyName.value;
	const companyNumValue = companyNum.value;
	const addressValue = address.value;
	const detailAddressValue = detailAddress.value;
	const introduceValue = introduce.value;
	const sectorValue = sector.value;
	const empNumValue = empNum.value;
	const salesValue = sales.value;
	const homepageValue = homepage.value;
	const logoValue = logo.value;
	const thumbValue = thumb.value;
	const hiddenLogoValue = hiddenLogo.value;
	const hiddenThumbValue = hiddenThumb.value;
		
	if(companyNameValue && companyNumValue.length === 12 && addressValue && detailAddressValue && introduceValue && sectorValue !== '선택' && empNumValue && salesValue && homepageValue && (logoValue || hiddenLogoValue) && (thumbValue || hiddenThumbValue)){
		const btn = document.querySelector('.admin-btn');
		btn.removeAttribute('disabled');
	}else{
		const btn = document.querySelector('.admin-btn');
		btn.setAttribute('disabled', '');
	}
	validateCompanyName(true);
	validateCompanyNum(true);
	validateAdderss(true);
	validateDetailAddress(true);
	validateIntroduce(true);
	validateSector(true);
	validateEmpNum(true);
	validateSales(true);
	validateHompage(true);
	validateLogo(true);
	validateThumb(true);
}


// 회사 이름 필수 입력
const validateCompanyName = (isTyping) => {
	const companyNameValue = companyName.value;
	const show = document.getElementById('input-companyName');

	if(companyNameValue.length){
		show.style.display = 'none';
	}else if(!isTyping){
		show.style.display = 'flex';
	}
}

// 사업자번호 필수 입력
const validateCompanyNum = (isTyping) => {
	const companyNumValue = companyNum.value;
	const show = document.getElementById('input-companyNum');

	if(companyNumValue.length === 12){
		show.style.display = 'none';
	}else if(!isTyping){
		show.style.display = 'flex';
	}
	
}

// 회사 주소 필수 입력
const validateAdderss = (isTyping) => {
	const addressValue = address.value;
	const show = document.getElementById('input-companyAddress');

	if(addressValue.length){
		show.style.display = 'none';
	}else if(!isTyping){
		show.style.display = 'flex';
	}
}

// 상세주소 필수 입력
const validateDetailAddress = (isTyping) => {
	const detailAddressValue = detailAddress.value;
	const show = document.getElementById('input-detailAddress');

	if(detailAddressValue.length){
		show.style.display = 'none';
	}else if(!isTyping){
		show.style.display = 'flex';
	}
}

// 회사소개 필수 입력
const validateIntroduce = (isTyping) => {
	const introduceValue = introduce.value;
	const show = document.getElementById('input-introduce');

	if(introduceValue.length){
		show.style.display = 'none';
	}else if(!isTyping){
		show.style.display = 'flex';
	}
}

// 산업군 필수입력
const validateSector = (isTyping) => {
	const sectorValue = sector.value;
	const show = document.getElementById('input-sector');

	if(sectorValue){
		show.style.display = 'none';
		console.log(sectorValue)
	}else if(!isTyping){
		show.style.display = 'flex';
	}
}

// 사원수 필수입력
const validateEmpNum = (isTyping) => {
	const empNumValue = empNum.value;
	const show = document.getElementById('input-empNum');

	if(empNumValue.length){
		show.style.display = 'none';
	}else if(!isTyping){
		show.style.display = 'flex';
	}
}

// 연매출 필수 입력
const validateSales = (isTyping) => {
	const salesValue = sales.value;
	const show = document.getElementById('input-sales');

	if(salesValue.length){
		show.style.display = 'none';
	}else if(!isTyping){
		show.style.display = 'flex';
	}
}

// 홈페이지 주소 필수입력
const validateHompage = (isTyping) => {
	const homepageValue = homepage.value;
	const show = document.getElementById('input-homepage');

	if(homepageValue.length){
		show.style.display = 'none';
	}else if(!isTyping){
		show.style.display = 'flex';
	}
}

// 회사 로고 필수입력
const validateLogo = (isTyping) => {
	const logoValue = logo.value;
	const show = document.getElementById('input-logo');

	if(logoValue.length){
		show.style.display = 'none';
	}else if(!isTyping){
		show.style.display = 'flex';
	}
}

// 회사 대표이미지 필수 입력
const validateThumb = (isTyping) => {
	const thumbValue = thumb.value; 
	const show = document.getElementById('input-tumb');

	if(thumbValue.length){
		show.style.display = 'none';
	}else if(!isTyping){
		show.style.display = 'flex';
	}
}

// 회사 로고 업로드 시 미리보기
function uploadLogo(input){
	const show = document.getElementById('logo-upload');

	if(input.files && input.files[0] ){
		const reader = new FileReader();
		reader.onload = function(e){
			document.getElementById('logo-upload').src = e.target.result;
			show.style.display = 'flex';
		}
		reader.readAsDataURL(input.files[0]);
	}
	validateLogo();
}

// 회사 대표 이미지 업로드 시 미리보기
function uploadImg(input){
	const show = document.getElementById('img-upload');

	if(input.files && input.files[0]){
		const reader = new FileReader();
		reader.onload = function(e){
			document.getElementById('img-upload').src = e.target.result;
			show.style.display = 'flex';
		}
		reader.readAsDataURL(input.files[0]);
	}
}

// 주소 api
function searchArr() {
  new daum.Postcode({
		oncomplete: function(data) {
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
				if(data.userSelectedType === 'R'){
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if(data.buildingName !== '' && data.apartment === 'Y'){
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if(extraAddr !== ''){
								extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("address").value = extraAddr;
				} 

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("address").value = addr || data.jibunAddress;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
		}
  }).open();
}
