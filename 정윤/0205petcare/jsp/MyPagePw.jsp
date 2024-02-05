<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.kb.petcare.Session.sessionManager"%>

<%
String loggedInUserId = sessionManager.getLoggedInUserId(request);
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Simple Line Icons -->
<link rel="stylesheet" href="css/simple-line-icons.css">
<!-- Datetimepicker -->
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
<!-- Flexslider -->
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/mypagepw.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<title>마이페이지 비밀번호 입력창</title>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="menu_bar">
		<div class="mypage">
			<h3>마이페이지</h3>
		</div>
		<div class="mypage_title">마이 예약</div>
		<ul class="my_reserve">
			<li class="mypage_menu">예약내역확인</li>
		</ul>
		<div class="mypage_title">마이 정보</div>
		<ul class="my_inform">
			<li class="mypage_menu">개인정보 수정</li>
			<li class="mypage_menu">회원 탈퇴</li>
		</ul>
	</div>
	
	<div class="mypage_pw_insert">
		<form action="" onsubmit="">
			<div class="form-myupdate_pw" id="myupdate">
				<img src="images/free-icon-dog-3843277.png" id="image" /> <a
					id="line"></a>
				<div class="form_input_pw">
					<img src="free-icon-lock-6421881.png" id="lock" /> <input
						type="password" id="input_pw" name="input_pw"
						placeholder="비밀번호를 입력해주세요." />
				</div>
				<br> <input type="submit" action="" id="submit" value="확인" />
				<input type="button" id="cancel" value="취소" />
			</div>
		</form>
	</div>
	<script src="js/index.js"></script>
</body>
</html>