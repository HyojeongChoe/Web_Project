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

// 비로그인 시 예약하기 불가능
document.addEventListener('DOMContentLoaded', function () {
    const reserveForm = document.getElementById('reserveForm');
    console.log("예약막기(세션id값) :: " + loggedInUserId);

    reserveForm.addEventListener('submit', function (event) {
        if (!isLoggedIn(loggedInUserId)) {
            // 로그인되지 않은 경우 알림 표시
            alert('로그인이 필요한 서비스입니다.');
            // 이벤트 중단 (폼 전송 취소)
            event.preventDefault();
        }
    });

    // 로그인 상태 확인 함수
    function isLoggedIn(userId) {
        // 여기에 로그인 상태 확인하는 코드를 추가할 수 있습니다.
        // 예를 들어, 세션에 로그인 정보가 있는지 등을 확인합니다.
        return userId != null && userId !== "" && userId !== "null";
    }
});