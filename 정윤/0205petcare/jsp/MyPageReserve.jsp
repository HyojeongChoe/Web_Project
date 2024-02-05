<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL 사용시 필수 -->
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
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<title>마이페이지 예약내역 확인</title>

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

	<!-- 예약내역 출력 공간 -->
		<table border="1">
			<tr>
				<th>예약날짜</th>
				<th>서비스 종류</th>
				<th>이용시간</th>
				<th>미용 종류</th>
				<th>반려동물</th>
				<th>비용</th>
			</tr>

			<!-- items :: 실질적인 값을 들고 옴 -->
			<c:forEach items="${list}" var="value">
				<!-- list :: DTO의 멤버 이름으로 값을 불러와야 한다-->
				<tr>
					<td>${value.date}</td>
					<td>${value.service}</td>
					<td>${value.time}</td>
					<td>${value.grooming}</td>
					<td>${value.pet}</td>
					<td>${value.cost}</td>
				</tr>
			</c:forEach>
		</table>
	<script src="js/index.js"></script>
</body>
</html>