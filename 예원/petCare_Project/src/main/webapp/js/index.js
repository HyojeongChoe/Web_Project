//index.jsp / Home.jsp로
function goToIndex() {
	window.location.href = "index.jsp";
}
//About.jsp
function goToAbout() {
	window.location.href = "About.jsp";
}
//Service.jsp로
function goToService() {
	window.location.href = "Service.jsp";
}
//Comunity.jsp로
function goToCommunity() {
	window.location.href = "Community.jsp";
}
//Reservation.jsp로(예약페이지 다 만들고 삭제해야함)
function goToReservation() {
	window.location.href = "Reservation.jsp";
}
//ReservationCare.jsp로
function goToCare() {
	window.location.href = "ReservationCare.jsp";
	// 기본 동작 막기
	event.preventDefault();
}
//ReservationGrooming.jsp
function goToGrooming() {
	window.location.href = "ReservationGrooming.jsp";
}
//ReservationWalk.jsp
function goToWalk() {
	window.location.href = "ReservationWalk.jsp";
}
//회원가입 페이지로
function openSignUpPage() {
	window.location.href = "SignUp.jsp";
}
//로그인 페이지로
function openLoginPage() {
	window.location.href = "Login.jsp";
}
//마이페이지 예약내역
function openMyPageReserve() {
	window.location.href = "select.do";
}
//마이페이지 비밀번호입력
function openMyPagePw() {
	window.location.href = "MyPagePw.jsp";
}
//마이페이지 개인정보 수정
function openMyPageEdit() {
	window.location.href = "MyPageEdit.jsp";
}
//마이페이 탈회
function openMyPageEdit() {
	window.location.href = "MyPageDelete.jsp";
}
function performLogout() {

	var confirmLogout = confirm("로그아웃하시겠습니까?");
	if (confirmLogout) {
		location.href = "logout.do"; // 로그아웃 처리를 수행하는 서블릿 매핑 경로로 수정
	}
}

/* 예원 추가 부분 시작 ↓↓↓ */
document.addEventListener("DOMContentLoaded", function() {
	// 예약 내역 테이블의 모든 행을 가져오기
	var rows = document.querySelectorAll(".reservation_table tbody tr");

	// 각 행에 클릭 이벤트 추가
	rows.forEach(function(row) {
		row.addEventListener("click", function() {
			// 현재 행의 체크박스 요소 가져오기
			var checkbox = row.querySelector("input[type='checkbox']");

			// 체크박스의 상태를 변경 (체크 <-> 해제)
			checkbox.checked = !checkbox.checked;
		});
	});
});

$(document).ready(function() {
	// 예약 취소하기 버튼 클릭 이벤트 처리
	$("#cancelReservationBtn").click(function() {
		// 선택된 예약의 체크박스 가져오기
		var selectedReservations = $("input[name='reserve_checkbox']:checked");

		if (selectedReservations.length > 0) {
			// 선택된 예약이 있는 경우

			// 선택된 예약 정보를 담을 배열
			var selectedReservationsArray = [];

			// 각 체크된 예약의 정보를 배열에 추가
			selectedReservations.each(function() {
				var reservationInfo = {
					date: $(this).closest("tr").find("td:eq(1)").text(),
					service: $(this).closest("tr").find("td:eq(2)").text(),
					time: $(this).closest("tr").find("td:eq(3)").text(),
					grooming: $(this).closest("tr").find("td:eq(4)").text(),
					pet: $(this).closest("tr").find("td:eq(5)").text(),
					cost: $(this).closest("tr").find("td:eq(6)").text()
				};
				selectedReservationsArray.push(reservationInfo);
			});

			// AJAX를 사용하여 서버로 선택된 예약 정보 전송
			$.ajax({
				type: "POST",
				url: "/deleteReserve.do", // 수정 필요
				data: {
					selectedReservations: JSON.stringify(selectedReservationsArray)
				},
				success: function(response) {
					// 예약 취소 결과 메시지를 표시
					$("#cancelResultMessage").text(response);
					// 예약 취소 후 페이지 새로고침 또는 다른 동작 수행을 원하면 추가적인 처리가 필요합니다.
				},
				error: function(error) {
					console.log("Error:", error);
				}
			});

		} else {
			// 선택된 예약이 없는 경우 메시지 표시
			$("#cancelResultMessage").text("취소할 예약을 선택해주세요.");
		}
	});
});
/* 예원 추가 부분 끝 ↑↑↑ */


