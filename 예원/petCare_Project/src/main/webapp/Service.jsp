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
<link rel="stylesheet" href="css/service.css">

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
						<a href="#" onclick="goToIndex()">foodee</a>
					</div>
					<div class="fh5co-menu-2">
						<a href="#" onclick="goToService()">Service</a> <a href="#"
							onclick="goToReservation()">Community</a>
						<!-- 수정필요. -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="fh5co-container">
		<div class="section">
			<main>
				<div class="inside">
					<div class="empty space"></div>
					<div class="service_menu">
						<a href="/Reservation.jsp"> <span class="plain_name"
							data-hover="">케어서비스</span>
						</a>
					</div>
					<div class="empty space"></div>

					<div class="doz_row">
						<div class="shop_grid">
							<div class="shop_item"
								style="padding: 0px 15px; height: auto; width: 341px;">
								<div class="item_wrap" style="position: relative;">
									<a href="#" onclick="goToCare()" class="care_service"> <img
										src="https://cdn.imweb.me/thumbnail/20221027/efaefbde1f633.jpg"
										style="display: inline;">
										<div class="item_overlay">
											<div class="item_pay">
												<div class="service_detail">
													<h2>돌봄</h2>
													<div class="ns-icon clearfix">
														<!--<span class="new bg-brand">NEW</span>-->
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
							<div class="shop_item"
								style="padding: 0px 15px; height: auto; width: 341px;">
								<div class="item_wrap" style="position: relative;">
									<a href="#" onclick="goToWalk()" class="work_service"> <img
										src="https://cdn.imweb.me/thumbnail/20221027/3f1e6e9249fa2.jpg"
										style="display: inline;">
										<div class="item_overlay">
											<div class="item_pay">
												<div class="service_detail">
													<h2>산책</h2>
													<div class="ns-icon clearfix">
														<!--<span class="new bg-brand">NEW</span>-->
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
							<div class="shop_item"
								style="padding: 0px 15px; height: auto; width: 341px;">
								<div class="item_wrap" style="position: relative;">
									<a href="#" onclick="goToGrooming()" class="beauty_service">
										<img
										src="https://cdn.imweb.me/thumbnail/20211206/30b255561ebf9.jpg"
										style="display: inline;">
										<div class="item_overlay">
											<div class="item_pay">
												<div class="service_detail">
													<h2>미용</h2>
													<div class="ns-icon clearfix"></div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<!-- <div class="row text-center fh5co-heading row-padded">
					<div class="col-md-8 col-md-offset-2">
						<h2 class="heading to-animate">Featured Dishes</h2>
						<p class="sub-heading to-animate">Far far away, behind the
							word mountains, far from the countries Vokalia and Consonantia,
							there live the blind texts.</p>
					</div>
				</div>
				<div class="row">
					<div class="fh5co-grid">
						<div class="fh5co-v-half to-animate-2">
							<div class="fh5co-v-col-2 fh5co-bg-img" style="background-image: url(images/res_img_1.jpg)">
							</div>
							<div class="fh5co-v-col-2 fh5co-text fh5co-special-1 arrow-left">
								<h2>Fresh Mushrooms</h2>
								<span class="pricing"><a href="#fh5co-contact">$7.50</a></span>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="fh5co-v-half">
							<div class="fh5co-h-row-2 to-animate-2">
								<div class="fh5co-v-col-2 fh5co-bg-img"
									style="background-image: url(images/res_img_2.jpg)"></div>
								<div class="fh5co-v-col-2 fh5co-text arrow-left">
									<h2>Grilled Chiken Salad</h2>
									<span class="pricing">$12.00</span>
									<p>Far far away, behind the word mountains.</p>
								</div>
							</div>
							<div class="fh5co-h-row-2 to-animate-2">
								<div class="fh5co-v-col-2 fh5co-bg-img"
									style="background-image: url(images/res_img_8.jpg)"></div>
								<div class="fh5co-v-col-2 fh5co-text arrow-left">
									<h2>Cheese and Garlic Toast</h2>
									<span class="pricing">$4.50</span>
									<p>Far far away, behind the word mountains.</p>
								</div>
							</div>
						</div>


						<div class="fh5co-v-half">
							<div class="fh5co-h-row-2 to-animate-2">
								<div class="fh5co-v-col-2 fh5co-bg-img"
									style="background-image: url(images/res_img_2.jpg)"></div>
								<div class="fh5co-v-col-2 fh5co-text arrow-left">
									<h2>Grilled Chiken Salad</h2>
									<span class="pricing">$12.00</span>
									<p>Far far away, behind the word mountains.</p>
								</div>
							</div>
							<div class="fh5co-h-row-2 to-animate-2">
								<div class="fh5co-v-col-2 fh5co-bg-img"
									style="background-image: url(images/res_img_8.jpg)"></div>
								<div class="fh5co-v-col-2 fh5co-text arrow-left">
									<h2>Cheese and Garlic Toast</h2>
									<span class="pricing">$4.50</span>
									<p>Far far away, behind the word mountains.</p>
								</div>
							</div>
						</div>

						<div class="fh5co-v-half">
							<div class="fh5co-h-row-2 to-animate-2">
								<div class="fh5co-v-col-2 fh5co-bg-img"
									style="background-image: url(images/res_img_7.jpg)"></div>
								<div class="fh5co-v-col-2 fh5co-text arrow-left">
									<h2>Organic Egg</h2>
									<span class="pricing">$4.99</span>
									<p>Far far away, behind the word mountains.</p>
								</div>
							</div>
							<div class="fh5co-h-row-2 to-animate-2">
								<div class="fh5co-v-col-2 fh5co-bg-img"
									style="background-image: url(images/res_img_6.jpg)"></div>
								<div class="fh5co-v-col-2 fh5co-text arrow-left">
									<h2>Salad with Crispy Chicken</h2>
									<span class="pricing">$8.50</span>
									<p>Far far away, behind the word mountains.</p>
								</div>
							</div>
						</div>

						<div class="fh5co-v-half">
							<div class="fh5co-h-row-2 to-animate-2">
								<div class="fh5co-v-col-2 fh5co-bg-img"
									style="background-image: url(images/res_img_7.jpg)"></div>
								<div class="fh5co-v-col-2 fh5co-text arrow-left">
									<h2>Organic Egg</h2>
									<span class="pricing">$4.99</span>
									<p>Far far away, behind the word mountains.</p>
								</div>
							</div>
							<div class="fh5co-h-row-2 to-animate-2">
								<div class="fh5co-v-col-2 fh5co-bg-img"
									style="background-image: url(images/res_img_6.jpg)"></div>
								<div class="fh5co-v-col-2 fh5co-text arrow-left">
									<h2>Salad with Crispy Chicken</h2>
									<span class="pricing">$8.50</span>
									<p>Far far away, behind the word mountains.</p>
								</div>
							</div>
						</div>
					</div>
				</div> -->

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