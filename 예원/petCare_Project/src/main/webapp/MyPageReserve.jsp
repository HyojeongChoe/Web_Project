<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
ArrayList<userDTO> result = paginationService.executePaging(request, response, offset, itemsPerPage);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" href="favicon.ico">
<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,400italic,700italic|Merriweather:300,400italic,300italic,400,700italic' rel='stylesheet' type='text/css'>
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
							<li class="join"><a href="#" id="JoinButton" style="background-color: white; border: 0;" onclick="openSignUpPage()">SignUp</a></li>
							<li class="login"><a href="#" id="loginButton" style="background-color: white; border: 0;" onclick="openLoginPage()">Login</a></li>
							<%
							} else {
							%>
							<!-- 로그인 상태인 경우 -->
							<li class="logout"><a href="#" id="logoutButton" style="background-color: white; border: 0;" onclick="performLogout()">Logout</a></li>
							<li class="mypage"><a href="#" id="mypageButton" style="background-color: white; border: 0;" onclick="openMyPageReserve()">MyPage</a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
				<div class="container-fluid">
					<div class="fh5co-menu-1">
						<a href="#" onclick="goToIndex()">Home</a>
						<a href="#" onclick="goToAbout()">About</a>
					</div>
					<div class="fh5co-logo">
						<a href="#" onclick="goToIndex()">foodee</a>
					</div>
					<div class="fh5co-menu-2">
						<a href="#" onclick="goToService()">Service</a>
						<a href="#" onclick="goToReservation()">Community</a>
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
				<li class="mypage_menu"><a href="#" onclick="openMyPageReserve()">예약내역확인</a></li>
			</ul>
			<div class="mypage_title">마이 정보</div>
			<ul class="my_inform">
				<li class="mypage_menu"><a href="#" onclick="openMyPagePw()">개인정보 수정</a></li>
				<li class="mypage_menu">회원 탈퇴</li>
			</ul>
		</div>
		<!-- 예약내역 페이지 상단 -->
		<div class="desktop_reserve">
			<span class=image_logo><img src="images/free-icon-dog-3843277.png" id="reserve_logo" /></span>
			<div class="reserve_line"></div>
			<div class="reserve_div">
				<!-- 예약내역 출력 공간 -->
				<form action="deleteReserve.do" method="post">
					<div class="reservaiton">
						<h2>예약 내역</h2>
						<hr>
						<table class="reservation_table" border="1">
							<thead>
								<tr>
									<th scope="col" class="reservation_check"></th>
									<th scope="col">예약날짜</th>
									<th scope="col">서비스 종류</th>
									<th scope="col">이용시간</th>
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
										<td><input type="checkbox" id="checkbox_${loop.index}" name="reserve_checkbox" class="reserve_checkbox" data-date="${value.date}" data-service="${value.service}" data-time="${value.time}" data-grooming="${value.grooming}" data-pet="${value.pet}" data-cost="${value.cost}" /></td>
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
							<button type="button" onclick="deleteSelectedReservations()" style="font-size: 16px;">예약 취소하기</button>
						</div>

					</div>
				</form>

			</div>
		</div>
	</div>


	<script>
		/* 현재 날짜를 구하는 함수*/
		function getCurrentDate() {
			var now = new Date();
			var year = now.getFullYear();
			/* (now.getMonth() + 1).toString() :: 현재 월을 가져와서 1을 더한 후, 이를 문자열로 변환 */
			/* padStart(2, '0') :: 문자열이 2자리가 되도록 앞에 0을 채워주는 역할 */
			var month = (now.getMonth() + 1).toString().padStart(2, '0');
			var day = now.getDate().toString().padStart(2, '0');

			return year + '-' + month + '-' + day; /* 현재 날짜 형식: 'yyyy-mm-dd' */
		}

		/* 여러 체크박스를 선택하고 삭제 버튼을 눌렀을 때, 선택된 예약 정보를 서버로 어떻게 전송할 것인지에 대한 로직 */
		function deleteSelectedReservations() {
			var checkboxes = document
					.querySelectorAll('.reserve_checkbox:checked');
			var selectedReservations = [];
			var currentDate = getCurrentDate(); // 현재 날짜 가져오기
			var containsInvalidReservation = false;

			checkboxes.forEach(function(checkbox) {
				var reservation = {
					date : checkbox.dataset.date,
					service : checkbox.dataset.service,
					time : checkbox.dataset.time,
					grooming : checkbox.dataset.grooming,
					pet : checkbox.dataset.pet,
					cost : checkbox.dataset.cost
				};

				// 예약 날짜와 현재 날짜를 비교하여 이틀 이상 여유가 있는지 확인
				var reservationDate = new Date(reservation.date);
				var twoDaysLater = new Date();
				twoDaysLater.setDate(twoDaysLater.getDate() + 2);

				if (reservationDate >= twoDaysLater) {
					// 예약 날짜가 이틀 이상 여유가 있는 경우
					selectedReservations.push(reservation);
				} else {
					// 예약 날짜와 현재 날짜를 비교하여 이미 지나간 예약인지 확인
					if (reservationDate < currentDate) {
						// 이미 지나간 예약에 대한 처리 (예: 경고 메시지)
						containsInvalidReservation = true;
						alert('이미 지난 예약입니다.');
					} else {
						// 이틀 이상 여유가 없는 예약에 대한 처리 (예: 경고 메시지)
						containsInvalidReservation = true;
						alert('이틀 이상 여유가 없는 예약이 포함되어 예약을 취소할 수 없습니다.');
					}
				}
			});

			if (!containsInvalidReservation && selectedReservations.length > 0) {
		        // Ajax를 사용하여 서버로 선택된 예약 정보 전송
		        var xhr = new XMLHttpRequest();
		        xhr.open('POST', 'deleteReserve.do', true);
		        xhr.setRequestHeader('Content-Type', 'application/json');
		        xhr.onreadystatechange = function () {
		            if (xhr.readyState === 4) {
		                if (xhr.status === 200) {
		                    // 서버 응답이 성공일 때만 알림 창을 표시
		                    // 서버 응답을 처리하는 로직 추가 (예: 페이지 새로고침)
		                    window.location.reload();
		                    // 예약 취소 성공 시 알림창 표시
		                    alert('예약을 취소하였습니다.');
		                } else {
		                    // 서버 응답이 실패인 경우에는 실패 메시지만 표시
		                    alert('예약 취소에 실패했습니다.');
		                }
		            }
		        };
		        xhr.send(JSON.stringify(selectedReservations));
		    } else if (!containsInvalidReservation) {
		        // 선택된 예약이 없는 경우에 대한 처리 (예: 경고 메시지)
		        alert('취소할 예약을 선택해주세요.');
		    }
		}
	</script>

	<script src="js/index.js"></script>
</body>
</html>