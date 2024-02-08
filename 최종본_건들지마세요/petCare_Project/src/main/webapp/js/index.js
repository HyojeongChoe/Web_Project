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
	/*    event.preventDefault();*/
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
//마이페이지 탈회
function openMyPageEdit() {
	window.location.href = "MyPageDelete.jsp";
}
function performLogout() {

	var confirmLogout = confirm("로그아웃하시겠습니까?");
	if (confirmLogout) {
		location.href = "logout.do"; // 로그아웃 처리를 수행하는 서블릿 매핑 경로로 수정
	}
}


//slideshow
let prev_btn = document.getElementById('prev');
let next_btn = document.getElementById('next');
let imgs = document.querySelectorAll('#slides img');
let img_num = 0;
showimg(img_num);

prev_btn.onclick = function() {
	img_num--;
	if (img_num < 0) {
		img_num = 3;
	}
	showimg(img_num)
}
next_btn.onclick = function() {
	img_num++;
	if (img_num > 3) {
		img_num = 0;
	}
	showimg(img_num)
}
function showimg(n) {
	for (let i = 0; i < imgs.length; i++) {
		imgs[i].style.display = "none";
	}
	imgs[n].style.display = "block"
}
setInterval(prev_btn.onclick, 2500);
