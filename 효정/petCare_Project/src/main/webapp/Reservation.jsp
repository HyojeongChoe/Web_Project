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
<title>Foodee &mdash; 100% Free Fully Responsive HTML5 Template
	by FREEHTML5.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

<!-- Facebook and Twitter integration -->
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
								style="background-color: white; border: 0;">MyPage</a></li>
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
						<a href="#" onclick="goToFeatures()">Features</a> <a href="#"
							onclick="goToReservation()">Reservation</a>
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
						<h2 class="heading to-animate">Reserve a Table</h2>
						<p class="sub-heading to-animate">Far far away, behind the
							word mountains, far from the countries Vokalia and Consonantia,
							there live the blind texts.</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 to-animate-2">
						<h3>Contact Info</h3>
						<ul class="fh5co-contact-info">
							<li class="fh5co-contact-address "><i class="icon-home"></i>
								5555 Love Paradise 56 New Clity 5655, <br>Excel Tower
								United Kingdom</li>
							<li><i class="icon-phone"></i> (123) 465-6789</li>
							<li><i class="icon-envelope"></i>info@freehtml5.co</li>
							<li><i class="icon-globe"></i> <a
								href="http://freehtml5.co/" target="_blank">freehtml5.co</a></li>
						</ul>
					</div>
					<div class="col-md-6 to-animate-2">
						<h3>Reservation Form</h3>
						<div class="form-group ">
							<label for="name" class="sr-only">Name</label> <input id="name"
								class="form-control" placeholder="Name" type="text">
						</div>
						<div class="form-group ">
							<label for="email" class="sr-only">Email</label> <input
								id="email" class="form-control" placeholder="Email" type="email">
						</div>
						<div class="form-group">
							<label for="occation" class="sr-only">Occation</label> <select
								class="form-control" id="occation">
								<option>Select an Occation</option>
								<option>Wedding Ceremony</option>
								<option>Birthday</option>
								<option>Others</option>
							</select>
						</div>
						<div class="form-group ">
							<label for="date" class="sr-only">Date</label> <input id="date"
								class="form-control" placeholder="Date &amp; Time" type="text">
						</div>

						<div class="form-group ">
							<label for="message" class="sr-only">Message</label>
							<textarea name="" id="message" cols="30" rows="5"
								class="form-control" placeholder="Message"></textarea>
						</div>
						<div class="form-group ">
							<input class="btn btn-primary" value="Send Message" type="submit">
						</div>
					</div>
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
	<script>
		$(function() {
			$('#date').datetimepicker();
		});
	</script>
	<!-- Main JS -->
	<script src="js/main.js"></script>

</body>

</html>