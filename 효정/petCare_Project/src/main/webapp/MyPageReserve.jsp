<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL 사용시 필수 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*"%>
<%@ page import="com.kb.petcare.Session.sessionManager"%>
<%@ page import="com.kb.petcare.Command.userServiceSelect"%>
<%@ page import="com.kb.petcare.Command.paginationService"%>
<%@ page import="com.kb.petcare.DTO.userDTO"%>

<%
String loggedInUserId = sessionManager.getLoggedInUserId(request);
%>

<%
// 페이지 번호를 가져오기
String pageStr = request.getParameter("page");
int currentPage = (pageStr != null) ? Integer.parseInt(pageStr) : 1;

// 페이지당 보여줄 항목 수 설정
int itemsPerPage = 10;

// 페이징 처리를 위한 데이터를 가져오기
userServiceSelect userServiceSelect = new userServiceSelect();
paginationService paginationService = userServiceSelect;

int totalItems = paginationService.getTotalItems((String) session.getAttribute("loggedInUserId"));
int totalPages = paginationService.getTotalPages(totalItems, itemsPerPage);
int offset = (currentPage - 1) * itemsPerPage;

// 예약내역 가져오기
ArrayList<userDTO> result = paginationService.executePaging(request, response);
%>

<!DOCTYPE html>
<html lang="en">
<head>
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
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/mypagereserve.css">

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

	<div class="form_reserve">
		<!-- 사이드 메뉴바 -->
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
				<li class="mypage_menu"><a href="MyPagePw.jsp">개인정보 수정</a></li>
				<li class="mypage_menu"><a href="MyPageDelete.jsp">회원 탈퇴</a></li>
			</ul>
		</div>
		<!-- 예약내역 페이지 상단 -->
		<div class="desktop_reserve">
			<span class=image_logo><img
				src="images/free-icon-dog-3843277.png" id="reserve_logo" /></span>
			<div class="reserve_line"></div>
			<div class="reserve_div">
				<!-- 예약내역 출력 공간 -->
				<form action="deleteReserve.do" method="post">
					<div class="reservaiton">
						<div class="reserve_title">
							<h1>예약내역</h1>
							<p>멍뚱냥뚱에서 예약한 내역들을 확인해 볼 수 있는 공간입니다.</p>
						</div>
						<div class="reserve_message">
							<p>※ 예약 취소 안내사항 ※</p>
							<p>예약 취소는 예약일을 기준으로 이틀 전까지 가능합니다.</p>
							<p>예약 수정을 원하시는 경우 DM으로 문의하여 주시기 바랍니다.</p>
							<p>예약 시 참고하시어 이용에 착오 없으시기 바랍니다.</p>
						</div>
						<hr>
						<table class="reservation_table" border="1">
							<thead>
								<tr>
									<th scope="col" class="reservation_check"><input
										type="checkbox" id="selectAllCheckbox"
										class="reserve_checkbox" /></th>
									<th scope="col">예약 날짜</th>
									<th scope="col">서비스 종류</th>
									<th scope="col">이용 시간</th>
									<th scope="col">미용 종류</th>
									<th scope="col">반려동물</th>
									<th scope="col">비용</th>
								</tr>
							</thead>

							<tbody>
								<!-- items :: 실질적인 값을 들고 옴 -->
								<c:forEach items="${list}" var="value" varStatus="loop">
									<!-- list :: DTO의 멤버 이름으로 값을 불러와야 한다-->
									<tr class="${loop.index % 2 == 0 ? 'even' : 'odd'}">
										<td><input type="checkbox" id="checkbox_${loop.index}"
											name="reserve_checkbox" class="reserve_checkbox"
											data-date="${value.date}" data-service="${value.service}"
											data-time="${value.time}" data-grooming="${value.grooming}"
											data-pet="${value.pet}" data-cost="${value.cost}" /></td>
										<td>${value.date}</td>
										<td>${value.service}</td>
										<td>${value.time}</td>
										<td>${value.grooming}</td>
										<td>${value.pet}</td>
										<td>${value.cost}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- 페이징 처리 -->
						<div class="reserve_paging">
							<%
							int pageRange = 7;
							int startPage = Math.max(1, currentPage - pageRange / 2);
							int endPage = Math.min(totalPages, startPage + pageRange - 1);
							int firstPage = 1;
							int lastPage = totalPages;

							// 처음으로 가기 버튼
							out.println("<a href='MyPageReserve.jsp?page=" + firstPage + "' class='paging-btn'>&lt;&lt;</a>");
							// 이전 페이지로 가기 버튼
							if (currentPage > 1) {
								out.println("<a href='MyPageReserve.jsp?page=" + (currentPage - 1) + "' class='paging-btn'>&lt;</a>");
							}
							// 페이지 번호 표시
							for (int i = firstPage; i <= lastPage; i++) {
								if (i == currentPage) {
									out.println("<span class='paging-btnI'>" + i + "</span> ");
								} else if (i >= startPage && i <= endPage) {
									out.println("<a href='MyPageReserve.jsp?page=" + i + "' class='paging-btn'>" + i + "</a> ");
								} else if (i == lastPage - 1) {
									// ... 부분과 "lastPage" 사이에 공백 추가
									out.println(" ... ");
									// 마지막 페이지로 가기 버튼
									out.println("<a href='MyPageReserve.jsp?page=" + lastPage + "' class='paging-btn'>" + lastPage + "</a>");
								}
							}
							// 다음 페이지로 가기 버튼
							if (currentPage < totalPages) {
								out.println("<a href='MyPageReserve.jsp?page=" + (currentPage + 1) + "' class='paging-btn'>&gt;</a>");
							}
							// 마지막으로 가기 버튼
							out.println("<a href='MyPageReserve.jsp?page=" + lastPage + "' class='paging-btn'>&gt;&gt;</a>");
							%>
						</div>
						<!-- 예약 취소하기 버튼 영역 -->
						<div class="box_btn">
							<button type="button" onclick="deleteSelectedReservations()"
								style="font-size: 16px;">예약 취소하기</button>
						</div>

					</div>
				</form>

			</div>
		</div>
	</div>

	<script src="js/index.js"></script>
	<script src="js/mypage.js"></script>
</body>
</html>