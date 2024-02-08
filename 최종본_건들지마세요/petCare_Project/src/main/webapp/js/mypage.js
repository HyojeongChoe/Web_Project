//마이페이지 개인정보 수정버튼 눌렀을 때
function showSuccessMessage() {
	alert("수정되었습니다."); // 또는 원하는 형태로 메시지 표시
}


/* 예약내역 테이블 체크박스 관련 */
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
