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
<title>Community</title>
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
<link rel="stylesheet" href="css/store.css">


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


	<div class="store">
		<div doz_type="inside" class="inside">
			<div class="store_menu">
				<h2>
					맛과 영양을 모두 잡은 프미리엄 영양제
				</h2>
				<p>
					피부건강, 눈물샘 완화, 면역력증강 필요한 영양제<br>맛과 영양을 모두잡은 프리미엄 영양제를 만나보세요!
				</p>
			</div>
		</div>
		<div class="store_row">
			<div class="store_shop-grid">
				<div class="store_shop_item"
					style="width: 375px; padding: 0px 15px; height: 511px;">
					<div class="store_item-wrap" style="position: relative;">
						<a href="https://www.petvip.co.kr/46/?idx=54" target="_blank"
							class="_fade_link shop-item-thumb hover_img_none"> <img
							data-prodcode="s20220513cda76e5f4845e" alt=""
							src="https://cdn.imweb.me/thumbnail/20220513/82ce3a77a048a.jpg"
							class="_org_img org_img _lazy_img"
							data-original="https://cdn.imweb.me/thumbnail/20220513/82ce3a77a048a.jpg"
							data-src="https://cdn.imweb.me/thumbnail/20220513/82ce3a77a048a.jpg"
							style="display: inline;">
							<div class="item-overlay">
								<div class="item-detail">
									<h2>[아모레미오] 사료보조제 300ml</h2>
									<p class="pay" style="">35,000원</p>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="store_shop_item"
					style="width: 375px; padding: 0px 15px; height: 511px;">
					<div class="store_item-wrap" style="position: relative;">
						<a href="https://www.petvip.co.kr/46/?idx=15" target="_blank" class="_fade_link shop-item-thumb "> <img
							data-prodcode="s202110152887c37e6edd9" alt=""
							src="https://cdn.imweb.me/thumbnail/20211015/dbc7d9e6369e7.png"
							class="_org_img org_img _lazy_img"
							data-original="https://cdn.imweb.me/thumbnail/20211015/dbc7d9e6369e7.png"
							data-src="https://cdn.imweb.me/thumbnail/20211015/dbc7d9e6369e7.png"
							style="display: inline;">
							<div class="item-overlay">
								<div class="item-detail">
									<h2>[리브펫] 덴탈핏츄(17g*10ea)</h2>
									<p class="pay">16,400원</p>
								</div>
							</div>
						</a>
					</div>

				</div>
				<div class="store_shop_item"
					style="width: 375px; padding: 0px 15px; height: 511px;">
					<div class="store_item-wrap" style="position: relative;">
						<a href="https://www.petvip.co.kr/46/?idx=16" target="_blank" class="_fade_link shop-item-thumb "> <img
							data-prodcode="s2021101538fbc9981b65a" alt=""
							src="https://cdn.imweb.me/thumbnail/20211015/ac2ea2fdf1452.png"
							class="_org_img org_img _lazy_img"
							data-original="https://cdn.imweb.me/thumbnail/20211015/ac2ea2fdf1452.png"
							data-src="https://cdn.imweb.me/thumbnail/20211015/ac2ea2fdf1452.png">
							<div class="item-overlay">
								<div class="item-detail">
									<h2>[리브펫] 유산균(스틱포)</h2>
									<p class="pay">29,500원</p>
								</div>
							</div>
						</a>
					</div>

				</div>
				<div class="store_shop_item"
					style="width: 375px; padding: 0px 15px; height: 511px;">
					<div class="store_item-wrap" style="position: relative;">
						<a href="https://www.petvip.co.kr/46/?idx=17" target="_blank" class="_fade_link shop-item-thumb "> <img
							data-prodcode="s202110151723445c37ae0" alt=""
							src="https://cdn.imweb.me/thumbnail/20211015/ce9351dfdf75f.png"
							class="_org_img org_img _lazy_img"
							data-original="https://cdn.imweb.me/thumbnail/20211015/ce9351dfdf75f.png"
							data-src="https://cdn.imweb.me/thumbnail/20211015/ce9351dfdf75f.png">
							<div class="item-overlay">
								<div class="item-detail">
									<h2>[리브펫] 유산균(통)</h2>
									<p class="pay" style="">27,500원</p>
								</div>
							</div>
						</a>
					</div>

				</div>
				<div class="store_shop_item"
					style="width: 375px; padding: 0px 15px; height: 511px;">
					<div class="store_item-wrap" style="position: relative;">
						<a href="https://www.petvip.co.kr/46/?idx=18" target="_blank" class="_fade_link shop-item-thumb "> <img
							data-prodcode="s202110154d57619d62ad8" alt=""
							src="https://cdn.imweb.me/thumbnail/20211015/2094689e88512.png"
							class="_org_img org_img _lazy_img"
							data-original="https://cdn.imweb.me/thumbnail/20211015/2094689e88512.png"
							data-src="https://cdn.imweb.me/thumbnail/20211015/2094689e88512.png"
							style="display: inline;">
							<div class="item-overlay">
								<div class="item-detail">
									<h2>[리브펫] 조인트</h2>
									<p class="pay" style="">27,500원</p>
								</div>
							</div>
						</a>
					</div>

				</div>
				<div class="store_shop_item"
					style="width: 375px; padding: 0px 15px; height: 511px;">
					<div class="store_item-wrap" style="position: relative;">
						<a href="https://www.petvip.co.kr/46/?idx=14" target="_blank" class="_fade_link shop-item-thumb "> <img
							data-prodcode="s20211015836278cbda6e3" alt=""
							src="https://cdn.imweb.me/thumbnail/20211015/5d2614de61d67.png"
							class="_org_img org_img _lazy_img"
							data-original="https://cdn.imweb.me/thumbnail/20211015/5d2614de61d67.png"
							data-src="https://cdn.imweb.me/thumbnail/20211015/5d2614de61d67.png"
							style="display: inline;">
							<div class="item-overlay">
								<div class="item-detail">
									<h2>[리브펫] 뉴스킨</h2>
									<p class="pay" style="">29,500원</p>
								</div>
							</div>
						</a>
					</div>

				</div>
				<div class="store_shop_item"
					style="width: 375px; padding: 0px 15px; height: auto;">
					<div class="store_item-wrap" style="position: relative;">
						<a href="https://www.petvip.co.kr/46/?idx=13" target="_blank" class="_fade_link shop-item-thumb "> <img
							data-prodcode="s20211015ee11e04a926e2" alt=""
							src="https://cdn.imweb.me/thumbnail/20211015/551a3a25b0341.jpg"
							class="_org_img org_img _lazy_img"
							data-original="https://cdn.imweb.me/thumbnail/20211015/551a3a25b0341.jpg"
							data-src="https://cdn.imweb.me/thumbnail/20211015/551a3a25b0341.jpg"
							style="display: inline;">
							<div class="item-overlay">
								<div class="item-detail">
									<h2>[관절탄탄] 강아지 피부 영양제 간식 (강아지 관절 영양제)</h2>
									<p class="pay" style="">33,000원</p>
								</div>
							</div>
						</a>
					</div>

				</div>
				<div class="store_shop_item"
					style="width: 375px; padding: 0px 15px; height: auto;">
					<div class="store_item-wrap" style="position: relative;">
						<a href="https://www.petvip.co.kr/46/?idx=12" target="_blank" class="_fade_link shop-item-thumb "> <img
							data-prodcode="s202110153987538a7011a" alt=""
							src="https://cdn.imweb.me/thumbnail/20211015/1ba00bcdd1b43.jpg"
							class="_org_img org_img _lazy_img"
							data-original="https://cdn.imweb.me/thumbnail/20211015/1ba00bcdd1b43.jpg"
							data-src="https://cdn.imweb.me/thumbnail/20211015/1ba00bcdd1b43.jpg"
							style="display: inline;">
							<div class="item-overlay">
								<div class="item-detail">
									<h2>[피부싹싹] 강아지 피부 영양제 간식 (피모관리/아토피/강아지영양제)</h2>
									<p class="pay" style="">33,000원</p>
								</div>
							</div>
						</a>
					</div>

				</div>
				<div class="store_shop_item"
					style="width: 375px; padding: 0px 15px; height: auto;">
					<div class="store_item-wrap" style="position: relative;">
						<a href="https://www.petvip.co.kr/46/?idx=11" target="_blank" class="_fade_link shop-item-thumb "> <img
							data-prodcode="s20211015bcd2a7e657ad9" alt=""
							src="https://cdn.imweb.me/thumbnail/20211015/e628839ac4dc4.jpg"
							class="_org_img org_img _lazy_img"
							data-original="https://cdn.imweb.me/thumbnail/20211015/e628839ac4dc4.jpg"
							data-src="https://cdn.imweb.me/thumbnail/20211015/e628839ac4dc4.jpg"
							style="display: inline;">
							<div class="item-detail">
								<h2>[눈물싹싹] 강아지 눈물자국 제거 간식 150g, 300g (눈물제거/강아지영양제)</h2>
								<p class="pay" style="">33,000원</p>
							</div>
						</a>
					</div>
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
							<strong> <a href="index.jsp" class="js-gotomain">
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