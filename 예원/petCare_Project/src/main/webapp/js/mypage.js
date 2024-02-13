//마이페이지 개인정보 수정버튼 눌렀을 때
function showSuccessMessage() {
	alert("수정되었습니다."); // 또는 원하는 형태로 메시지 표시
}

/* 현재 날짜를 구하는 함수 */
function getCurrentDate() {
	var now = new Date();
	now.setHours(0, 0, 0, 0); // 시간은 상관 없으므로 전부 0으로 설정
	return now;
}

/* 예약내역 테이블 체크박스 관련 */
/* 체크박스를 여러 개 선택하고 삭제 버튼을 눌렀을 때, 선택된 예약 정보를 서버로 어떻게 전송할 것인지에 대한 로직 */
function deleteSelectedReservations() {
	var checkboxes = document
		.querySelectorAll('.reserve_checkbox:checked');
	var selectedReservations = []; // 정보(내역) 담을 배열
	var currentDate = getCurrentDate(); // 현재 날짜 가져오기
	var containsInvalidReservation = false; // 예약 날짜 조건(이틀 여유)

	checkboxes.forEach(function(checkbox) {
		var reservation = {
			date: checkbox.dataset.date,
			service: checkbox.dataset.service,
			time: checkbox.dataset.time,
			grooming: checkbox.dataset.grooming,
			pet: checkbox.dataset.pet,
			cost: checkbox.dataset.cost
		};

		// 예약 날짜와 현재 날짜를 비교하여 이미 지난 예약인지 확인
		var reservationDate = new Date(reservation.date);

		if (reservationDate < currentDate) {
			// 이미 지난 예약일 경우
			containsInvalidReservation = true;
		} else {
			// 예약 날짜와 현재 날짜를 비교하여 이틀 이상 여유가 있는지 확인
			var twoDaysLater = new Date();
			twoDaysLater.setDate(twoDaysLater.getDate() + 2);

			if (reservationDate < twoDaysLater) {
				// 예약 날짜가 이틀 이상 여유가 없는 경우
				containsInvalidReservation = true;
			} else {
				// 예약 날짜가 이틀 이상 여유가 있는 경우(삭제 진행)
				selectedReservations.push(reservation);
			}
		}
	});

	if (containsInvalidReservation) {
		// 이미 지난 내역이거나 && 이틀 이상 여유가 없는 내역일 경우 알림창
		alert('취소할 수 없는 내역이 포함되어 있습니다.');
	} else if (selectedReservations.length > 0) {
		// 배열에 정보가 담겼다면(길이가 0초과라면)
		// Ajax를 사용하여 서버로 선택된 예약 정보 전송
		var xhr = new XMLHttpRequest();
		xhr.open('POST', 'deleteReserve.do', true);
		xhr.setRequestHeader('Content-Type', 'application/json');
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					// 서버 응답이 성공인 경우
					window.location.reload(); // 페이지 새로고침
					alert('예약을 취소하였습니다.');
				} else {
					// 서버 응답이 실패인 경우
					alert('예약 취소에 실패했습니다.');
				}
			}
		};
		xhr.send(JSON.stringify(selectedReservations));
	} else {
		// 선택된 예약이 없는 경우
		alert('취소할 예약을 선택해주세요.');
	}
}

/* 행 클릭했을 때 체크박스 체크는 되는데, 정작 체크박스를 누르면 체크가 되지 않아서 */
document.addEventListener("DOMContentLoaded", function() {
	// 예약 내역 테이블의 모든 행을 가져오기
	var rows = document.querySelectorAll(".reservation_table tbody tr");

	// 각 행에 클릭 이벤트 추가
	rows.forEach(function(row) {
		row.addEventListener("click", function(event) {
			// 클릭된 요소가 체크박스인 경우 이벤트 전파를 막음
			if (event.target.tagName.toLowerCase() !== 'input') {
				// 현재 행의 체크박스 요소 가져오기
				var checkbox = row.querySelector("input[type='checkbox']");

				// 체크박스의 상태를 변경 (체크 <-> 해제)
				checkbox.checked = !checkbox.checked;
			}
		});
	});
});

/* "전체 선택" 체크박스 눌렀을 때, 모든 체크박스가 체크되도록 */
document.getElementById('selectAllCheckbox').addEventListener('click', function() {
	var checkboxes = document.querySelectorAll('.reserve_checkbox');

	checkboxes.forEach(function(checkbox) {
		checkbox.checked = document.getElementById('selectAllCheckbox').checked;
	});
});

/* "전체 선택" 체크박스 눌렀을 때, 어느 하나의 항목이라도 제외했을 경우 초기화 */
document.querySelectorAll('.reserve_checkbox').forEach(function(checkbox) {
	checkbox.addEventListener('click', function() {
		var checkboxes = document.querySelectorAll('.reserve_checkbox');
		var allChecked = true;

		checkboxes.forEach(function(checkbox) {
			if (!checkbox.checked) {
				allChecked = false;
			}
		});

		document.getElementById('selectAllCheckbox').checked = allChecked;
	});
});


