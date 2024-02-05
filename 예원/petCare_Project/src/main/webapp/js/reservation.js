// 예약 가능한 시간과 각 시간에 대한 가격을 정의
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