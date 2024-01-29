<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
</head>
<body>
	<form action="resetPw.do" onsubmit="return validateForm()">
		<div class="form-join">
			<ul>
				<!--  비밀번호 -->
				<li class="join-list">
					<div class="join-title">새 비밀번호</div>
					<div class="join-write"
						title="(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)">
						<input type="password" id="pw" name="pw"
							placeholder="(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)"
							maxlength="16" oninput="checkPassword()">
						<div id="pwError" class="error-message"></div>
					</div>
				</li>

				<!-- 비밀번호 확인-->
				<li class="join-list">
					<div class="join-title">비밀번호 확인</div>
					<div class="join-write">
						<input type="password" id="pw_confirm" name="pw_confirm"
							maxlength="16" oninput="checkPassword()">
						<div id="pwConfirmError" class="error-message"></div>
					</div>
				</li>

				<input type="submit" value="비밀번호 재설정" />
			</ul>
		</div>
	
	<h1>회원님의 비밀번호</h1>
    <div>
        <c:if test="${not empty foundPw}">
            <p>회원님의 비밀번호는 "${foundPw}"입니다.</p>
            <form action="resetPassword.do" method="post">
                <label for="newPassword">비밀번호를 재설정하세요.</label><br>
                <input type="password" id="newpw" name="newpw">
                <input type="submit" value="비밀번호 재설정">
            </form>
        </c:if>
        <c:if test="${empty foundPw}">
            <p>Password not found</p>
        </c:if>
    </div>
    <script src="findResult.js"></script>
	
	
	<div id="result">
        <!-- 결과가 표시될 영역 -->
        <span id="foundPwSpan">
            <%= request.getAttribute("foundPw") %>
        </span>
    </div>

    <div class="">
        <a href="#" class="">
            <span class="text">로그인</span>
        </a><br>
    </div>

    <script src="findResult.js"></script>
</body>
</html>