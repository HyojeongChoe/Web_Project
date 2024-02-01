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
function performLogout() {
	// 여기에 로그아웃 처리 로직을 추가할 수 있습니다.
	// 예를 들어, AJAX 요청을 사용하여 서버에 로그아웃 요청을 보낼 수 있습니다.
	// 또는 간단하게 location.href를 사용하여 로그아웃 링크로 이동할 수도 있습니다.

	// 아래는 간단한 예시입니다.
	var confirmLogout = confirm("로그아웃하시겠습니까?");
	if (confirmLogout) {
		location.href = "logout.do"; // 로그아웃 처리를 수행하는 서블릿 매핑 경로로 수정
	}
}