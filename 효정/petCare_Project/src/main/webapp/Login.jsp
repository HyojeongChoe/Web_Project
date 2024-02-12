<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.kb.petcare.Session.sessionManager"%>

<%
String loggedInUserId = sessionManager.getLoggedInUserId(request);
%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
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
<link rel="stylesheet" href="css/loginForm.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
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

	<div id="desktop-login">
		<div id="userLogin" class="contents">
			<img src="images/free-icon-dog-3843277.png" name="image"
				id="login_icon" />
			<form action="login.do" id="user_form">
				<div id="login_id">
					<div class="inputBox" id="input_id">
						<img src="images/free-icon-user-747376.png" id="input_id_icon">
						<input type="text" id="user_id" name="id" class="inputTypeText"
							placeholder="아이디를 입력하세요.">
					</div>
				</div>
				<div class="inputBox" id="input_pw">
					<img src="images/free-icon-lock-6421881.png" id="input_pw_icon">
					<input type="password" id="user_pw" name="pw" class="inputTypeText"
						placeholder="비밀번호를 입력하세요.">
				</div>
				<div class="inputBox" id="normalLogin_login">
					<input type="submit" id="login_button" name="login_button"
						value="LOGIN" />
				</div>
				<a href="#" id="signup" onclick="openSignUpPage()">회원가입</a> <label
					id="line1"></label>
				<!-- 아이디/비밀번호 찾기 새페이지로 이동, 페이지url 바꿔야함-->
				<a href="#" id="find_id" onclick="openFindIdPage()" target="_blank">아이디
					찾기</a> <label id="line2"></label> <a href="#" id="find_pw"
					onclick="openFindPwPage()" target="_blank">비밀번호 찾기</a>
			</form>
		</div>
	</div>
	<script>
	var loginError = '<%=request.getParameter("loginError")%>';
		if (loginError === "true") {
			alert("아이디나 비밀번호를 확인해주세요.");
		}
	</script>
	<!-- jQuery -->
	<script src="js/login.js"></script>
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