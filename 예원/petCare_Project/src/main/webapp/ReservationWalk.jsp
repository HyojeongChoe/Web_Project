<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.kb.petcare.Session.sessionManager"%>

<%
String loggedInUserId = sessionManager.getLoggedInUserId(request);
%>


<!DOCTYPE html>
<html class="no-js">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>산책예약</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,400italic,700italic|Merriweather:300,400italic,300italic,400,700italic'
	rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Simple Line Icons -->
<link rel="stylesheet" href="css/simple-line-icons.css">
<!-- Datetimepicker -->
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
<!-- Flexslider -->
<link rel="stylesheet" href="css/flexslider.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">


<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->


<style>
#message {
	margin-top: 15px;
	width: 555px;
	resize: none; /*크기 조절 비활성화*/
}
</style>
</head>

<body>
	<div id="fh5co-header">
		<div class="js-sticky">
			<div class="fh5co-main-nav">
				<div id="header">
					<div class="top_util">
						<ul class="menu_list" id="menu_list_header">
							<!-- 세션에 로그인된 사용자 ID가 있는지 확인하고 동적으로 로그인 또는 로그아웃 표시 -->
							<%
							if (loggedInUserId == null || loggedInUserId.equals("")) {
							%>
							<!-- 로그인 상태가 아닌 경우 -->
							<li class="join"><a href="#" id="loginButton"
								style="background-color: white; border: 0;"
								onclick="openSignUpPage()">SignUp</a></li>
							<li class="login"><a href="#" id="loginButton"
								style="background-color: white; border: 0;"
								onclick="openLoginPage()">Login</a></li>
							<%
							} else {
							%>
							<!-- 로그인 상태인 경우 -->
							<li class="logout"><a href="#" id="logoutButton"
								style="background-color: white; border: 0;"
								onclick="performLogout()">Logout</a></li>
							<li class="mypage"><a href="#" id="mypageButton"
								style="background-color: white; border: 0;"
								onclick="openMyPageReserve()">MyPage</a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
				<div class="container-fluid">
					<div class="fh5co-menu-1">
						<a href="#" onclick="goToIndex()">Home</a> <a href="#"
							onclick="goToAbout()">About</a>
					</div>
					<div class="fh5co-logo">
						<a href="#" onclick="goToIndex()">foodee</a>
					</div>
					<div class="fh5co-menu-2">
						<a href="#" onclick="goToService()">Service</a> <a href="#"
							onclick="goToReservation()">Community</a>
						<!-- 수정필요. -->
						>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="fh5co-container">
		<div id="fh5co-contact" data-section="reservation">
			<div class="container">
				<div class="row text-center fh5co-heading row-padded">
					<div class="col-md-8 col-md-offset-2">
						<h2 class="heading to-animate">산책</h2>
						<p class="sub-heading to-animate">산책상세내용</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 to-animate-2">
						<h3></h3>
						<ul class="fh5co-contact-info">
							<div class="item _item">
								<img
									style="width: 100%; max-width: 555px; height: auto; display: block; margin: 0 auto; image-rendering: -moz-crisp-edges; image-rendering: -o-crisp-edges; image-rendering: -webkit-optimize-contrast; image-rendering: crisp-edges;"
									src="https://cdn.imweb.me/thumbnail/20221027/3f1e6e9249fa2.jpg"
									alt="">
							</div>
						</ul>
					</div>

					<form id="reserveForm" action="reserve1.do">
						<div class="col-md-6 to-animate-2">
							<h3>예약</h3>
							<div class="form-group ">
								<label for="service_type" class="sr-only">서비스</label> <input
									name="service" id="service_type" class="form-control"
									type="text" value="산책" readonly>
							</div>
							<div class="form-group">
								<label for="pet_type" class="sr-only">견종</label> <select
									class="form-control" name="pet" id="pet_type">
									<option selected disabled hidden>반려동물을 선택해주세요</option>
									<option>소/중형견</option>
									<option>대형견</option>
									<option>고양이</option>
								</select>
							</div>
							<div class="form-group">
								<label for="time" class="sr-only">시간</label> <select
									class="form-control" name="time" id="option">
									<option selected disabled hidden>시간</option>
									<option value="60분">60분</option>
									<option value="120분">120분</option>
									<option value="180분">180분</option>
								</select>
							</div>
							<div>
								<label for="date" class="sr-only">예약날짜</label> <input
									name="date" id="date" class="form-control" placeholder="예약날짜"
									type="date">
							</div>

							<div class="form-group ">
								<label for="message" class="sr-only">기타 문의사항</label> <input
									name="message" id="message" class="form-control"
									placeholder="기타 문의사항"></input>
							</div>

							<!-- 메세지 아래에 가격을 표시할 div 추가 -->
							<div>총 이용금액</div>
							<div id="priceDisplay" name="cost" class="form-group"></div>
							<input type="hidden" id="selectedPrice" name="selectedPrice"
								value="">
							<div class="form-group ">
								<input class="btn btn-primary" value="예약하기" type="submit">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div id="fh5co-footer">
		<div class="container">
			<div class="row row-padded">
				<div class="col-md-12 text-center">
					Shared by <i class="fa fa-love"></i><a
						href="https://bootstrapthemes.co">BootstrapThemes</a>
					<p class="text-center to-animate">
						<a href="#" class="js-gotop">Go To Top</a>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<ul class="fh5co-social">
						<li class="to-animate-2"><a href="#"><i
								class="icon-facebook"></i></a></li>
						<li class="to-animate-2"><a href="#"><i
								class="icon-twitter"></i></a></li>
						<li class="to-animate-2"><a href="#"><i
								class="icon-instagram"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/index.js"></script>
	<!-- reservation.js -->
	<script src="js/reservation.js"></script>
	<script>
		// loggedInUserId를 JavaScript 변수에 할당
		const loggedInUserId = "<%= loggedInUserId %>";
	</script>

	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Bootstrap DateTimePicker -->
	<script src="js/moment.js"></script>
	<script src="js/bootstrap-datetimepicker.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Main JS -->
	<script src="js/main.js"></script>
</body>

</html>