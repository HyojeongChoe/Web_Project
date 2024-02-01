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
<link rel="stylesheet" href="css/mypageedit.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<title>개인정보 수정</title>
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
	<form action="onsubmit">
		<div class="form-update">
			<!-- <a id="mphtml" action="">마이 페이지</a> <label id="line1" > </label> <a
				id="mplogout" action="">로그아웃</a> <label id = "line2"></label> <a id="mpshop" action = "">장바구니</a> -->
			<img src="images/free-icon-dog-3843277.png" id="image" /> <a
				id="line"></a>

			<!--  아이디 -->
			<div class="join-title" id="div_id">
				<!--입력 타이틀 클래스-->
				아이디
			</div>
			<!--title속성: 마우스 커서 올리면 사용자에게 추가정보 알려줌 -->
			<input type="text" id="up_id" name="up_id" />

			<!--  수정할 비밀번호 -->
			<ul>
				<li class="join-list">
					<div class="join-title" id="div_pw">수정할 비밀번호</div>
					<div class="join-write"
						title="(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)">
						<input type="password" id="up_pw" name="up_pw"
							placeholder="(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)"
							maxlength="16" oninput="checkPassword()">
						<div id="pwError" class="error-message"></div>
					</div>
				</li>

				<!-- 비밀번호 확인-->
				<li class="join-list">
					<div class="join-title" id="div_confirmpw">비밀번호 확인</div>
					<div class="join-write">
						<input type="password" id="up_pw_confirm" name="up_pw_confirm"
							maxlength="16" oninput="checkPassword()">
						<div id="pwConfirmError" class="error-message"></div>
						<input type="button" id="up_pw_btn" name="up_pw_btn"
							value="비밀번호 수정" />
					</div>
				</li>

				<!--  이름 -->
				<li class="join-list">
					<div class="join-title" id="div_name">
						<!-- 입력 타이틀 클래스-->
						이름
					</div>
					<div class="join-write" title="">
						<input type="text" id="name" name="name" placeholder=""
							maxlength="30" />
						<div id="nameError" class="error-message"></div>
					</div>
				</li>

				<!-- 주소  -->
				<li class="join-list">
					<!-- Add address error message div here -->
					<div class="join-title" id="div_addr">수정할 주소</div>
					<div class="join write">
						<input type="text" id="up_sample6_postcode" name="up_addr1"
							placeholder="우편번호"> <input type="button"
							id="up_search_postcode" onclick="up_sample6_execDaumPostcode()"
							value="우편번호 찾기"><br> <input type="text"
							id="up_sample6_address" name="up_addr2" placeholder="기본주소"><br>
						<input type="text" id="up_sample6_detailAddress" name="up_addr3"
							placeholder="상세주소" onchange="checkAddress()"> <input
							type="text" id="up_sample6_extraAddress" name="up_addr4"
							placeholder="참고항목">
						<div id="addressError" class="error-message"></div>
					</div>
				</li>

				<!--수정할 연락처-->
				<li class="join-list ">
					<div class="join-title" id="div_mobile">수정할 연락처</div>
					<div class="join-write">
						<span class="join-mobile"> <select name="up_mobile1"
							id="up_mobile1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> <span class="mobile-formText" id="min1"> - </span> <input
							id="up_mobile2" name="up_mobile2" maxlength="4" type="text"
							oninput="checkMobile()" /> <span class="mobile-formText"
							id="min2"> - </span> <input id="up_mobile3" name="up_mobile3"
							maxlength="4" oninput="checkMobile()" />
						</span>
						<div id="mobileError" class="error-message"></div>
					</div>
				</li>

				<!-- 수정할 이메일 -->
				<li class=" join-list">
					<div class="join-title" id="div_email">수정할 이메일</div>
					<div class="join-write">
						<span> <input type="text" id="up_email1" name="up_email1"
							placeholder="이메일 입력하세요" oninput="checkEmail()"> <a
							id="and">@ </a> <input type="text" id="up_email2"
							name="up_email2" placeholder="naver.com" oninput="checkEmail()" />
							<select id="up_domainSelect" name="up_email2">
								<option>직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="kakao.com">kakao.com</option>
								<option value="google.com">google.com</option>
						</select>
						</span>
						<div id="emailError" class="error-message"></div>
					</div>
				</li>

				<!-- 생일 -->
				<div class="join-title" id="div_birth">생년월일</div>
				<input type="date" id="up_birth" name="up_birth"
					onblur="checkBirth()" />

				<input type="submit" value="정보 수정" id="updatebtn" />
				<input type="button" value="취소" id="cancel" action="index.html" />
			</ul>
		</div>
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="js/signup.js"></script>
		<script src="js/index.js"></script>
</body>
</html>