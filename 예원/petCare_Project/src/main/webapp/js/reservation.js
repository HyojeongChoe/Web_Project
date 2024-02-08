// 예약페이지/예약 가능한 시간과 각 시간에 대한 가격을 정의
let timePrices = {
	'60분': 25000,
	'120분': 45000,
	'180분': 60000,
	'전체미용': 50000,
	'위생미용': 40000
};

// 옵션 선택이 변경될 때 호출되는 함수
document.getElementById('option').addEventListener('change', function() {
	// 선택된 시간 가져오기
	let selectedTime = this.value;

	// 선택된 시간에 해당하는 가격 가져오기
	let selectedPrice = timePrices[selectedTime];

	// 가격을 화면에 표시
	document.getElementById('priceDisplay').innerText = selectedPrice + '원';

	// 선택된 가격을 hidden input에 설정
	document.getElementById('selectedPrice').value = selectedPrice;
});

//예약페이지
// 각 필드에 빈 값 있을 시 함수 호출
function validateReserveForm() {
	let serviceType = document.getElementById("service_type").value;
	let petType = document.getElementById("pet_type").selectedIndex; // selectedIndex 사용
	let groomingOption = document.getElementById("option").selectedIndex; // selectedIndex 사용
	let reservationDate = document.getElementById("date").value;

	// 필드를 배열로 모음
	let fields = [serviceType, petType, groomingOption, reservationDate];

	// 어떤 필드라도 비어 있는지 확인
	for (let i = 0; i < fields.length; i++) {
		if (i === 0 && !fields[i].trim()) { // serviceType은 trim() 사용할 필요 없음
			alert("서비스를 선택하세요.");
			document.getElementById("service_type").focus();
			return false;
		} else if (!fields[i]) { // selectedIndex 값이 0이 아닌 경우를 확인
			alert("정보를 입력하세요.");
			if (i === 1) { // petType 필드일 경우
				document.getElementById("pet_type").focus();
			} else if (i === 2) { // Option 필드일 경우
				document.getElementById("option").focus();
			} else { // reservationDate 필드일 경우
				document.getElementById("date").focus();
			}
			return false;
		}
	}
	return true;
}
