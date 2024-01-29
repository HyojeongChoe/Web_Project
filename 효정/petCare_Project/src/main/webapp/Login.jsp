<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/loginForm.css">
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
<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
</head>

<body>
	<div class="js-sticky">
		<div class="fh5co-main-nav">
			<div id="header">
				<div class="top_util">
					<ul class="menu_list" id="menu_list_header">
						<li class="join"><a href="#" id="loginButton"
							style="background-color: white; border: 0;"
							onclick="openSignUpPage()">SignUp</a></li>
						<li class="login"><a href="#" id="loginButton"
							style="background-color: white; border: 0;"
							onclick="openLoginPage()">Login</a></li>
					</ul>
				</div>
			</div>
			<div class="container-fluid">
				<div class="fh5co-menu-1">
					<a href="#" data-nav-section="home">Home</a> <a href="#"
						data-nav-section="about">About</a>
				</div>
				<div class="fh5co-logo">
					<a href="index.html">foodee</a>
				</div>
				<div class="fh5co-menu-2">
					<a href="#" data-nav-section="features">Features</a> <a href="#"
						data-nav-section="reservation">Reservation</a>
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
						value="LOGIN">
				</div>
				<a href="#" id="signup" onclick="openSignUpPage()">회원가입</a> <label
					id="line1"></label>
				<!-- 아이디/비밀번호 찾기 새페이지로 이동, 페이지url 바꿔야함-->
				<a href="#" id="find_id" onclick="openFindIdPage()" target="_blank">아이디 찾기</a> <label
					id="line2"></label> <a href="#" id="find_pw"
					onclick="openFindPwPage()" target="_blank">비밀번호
					찾기</a>
			</form>
		</div>
	</div>
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


<!-- 이거는 원본 코드 
	<div class="inputBox_passwd" style="display: block;">
							<div class="chk_passwd" style="display: block;"></div><input id="member_passwd"
								name="member_passwd" value="password" type="password" class="password" placeholder="패스워드">
						</div>
					</div>
					<button class="btn loginBtn" id = "login"
						onclick="MemberAction.login('member_form_0434157565'); return false;">LOGIN</button>
					<div class="utilMenu" style="display:block">
						<a action="/member/join.html" class="right" id = "Signup">회원가입</a>
						<a href="/member/id/find_id.html" id = "">아이디 찾기</a>
						<a href="/member/passwd/find_passwd_info.html">비밀번호 찾기</a>			
					</div> -->