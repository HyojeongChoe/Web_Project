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
<title>개인정보 수정</title>

<link rel="stylesheet" href="css/mypageedit.css">
<link rel="shortcut icon" href="favicon.ico">
<link
	href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,400italic,700italic|Merriweather:300,400italic,300italic,400,700italic'
	rel='stylesheet' type='text/css'>
<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts -->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Simple Line Icons -->
<link rel="stylesheet" href="css/simple-line-icons.css">
<!-- Datetimepicker -->
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
<!-- Flexslider -->
<link rel="stylesheet" href="css/flexslider.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
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
	<form class="form_edit">
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
		<div class="desktop_edit">
			<img src="images/free-icon-dog-3843277.png" id="edit_logo" />
			<div class="edit_line"></div>
			<div class="edit_div">
				<ul>
					<!--  아이디 -->
					<li class="edit_list">
						<div class="edit_title" id="title_id">
							<!--입력 타이틀 클래스-->
							아이디
						</div> <!--title속성: 마우스 커서 올리면 사용자에게 추가정보 알려줌 -->
						<div class="edit_write" title="(영문소문자와 숫자, 4~16자)">
							<input type="text" id="id" name="id" placeholder="" minlength="4"
								maxlength="16" oninput="checkId()" />
						</div>
					</li>
					<!--  비밀번호 -->
					<li class="edit_list">
						<div class="edit_title" id="title_pw">비밀번호</div>
						<div class="edit_write"
							title="(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)">
							<input type="password" id="pw" name="pw"
								placeholder="(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)"
								maxlength="16" oninput="checkPassword()">
							<div id="pwError" class="error-message"></div>
						</div>
					</li>

					<!-- 비밀번호 확인-->
					<li class="edit_list">
						<div class="edit_title" id="title_confirmpw">비밀번호 확인</div>
						<div class="edit_write">
							<input type="password" id="pw_confirm" name="pw_confirm"
								maxlength="16" oninput="checkPassword()">
							<div id="pwConfirmError" class="error-message"></div>
						</div>
					</li>

					<!--  이름 -->
					<li class="edit_list">
						<div class="edit_title" id="title_name">
							<!-- 입력 타이틀 클래스-->
							이름
						</div>
						<div class="edit_write" title="">
							<input type="text" id="name" name="name" placeholder=""
								maxlength="30" />
							<div id="nameError" class="error-message"></div>
						</div>
					</li>

					<!-- 주소  -->
					<li class="edit_list">

						<div class="edit_title" id="title_addr">주소</div>
						<div class="edit write">
							<input type="text" id="sample6_postcode" name="addr1"
								placeholder="우편번호"> <input type="button"
								id="search_postcode" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기"><br> <input type="text"
								id="sample6_address" name="addr2" placeholder="기본주소"><br>
							<input type="text" id="sample6_detailAddress" name="addr3"
								placeholder="상세주소" onchange="checkAddress()"> <input
								type="text" id="sample6_extraAddress" name="addr4"
								placeholder="참고항목">
							<div id="addressError" class="error-message"></div>
						</div>
					</li>

					<!--전화-->
					<li class="edit_list ">
						<div class="edit_title" id="title_mobile">휴대전화</div>
						<div class="edit_write">
							<span class="edit-mobile"> <select id="mobile1"
								name="mobile1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> <span class="mobile-formText" id="min1"> - </span> <input
								id="mobile2" name="mobile2" maxlength="4" type="text"
								oninput="checkMobile()" /> <span class="mobile-formText"
								id="min2"> - </span> <input id="mobile3" name="mobile3"
								maxlength="4" type="text" oninput="checkMobile()" />
							</span>
							<div id="mobileError" class="error-message"></div>
						</div>
					</li>

					<!--  이메일 -->
					<li class=" edit_list">
						<div class="edit_title" id="title_email">이메일</div>
						<div class="edit_write">
							<span> <input type="text" id="email1" name="email1"
								placeholder="이메일 입력하세요" oninput="checkEmail()"> <a
								id="and">@ </a> <input type="text" id="email2" name="email2"
								placeholder="naver.com" oninput="checkEmail()" /> <select
								id="domainSelect" name="email2">
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
					<li class="edit_list">
						<div class="edit_title" id="title_birth">생년월일</div> <input
						type="date" id="birth" name="birth" onblur="checkBirth()">
					</li>

				</ul>
				<div class="form_submit">
					<input type="submit" value="수정" id="editbtn" />
				</div>
			</div>
		</div>
	</form>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="js/signup.js"></script>

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