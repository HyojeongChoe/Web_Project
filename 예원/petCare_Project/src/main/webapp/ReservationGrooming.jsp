<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<title>예약</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
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

<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,400italic,700italic|Merriweather:300,400italic,300italic,400,700italic' rel='stylesheet' type='text/css'>

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
							<li class="join"><a href="#" id="loginButton" style="background-color: white; border: 0;" onclick="openSignUpPage()">SignUp</a></li>
							<li class="login"><a href="#" id="loginButton" style="background-color: white; border: 0;" onclick="openLoginPage()">Login</a></li>
							<%
							} else {
							%>
							<!-- 로그인 상태인 경우 -->
							<li class="logout"><a href="#" id="logoutButton" style="background-color: white; border: 0;" onclick="performLogout()">Logout</a></li>
							<li class="mypage"><a href="#" id="mypageButton" style="background-color: white; border: 0;" onclick="openMyPage1()">MyPage</a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
				<div class="container-fluid">
					<div class="fh5co-menu-1">
						<a href="#" onclick="goToIndex()">Home</a>
						<a href="#" onclick="goToAbout()">About</a>
					</div>
					<div class="fh5co-logo">
						<a href="#" onclick="goToIndex()">foodee</a>
					</div>
					<div class="fh5co-menu-2">
						<a href="#" onclick="goToService()">Service</a>
						<a href="#" onclick="goToReservation()">Community</a>
						<!-- 수정필요. -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 상단 안내문 -->
	<div id="fh5co-container">
		<div id="fh5co-contact" data-section="reservation">
			<div class="container">
				<div class="row text-center fh5co-heading row-padded">
					<div class="col-md-8 col-md-offset-2">
						<h2 class="heading to-animate">Reserve a 미용</h2>
						<p class="sub-heading to-animate">바꾸이세</p>
					</div>
				</div>
				<div class="row">

					<!-- 내용(좌측) -->
					<div class="col-md-6 to-animate-2">
						<h3>이미지 자리</h3>
						<img style="image-rendering: -moz-crisp-edges; image-rendering: -o-crisp-edges; image-rendering: -webkit-optimize-contrast; image-rendering: crisp-edges;" src="https://cdn.imweb.me/thumbnail/20211206/a89e134bb8a94.jpg" alt="">
					</div>

					<!-- 내용(우측) -->
					<form action="reserve.do">						
						<div class="col-md-6 to-animate-2">
							<h2>미용 서비스</h2>
							<span>50,000원</span>
							<p>[서비스이용전 주의사항] ※ 미용차가 아닙니다. 매니저가 미용용품을 구비하여 보호자님 댁에 방문하여 서비스하는 상품입니다. ※ 신청하신 미용스타일에 맞춰 스케줄관리를 하기때문에 미용스타일변경이 필요하실경우, [ 특수견이란? ] - 배들링턴 테리어, 꼬똥드, 비숑, 보더콜리, 사모예드</p>

							<!-- 서비스 종류 -->
							<div class="form-group ">
								<input type="text" name="service" value="미용" class="form-control" placeholder="미용" readonly>
							</div>

							<!-- 펫 종류 -->
							<div class="form-group ">
								<select class="form-control" id="pet" name="pet">
									<option selected disabled hidden>견종 (필수)</option>
									<option value="소/중형견">소/중형견</option>
									<option value="대형견">대형견</option>
									<option value="고양이">고양이</option>
								</select>

							</div>

							<!-- 미용 옵션 -->
							<div class="form-group">
								<select class="form-control" id="grooming" name="grooming">
									<option selected disabled hidden>옵션 (필수)</option>
									<option value="전체미용">전체미용</option>
									<option value="위생미용">위생미용</option>
								</select>
							</div>

							<!-- 예약 날짜 및 시간 -->
							<div class="">
								<input type="date" id="date" name="date" class="form-control" placeholder="Date &amp; Time">
							</div>

							<!-- 예약하기 버튼 -->
							<div class="form-group ">
								<input type="submit" class="btn btn-primary" value="예약하기" />
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
					Shared by <i class="fa fa-love"></i>
					<a href="https://bootstrapthemes.co">BootstrapThemes</a>
					<p class="text-center to-animate">
						<a href="#" class="js-gotop">Go To Top</a>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<ul class="fh5co-social">
						<li class="to-animate-2"><a href="#">
								<i class="icon-facebook"></i>
							</a></li>
						<li class="to-animate-2"><a href="#">
								<i class="icon-twitter"></i>
							</a></li>
						<li class="to-animate-2"><a href="#">
								<i class="icon-instagram"></i>
							</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/index.js"></script>
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