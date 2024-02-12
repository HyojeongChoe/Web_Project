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
<title>돌봄예약</title>
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
<link rel="stylesheet" href="css/bootstrap.css">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/index.css">


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
							<li class="join"><a href="#" id="JoinButton"
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
						<a href="#" onclick="goToIndex()">멍뚱냥뚱</a>
					</div>
					<div class="fh5co-menu-2">
						<a href="#" onclick="goToService()">Service</a> <a href="#"
							onclick="goToStore()">Store</a>
						<!-- 수정필요. -->
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
						<h2 class="heading to-animate">
						<img src = "images/free-icon-pet-care-8182996.png" class = "carepet"/></h2>	
						<p class="sub-heading to-animate" id = "care">돌봄 서비스</p>
						<span class="sub-heading to-animate" id = "carewrite">전문 펫 매니저와 즐거운 돌봄</span> <br>
						<span class="sub-heading to-animate" id = "carewrite2">배변 및 환경 정리, 주변 정리, 약 주기, 밥 챙겨주기(반려견 맞춤 배식), 실내놀이 등 
						</span> <br>
											
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 to-animate-2">
						<h3></h3>
						<ul class="fh5co-contact-info">
							<div class="item _item">
								<img
									style="width: 100%; max-width: 555px; height: auto; display: block; margin: 0 auto; image-rendering: -moz-crisp-edges; image-rendering: -o-crisp-edges; image-rendering: -webkit-optimize-contrast; image-rendering: crisp-edges;"
									src="https://cdn.imweb.me/thumbnail/20221027/aec92576af3b0.jpg"
									alt="">
							</div>
						</ul>
					</div>
					<form onsubmit="return validateReserveForm();" action="reserve1.do">
						<div class="col-md-6 to-animate-2">
							<h3>예약</h3>
							<div class="form-group ">
								<label for="service_type" class="sr-only">서비스</label> <input
									name="service" id="service_type" class="form-control"
									type="text" value="돌봄" readonly>
							</div>
							<div class="form-group">
								<label for="pet_type" class="sr-only">견종</label> <select
									class="form-control" name="pet" id="pet_type">
									<option selected disabled hidden>반려동물을 선택해주세요</option>
									<option value="소/중형견">소/중형견</option>
									<option value="대형견">대형견</option>
									<option value="고양이">고양이</option>
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

	<!-- 푸터푸터 영역 시작 -->
	<div id="fh5co-footer">
		<div class="container">

			<!-- 글자 영역 1 -->
			<div class="row row-footer-padded">
				<div class="col-md-12 text-center">
					<p id="footer_p" style="font-size: 14px;">
						(주)멍뚱냥뚱 대표이사: 최효정<strong>ㅣ</strong> 대구광역시 동구 동부로 121 (신천동), 6층
						602호&nbsp;
					</p>
					<p id="footer_p" style="font-size: 14px;">
						사업자등록번호: 123-45-67890 <strong>ㅣ</strong> <strong>대표번호:
							0507-1482-7755&nbsp;</strong>
					</p>
					<p id="footer_p" style="line-height: 1.5;">(주)멍뚱냥뚱의 모든 콘텐츠는(영상,
						사진 등) 저작권법의 보호를 받는 바 무단 전재, 복사, 배포 등을 금합니다.</p>

					<!-- 링크 영역 -->
					<div class="footer-link-main">
						<!-- 멍뚱냥뚱 홈 화면 바로가기 -->
						<p id="footer_p" style="display: flex; align-items: center;">
							<strong> <a href="index.jsp" class="js-gotomain_service">
									홈 화면<br />바로가기
							</a>
							</strong>
						</p>
					</div>
					<!-- 깃허브 아이콘 -->
					<ul class="fh5co-social">
						<li class="to-animate-2"><a
							href="https://github.com/HyojeongChoe/Web_Project"
							target="_blank"> <i class="icon-github"></i></a></li>
						<li class="to-animate-2"><a
							href="https://www.youtube.com/@xenoint" target="_blank"> <i
								class="icon-youtube"></i></a></li>
					</ul>
				</div>
			</div>

			<div>
				<hr>
			</div>

			<!-- 글자 영역 2 -->
			<div class="col-md-12 text-center">
				<div class="" style="font-size: 12px;">Copyright ⓒ 2024 멍뚱냥뚱
					반려동물 돌봄 산책 미용 서비스 All rights reserved.</div>
			</div>

		</div>
	</div>
	<!-- 푸터푸터 영역 끝 -->
	<script src="js/index.js"></script>
	<script src="js/reservation.js"></script>

	<!-- jQuery -->
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