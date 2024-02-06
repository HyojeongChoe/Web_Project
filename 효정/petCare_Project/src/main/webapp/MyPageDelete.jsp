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
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/mypagedel.css">
<title>회원탈퇴</title>
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

	<div class="form_pw">
		<div class="menu_bar">
			<div class="mypage">
				<h3>마이페이지</h3>
			</div>
			<div class="mypage_title">마이 예약</div>
			<ul class="my_reserve">
				<li class="mypage_menu"><a href="#"
					onclick="openMyPageReserve()">예약내역확인</a></li>
			</ul>
			<div class="mypage_title">마이 정보</div>
			<ul class="my_inform">
				<li class="mypage_menu"><a href="#" onclick="openMyPagePw()">개인정보
						수정</a></li>
				<li class="mypage_menu"><a href="MyPageDelete.jsp">회원 탈퇴</a></li>
			</ul>
		</div>
		<div class="mypage_pw_insert">
			<form action="delete.do">
				<div class="form_myupdate_pw" id="myupdate">
					<span class=image_logo><img
						src="images/free-icon-dog-3843277.png" id="pw_logo" /></span>
					<div class="pw_line"></div>
					<div class="delete_title">
						<h1>탈퇴하기</h1>
						<h3>탈퇴하기 전에 아래 내용을 꼭 확인해주세요.</h3>
					</div>
					<div class="delete_message">
						<ul class="del_message_ul">
							<li class="del_message_li">탈퇴 시 회원님의 예약내역은 1년간 보관됩니다.</li>
							<li class="del_message_li">모든 개인정보는 영구적으로 삭제되며, 다시는 복구할 수
								없습니다.</li>
							<li class="del_message_li">휴대폰 번호 변경은
								[마이정보]>[개인정보수정]>[휴대폰]에서 가능합니다.</li>
							<li class="del_message_li">이메일 변경은 [마이정보]>[개인정보수정]>[이메일]에서
								가능합니다.</li>
							<li>이상의 내용을 숙지하여 탈퇴를 원하실 경우, 아래의 "탈퇴" 버튼을 눌러주세요.</li>
						</ul>
					</div>
					<div class="form_input_pw">
						<input type="password" id="input_pw" name="input_pw"
							placeholder="비밀번호를 입력해주세요." />
						<div class="pwbtn">
							<!-- 탈퇴 버튼 클릭 시 checkPassword() 메서드 호출 -->
							<input class="submit" type="submit" id="submit" value="탈퇴"
								onclick="deleteUser()" />
							<!-- onclick="checkPassword()" /> -->
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="js/index.js"></script>
	<script src="js/mypage.js"></script>
	<script>
		function deleteUser() {
			var password = document.getElementById("input_pw").value;
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						var response = xhr.responseText;
						if (response === "success") {
							alert("탈퇴가 완료되었습니다.");
/* 							window.location.href = "index.jsp"; // 페이지 이동 */
						} else if (response === "fail") {
							alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
						} else {
							alert("서버 오류가 발생했습니다.");
						}
					} else {
						alert("서버 오류가 발생했습니다.");
					}
				}
			};
			xhr.open("POST", "passwordCheckServlet", true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.send("input_pw=" + password);
		}
	</script>
</body>
</html>