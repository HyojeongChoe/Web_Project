//index.jsp / Home.jsp로
function goToIndex() {
	window.location.href = "index.jsp";
}
//About.jsp
function goToAbout() {
	window.location.href = "About.jsp";
}
//Features.jsp로
function goToFeatures() {
	window.location.href = "Features.jsp";
}
//Comunity.jsp로
function goToCommunity() {
	window.location.href = "Community.jsp";
}
//Reservation.jsp로
function goToReservation() {
	window.location.href = "Reservation.jsp";
}

//회원가입 페이지로
function openSignUpPage() {
	window.location.href = "SignUp.jsp";
}

//로그인 페이지로
function openLoginPage() {
	window.location.href = "Login.jsp";
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