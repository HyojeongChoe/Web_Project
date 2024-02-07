<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.kb.petcare.Session.sessionManager"%>

<%
String loggedInUserId = sessionManager.getLoggedInUserId(request);
%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

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

</head>

<body>
	<div id="fh5co-container">
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
							onclick="goToCommunity()">Community</a>
					</div>
				</div>
			</div>
		</div>

		<div>
			<div id="slideshow">
				<div id="slides">
					<img src="images/dog-5671778_1920.jpg" alt="" /> <img
						src="images/dog-7216354_1920.jpg" alt="" /> <img
						src="images/grooming-a-puppy.jpg" alt="" /> <img
						src="images/2c37f4e039bae.jpg" alt="" />
					<button id="prev">&lang;</button>
					<button id="next">&rang;</button>
				</div>
			</div>
		</div>
		<div class="empty space2"></div>
		<div class="class_word1">
			<p>
				<img
					src="https://cdn.imweb.me/upload/S202107298b7e8446d0d73/e77d74a8c8ac3.png"
					class="fr-fin fr-dib" style="width: 40px;">
			</p>
			<div class="word1">우리아이의 편안한 케어를 제공합니다.</div>
			<p>
				<img
					src="https://cdn.imweb.me/upload/S202107298b7e8446d0d73/007779eec4912.png"
					class="fr-fin fr-dib" style="width: 40px;">
			</p>
		</div>
		<div class="empty space2"></div>
		<div id="fh5co-about" data-section="about">
			<div class="fh5co-2col fh5co-bg to-animate-2"
				style="background-image: url(images/dog_1.jpg)"></div>
			<div class="fh5co-2col fh5co-text">
				<h2 class="heading to-animate">고품격 프리미엄 서비스</h2>
				<p class="to-animate">
					<span class="firstcharacter"></span>

				</p>
				<p class="text-center to-animate">
					<a href="About.jsp" class="btn btn-primary btn-outline">더보기</a>
				</p>
			</div>
		</div>

		<div id="fh5co-container">
			<div class="section">
				<main>
					<div class="inside">
						<div class="empty space"></div>
						<div class="service_menu">
							<div class="plain_name" data-hover="">반려견 케어 서비스</div>
							<div class="word2">
								여기에 두줄정도<br> 세줄도 괜찮을듯<br> 대충 적어줬으면 좋겠는데...<br>
							</div>
						</div>
						<div class="empty space"></div>
						<div class="doz_row">
							<div class="shop_grid">
								<div class="shop_item">
									<div class="item_wrap">
										<a href="#" onclick="goToCare()" class="care_service"> <img
											src=https://ynoblesse.com/wp-content/uploads/2022/08/297975306_1008248209844272_696700848492592655_n-1024x1024.jpg>
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
									<p class="index_care">
										혼자 남겨진 반려동물을 생각하며, 외출을 망설인 적이 있으신가요? 이제는 펫시터에게 맡기고, 여러분의 소중한
										일상을 <br> 마음 편히 보내세요
									</p>
								</div>
								<div class="shop_item">
									<div class="item_wrap" style="position: relative;">
										<a href="#" onclick="goToWalk()" class="work_service"> <img
											src="https://blog.kakaocdn.net/dn/bmvdS5/btrbGBPf53r/do65Z9eJzjKvOBsOoEvtG1/img.jpg"
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
									<p class="index_walk">펫시터가 직접 방문하여 반려견의 스트레스 해소, 불안감 해소,
										행복감 증진에 도움을 줍니다.</p>
								</div>
								<div class="shop_item">
									<div class="item_wrap">
										<a href="#" onclick="goToGrooming()" class="beauty_service">
											<img
											src="https://cdn.imweb.me/upload/S2022021670e4a25b91a09/36595cc9ee5b3.jpeg">
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
									<p class="index_grooming">
										우리 아이 목욕이랑 미용할 때 됐는데...<br> 우리 아이가 대형견이라 한번 이동하기가 쉽지
										않은데..<br> 편하게 우리 아이 케어 받을 수 있는 방법 없을까? <br> 그런 분들을
										위해 펫시터가 찾아가겠습니다! <br>
									</p>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>

		<div id="fh5co-sayings">
			<div class="container">
				<div class="row to-animate">
					<div class="flexslider">
						<ul class="slides">
							<li>
								<blockquote>
									<p>&ldquo;이거 쓸거면 냅두고~ &rdquo;</p>
									<p class="quote-author">&mdash; 최효정</p>
								</blockquote>
							</li>
							<li>
								<blockquote>
									<p>&ldquo;Give a man food, and he can eat for a day. Give a
										man a job, and he can only eat for 30 minutes on break.&rdquo;</p>
									<p class="quote-author">&mdash; Lev L. Spiro</p>
								</blockquote>
							</li>
							<li>
								<blockquote>
									<p>&ldquo;Find something you’re passionate about and keep
										tremendously interested in it.&rdquo;</p>
									<p class="quote-author">&mdash; Julia Child</p>
								</blockquote>
							</li>
							<li>
								<blockquote>
									<p>&ldquo;Never work before breakfast; if you have to work
										before breakfast, eat your breakfast first.&rdquo;</p>
									<p class="quote-author">&mdash; Josh Billings</p>
								</blockquote>
							</li>
						</ul>
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
		<script src="js/login.js"></script>
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