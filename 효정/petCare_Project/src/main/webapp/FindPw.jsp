<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="findPw">
		<form action="findPw.do" method="post">
			<div class="title" id="title_name">
				<h3>비밀번호 찾기</h3>
			</div>
			
			<!-- 아이디 -->
			<div class="inputBox" id="input_name">
				<p>아이디</p>
				<input type="text" id="id" name="id">
			</div>
			
			<!-- 이름 -->
			<div class="inputBox" id="input_name">
				<p>이름</p>
				<input type="text" id="name" name="name">
			</div>
			
			<!-- 생년월일 -->
			<div class="inputBox" id="input_birth">
				<p>생년월일</p>
				<input type="date" id="birth" name="birth">
			</div>
			
			<!-- 휴대폰 번호 -->
			<div class="inputBox" id="input_mobile">
				<p>휴대폰 번호</p>
				<select id="mobile1" name="mobile1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> 
				<span class="mobile-formText"> - </span>
				<input id="mobile2" name="mobile2" maxlength="4" type="text" style="width: 50px;" oninput="checkMobile()" />
				<span class="mobile-formText"> - </span>
				<input id="mobile3" name="mobile3" maxlength="4" type="text" style="width: 50px;" oninput="checkMobile()" />
				</span>
			</div>

			<!-- 확인 버튼 -->
			<div class="inputBox" id="findIdButton">
				<input type="submit" value="확인">
			</div>
						
		</form>
	</div>
</body>
</html>