<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
	<div id="result">
    	<!-- 결과가 표시될 영역 -->
    	<span id="foundIdSpan">
    		<%= request.getAttribute("foundId") %>
    	</span>
	</div>
	
	<div class="">
		<a href="#" class="">
			<span class="text">비밀번호 찾기</span>
		</a><br>
		<a href="#" class="">
			<span class="text">로그인</span>
		</a><br>
	</div>
	
	<script src="findResult.js"></script>		
</body>
</html>