//마이페이지 개인정보 수정버튼 눌렀을 때
function showSuccessMessage() {
	alert("수정되었습니다."); // 또는 원하는 형태로 메시지 표시
}

// 탈퇴버튼 눌렀을 때 알람
function checkPassword() {
	var enteredPassword = document.getElementById("input_pw").value;
	console.log(enteredPassword);

	// 입력한 비밀번호가 비어 있는지 확인
	if (!enteredPassword.trim()) {
		alert("비밀번호를 입력하세요.");
		return;
	}

	// Ajax를 사용하여 서버에 비밀번호 확인 요청을 보냅니다.
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var response = xhr.responseText;
			if (response === "success") {
				alert("탈퇴가 완료되었습니다.");
				window.location.href = "index.jsp"; // 페이지 이동
			} else {
				alert("비밀번호가 일치하지 않습니다.");
			}
		}
	};
	xhr.open("POST", "passwordCheckServlet", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("password=" + enteredPassword);
}