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
<title>About</title>
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
							<li class="join"><a href="#" id="JoinButton" style="background-color: white; border: 0;" onclick="openSignUpPage()">SignUp</a></li>
							<li class="login"><a href="#" id="loginButton" style="background-color: white; border: 0;" onclick="openLoginPage()">Login</a></li>
							<%
							} else {
							%>
							<!-- 로그인 상태인 경우 -->
							<li class="logout"><a href="#" id="logoutButton" style="background-color: white; border: 0;" onclick="performLogout()"> Logout</a></li>
							<li class="mypage"><a href="#" id="mypageButton" style="background-color: white; border: 0;" onclick="openMyPageReserve()">MyPage</a></li>
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


	<!-- 전체 본문 -->
	<div id="fh5co-container">
		<!-- 최상단 about -->
		<div class="section">

			<main>
				<div class="text-image">
					<div class="about-image">
						
					</div>
					<div class="about-image_color"></div>
				</div>
				
				<div class="text-table">
					<div>
						<h2 style="color: black; margin: 0;">
							<span style="font-size: 24px;">Premium Care Service</span>
						</h2>
						<h2 style="color: black; margin: 0;">
							<span><span style="font-size: 96px;">PETVIP</span></span>
						</h2>
						<p style="color: black; margin-top: 15px; opacity: 0.8;">
							<span><span style="font-size: 26px;">산책, 목욕, 미용까지 우리아이의 모든 케어를&nbsp;</span></span>
						</p>
						<p style="color: black; margin-top: 15px; opacity: 0.8;">
							<span style="font-size: 26px;">저희 펫VIP가 책임지겠습니다.</span>
						</p>
					</div>
				</div>
				
				<!-- about 섹션 디브 -->
				<div id="fh5co-about" data-section="about">
					<!-- 좌측 about 이미지 -->
					<div class="fh5co-2col fh5co-bg to-animate-2" style="background-image: url('images/about_img_0.jpg')"></div>

					<!-- 우측 about 내용 -->
					<div class="fh5co-2col fh5co-text">
						<h2 class="heading to-animate">About Us</h2>
						<p class="to-animate">
							<span class="firstcharacter">덤벼!</span>최효정 홍주환 백정윤 신예원 어쩌구저쩌구 궁시렁궁시렁~
						</p>
						<!-- 버튼 -->
						<p class="text-center to-animate">
							<a href="#" class="btn btn-primary btn-outline">Get in touch</a>
						</p>
					</div>
				</div>
			</main>
			
		</div>

		<!-- 추천 디브 -->
		<div id="fh5co-container">
			<div class="section">
				<main>
					<div class="inside">
						<!-- 메인태그 전체 감싸는 디브 -->
						<div class="empty"></div>
						<!-- 타이틀 -->
						<div class="about_tilte">
							<p style="text-align: center;">
								<img src="images/about_img_1.png" style="width: 30px; margin: auto;" alt="">
							</p>
							<h5 style="text-align: center;">
								<span style="font-size: 30px;"><strong>이런 분들에게 추천드려요!</strong></span>
							</h5>
						</div>
						<div class="empty"></div>

						<div class="about_row">
							<div class="about_grid">
								<!-- 첫 번째 추천란 -->
								<div class="about_item">
									<div class="item_wrap">
										<img src="images/about_img_2.jpg" style="margin-bottom: 20px">
										<div class="item_overlay">
											<div class="item_pay">
												<div class="text-table">
													<p>
														<span style="font-size: 22px;"><strong>반려동물을 위한 전문가의 1:1맞춤케어를 원하시는분</strong></span>
													</p>
												</div>
												<hr style="border-top-width: 1px; border-color: rgba(0, 0, 0, 0.06);">
											</div>
											<p class="index_care">반려견은 동일한 메니저에게 케어를 받아야 정서적으로 더 좋으며 반려견의 세세한 성격, 습성같은 부분을 잘인지한 메니저일 수록 더욱 데테일한 케어가 가능합니다.</p>
										</div>
									</div>
								</div>

								<!-- 두 번째 추천란 -->
								<div class="about_item">
									<div class="item_wrap">
										<img src="images/about_img_3.jpg" style="margin-bottom: 20px">
										<div class="item_overlay">
											<div class="item_pay">
												<div class="text-table">
													<p>
														<span style="font-size: 22px;"><strong>유동적인 일정때문에 미용샵 예약이 어려우신분</strong></span>
													</p>
												</div>
												<hr style="border-top-width: 1px; border-color: rgba(0, 0, 0, 0.06);">
											</div>
											<p class="index_care">잦은 야근으로 집에 있는 우리아이 산책이나 미용및 목욕으로 걱정하시는 분들에게 저희 브이아이펫이 도와드리겠습니다.</p>
										</div>
									</div>
								</div>

								<!-- 세 번째 추천란 -->
								<div class="about_item">
									<div class="item_wrap">
										<img src="images/about_img_4.jpg" style="margin-bottom: 20px">
										<div class="item_overlay">
											<div class="item_pay">
												<div class="text-table">
													<p>
														<span style="font-size: 22px;"><strong>외부스트레스에 민감한 노령견을 키우시는 분</strong></span>
													</p>
												</div>
												<hr style="border-top-width: 1px; border-color: rgba(0, 0, 0, 0.06);">
											</div>
											<p class="index_care">노령견 같은 경우에는 외부요인에 의해 스트레스가 잘 받기 때문에 안정감을 느끼는 집에서 케어를 해야 좋습니다.</p>
										</div>
									</div>
								</div>

								<!-- 네 번째 추천란 -->
								<div class="about_item">
									<div class="item_wrap">
										<img src="images/about_img_5.jpg" style="margin-bottom: 20px">
										<div class="item_overlay">
											<div class="item_pay">
												<div class="text-table">
													<p>
														<span style="font-size: 22px;"><strong>전문샵을 찾기 힘든 대형견을 키우시는 분</strong></span>
													</p>
												</div>
												<hr style="border-top-width: 1px; border-color: rgba(0, 0, 0, 0.06);">
											</div>
											<p class="index_care">몸무게가 많이나가는 대형견 부터 외부에 나가면 예민해지는 아이등 여러가지 이유로 샵에 가기 어려우신 분들에게 추천합니다.</p>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</main>
			</div>
		</div>


		<!-- 팀원 소개 디브 -->
		<div id="fh5co-type" style="background-image: url(images/slide_3.jpg);" data-stellar-background-ratio="9.5">
			<div class="fh5co-overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-3 to-animate">
						<div class="fh5co-type">
							<h3 class="with-icon icon-1">돌봄</h3>
							<p>돌본다.</p>
						</div>
					</div>
					<div class="col-md-3 to-animate">
						<div class="fh5co-type">
							<h3 class="with-icon icon-2">산책</h3>
							<p>뚜벅초.</p>
						</div>
					</div>
					<div class="col-md-3 to-animate">
						<div class="fh5co-type">
							<h3 class="with-icon icon-3">미용</h3>
							<p>패완얼.</p>
						</div>
					</div>
					<div class="col-md-3 to-animate">
						<div class="fh5co-type">
							<h3 class="with-icon icon-4">상담</h3>
							<p>혀노혀노.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 전체 본문 -->

	<!-- 푸터푸터 디브디브 -->
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


	<script>
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
	</script>


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