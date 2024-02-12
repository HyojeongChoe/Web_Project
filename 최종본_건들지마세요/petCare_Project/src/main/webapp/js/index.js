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
//Store.jsp로
function goToStore() {
	window.location.href = "Store.jsp";
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

/* 예원 추가 부분 시작 ↓↓↓ */
/* 홈 화면 바로가기 버튼 기능 */
var goToMain = function() {
	$('.js-gotomain').on('click', function(event) {
		event.preventDefault();

		// 여기서 'index.jsp'는 이동하고자 하는 페이지의 경로로 수정하세요.
		var destination = 'index.jsp';

		// 해당 페이지로 스크롤 애니메이션 적용
		$('html, body').animate({
			scrollTop: $(destination).offset().top
		}, 500);

		return false;
	});
};

/* 홈 화면 바로가기 버튼 나타나기 효과(Home, About, store) */
document.addEventListener('DOMContentLoaded', function() {	// 페이지 로딩 시에 이벤트 리스너 등록
	// 홈 화면 바로가기 버튼 요소 가져오기
	var goToMainButton = document.querySelector('.js-gotomain');

	// 스크롤 이벤트 리스너 등록
	window.addEventListener('scroll', function() {
		// 현재 스크롤 위치 가져오기
		var scrollY = window.scrollY || window.pageYOffset;

		// 스크롤 위치가 일정 이상이면 버튼 표시, 아니면 숨김
		if (scrollY > 100) {  // 스크롤 100px 이상으로 이동했을 때
			goToMainButton.style.opacity = 1;
		} else {
			goToMainButton.style.opacity = 0;
		}
	});

	// 페이지 로딩 시 초기 상태로 숨김
	goToMainButton.style.opacity = 0;
});
/* 홈 화면 바로가기 버튼 나타나기 효과(Service) */
document.addEventListener('DOMContentLoaded', function() {
	var goToMainButton = document.querySelector('.js-gotomain_service');

	// 페이지 로딩 시 초기 상태로 표시
	if (goToMainButton) {
		goToMainButton.style.opacity = 1;
	}
});

/* 예원 추가 부분 끝 ↑↑↑ */

//slideshow
let prev_btn = document.getElementById('prev');
let next_btn = document.getElementById('next');
let imgs = document.querySelectorAll('#slides img');
let img_num = 0;

if (imgs.length > 0) { // 이미지가 있는 경우에만 실행
	showimg(img_num);

	prev_btn.onclick = function() {
		img_num--;
		if (img_num < 0) {
			img_num = 3;
		}
		showimg(img_num)
	};

	next_btn.onclick = function() {
		img_num++;
		if (img_num > 3) {
			img_num = 0;
		}
		showimg(img_num)
	};

	// 이미지를 자동으로 변경
	setInterval(function() {
		img_num++;
		if (img_num > 3) {
			img_num = 0;
		}
		showimg(img_num);
	}, 2500);
}

function showimg(n) {
	for (let i = 0; i < imgs.length; i++) {
		imgs[i].style.display = "none";
	}
	imgs[n].style.display = "block";
}