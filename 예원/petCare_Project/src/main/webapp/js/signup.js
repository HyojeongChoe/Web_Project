function sample6_execDaumPostcode() {
	new daum.Postcode(
		{
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				let addr = ''; // 주소 변수
				let extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
						&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
						&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress")
					.focus();
			}
		}).open();
}

// select 요소의 값이 변경될 때 호출되는 함수
function updateEmail2() {
	let email2Input = document.getElementById("email2");
	let domainSelect = document.getElementById("domainSelect");

	// 선택된 값이 "직접입력"인 경우에만 텍스트 입력을 활성화하고, 아니면 값을 설정
	if (domainSelect.value === "직접입력") {
		email2Input.value = "";
		email2Input.disabled = false; // 텍스트 입력 활성화
	} else {
		email2Input.value = domainSelect.value;
		email2Input.disabled = true; // 텍스트 입력 비활성화
	}
	checkEmail(); // 이메일 유효성 검사도 onchange시 실행하기 위해 
}
// select 요소의 변경 이벤트에 updateEmail2 함수를 연결
document.getElementById("domainSelect").addEventListener("change", updateEmail2);	//js로 호출
//각 필드에 빈 값 있을 시 함수 호출
function validateForm() {
	let id = document.getElementById("id");
	let pw = document.getElementById("pw");
	let pwConfirm = document.getElementById("pw_confirm");
	let name = document.getElementById("name");
	let postcode = document.getElementById("sample6_postcode");
	let address = document.getElementById("sample6_address");
	let detailAddress = document.getElementById("sample6_detailAddress");
	let mobile2 = document.getElementById("mobile2");
	let mobile3 = document.getElementById("mobile3");
	let email1 = document.getElementById("email1");
	let email2 = document.getElementById("email2");

	// 필드를 배열로 모음
	let fields = [id, pw, pwConfirm, name, postcode, address,
		detailAddress, mobile2, mobile3, email1, email2];

	// 어떤 필드라도 비어 있는지 확인
	for (let i = 0; i < fields.length; i++) {
		if (!fields[i].value.trim()) {
			alert("정보를 입력하세요.");
			fields[i].focus(); // 빈 필드로 포커스 이동
			return false;
		}
	}

	// 여기서 추가: 폼이 유효하다면 알림 표시
	alert("회원가입이 완료되었습니다!");

	return true;
}
//id 유효성 검사 함수
function checkId() {
	let idInput = document.getElementById("id");
	let idError = document.getElementById("idError");

	// 아이디가 비어있는지 검사
	if (!idInput.value.trim()) {
		idError.style.color = "red";
		idError.innerText = "아이디를 입력하세요.";
		return;
	}

	// 아이디 형식 검사 (영문 소문자와 숫자, 4글자 이상)
	let regex = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,}$/;

	if (!regex.test(idInput.value)) {
		idError.style.color = "red";
		idError.innerText = "아이디는 영문 소문자와 숫자를 조합하여 4글자 이상이어야 합니다.";
	} else {
		idError.innerText = "";
	}
}

// id 중복 확인 검사
function checkDuplicateId() {
    let idInput = document.getElementById("id");
    let idError = document.getElementById("idError");

    // 아이디가 비어있는지 확인
    if (!idInput.value.trim()) {
		idError.style.color = "red";
        idError.innerText = "아이디를 입력하세요.";
        return;
    }

    // 서버로 중복 확인 요청
    fetch("checkDuplicateId.do?id=" + idInput.value)
        .then(response => response.json())
        .then(data => {
            if (data.duplicate) {
				idError.style.color = "red";
                idError.innerText = "이미 사용 중인 아이디입니다.";
            } else {
				idError.style.color = "blue";
                idError.innerText = "사용 가능한 아이디입니다.";
            }
        })
        .catch(error => {
            console.error("Error checking duplicate id:", error);
            idError.style.color = "red";
            idError.innerText = "아이디 중복 확인 중 오류가 발생했습니다.";
        });
}

// 비밀번호 유효성 검사 함수
function checkPassword() {
	let pw = document.getElementById("pw").value;
	let pwConfirm = document.getElementById("pw_confirm").value;
	let pwError = document.getElementById("pwError");
	let pwConfirmError = document.getElementById("pwConfirmError");

	// 비밀번호가 조건을 만족하는지 검사
	let regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;

	if (!regex.test(pw)) {
		pwError.innerText = "비밀번호는 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합, 8자~16자여야 합니다.";
	} else {
		pwError.innerText = "";
	}

	// 비밀번호 확인 일치 여부 검사
	if (pw !== pwConfirm) {
		pwConfirmError.innerText = "비밀번호가 일치하지 않습니다.";
	} else {
		pwConfirmError.innerText = "";
	}
}
//주소 유효성 검사 함수
function checkAddress() {
	let postcodeInput = document.getElementById("sample6_postcode");
	let addressInput = document.getElementById("sample6_address");
	let detailAddressInput = document
		.getElementById("sample6_detailAddress");
	let addressError = document.getElementById("addressError");

	// 필수 항목이 비어있는지 확인
	if (!postcodeInput.value.trim() || !addressInput.value.trim()) {
		addressError.innerText = "주소를 모두 입력하세요.";
		return;
	}

	// 상세주소가 공백인지 확인
	if (!detailAddressInput.value.trim()) {
		addressError.innerText = "상세주소를 입력하세요.";
		return;
	}
	// 모든 검사를 통과했을 경우 오류 메시지 초기화
	addressError.innerText = "";
}
// 이메일 유효성 검사 함수
function checkEmail() {
	let email1 = document.getElementById("email1").value;
	let email2 = document.getElementById("email2").value;
	let atSign = "@";
	let emailError = document.getElementById("emailError");

	// 이메일이 비어있지 않은지 검사
	if (!email1 || !email2) {
		emailError.innerText = "이메일을 입력하세요.";
		return;
	}

	// 이메일 형식 검사
	let regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

	if (!regex.test(email1 + atSign + email2)) {
		emailError.innerText = "이메일 형식이 올바르지 않습니다.";
	} else {
		emailError.innerText = "";
	}
}
//휴대전화 유효성 검사
function checkMobile() {
	let mobile2 = document.getElementById("mobile2").value;
	let mobile3 = document.getElementById("mobile3").value;
	let mobileError = document.getElementById("mobileError");

	// 휴대전화 번호가 비어있는지 검사
	if (!mobile2 || !mobile3) {
		mobileError.innerText = "휴대전화 번호를 입력하세요.";
		return;
	}

	// 휴대전화 번호 형식 검사
	let regex = /^\d{4}$/; // 4자리의 숫자로 이루어져 있는지 확인

	if (!regex.test(mobile2) || !regex.test(mobile3)) {
		mobileError.innerText = "휴대전화 번호는 4자리의 숫자여야 합니다.";
	} else {
		mobileError.innerText = "";
	}
}
//생년월일 유효성 검사 스크립트
function checkBirth() {
	let birthInput = document.getElementById("birth");
	let birthError = document.getElementById("birthError");

	// 생년월일이 비어있는지 확인
	if (!birthInput.value.trim()) {
		birthError.innerText = "생년월일을 입력하세요.";
		return;
	}

	// 현재 날짜 가져오기
	let currentDate = new Date();

	// 입력된 날짜 가져오기
	let selectedDate = new Date(birthInput.value);

	// 입력된 날짜가 현재 날짜보다 크다면 유효
	if (selectedDate > currentDate) {
		birthError.innerText = "유효하지 않은 생년월일입니다.";
		return;
	}

	// 모든 검사를 통과했을 경우 오류 메시지 초기화
	birthError.innerText = "";
}
