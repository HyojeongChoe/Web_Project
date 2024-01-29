// 아이디 찾기 결과를 출력하는 함수
function displayFoundId(foundId) {
    let foundIdSpan = document.getElementById("foundIdSpan");

    if (foundId === null) {
        foundIdSpan.innerHTML = "아이디를 찾을 수 없습니다.";
    } else {
        foundIdSpan.innerHTML = "찾은 아이디: " + foundId;
    }
}
// fetch 요청 수정
fetch("findId.do", {
    method: "POST",
    headers: {
        "Content-Type": "application/x-www-form-urlencoded"
    },
    body: new URLSearchParams(new FormData(document.getElementById("findIdForm")))
})
    .then(response => response.text()) // 텍스트 형식으로 응답을 파싱
    .then(data => {
        if (data !== "null") {
            displayFoundId(data);
            
            // 아이디를 찾은 경우, 페이지 이동
            window.location.href = "FindGetId.jsp";
        } else {
            displayFoundId("아이디를 찾을 수 없습니다.");
        }
    })
    .catch(error => {
        console.error("Error finding ID:", error);
        displayFoundId("아이디 찾기 중 오류가 발생했습니다.");
    });


function checkPassword() {
    let pwInput = document.getElementById("pw");
    let pwConfirmInput = document.getElementById("pw_confirm");
    let pwError = document.getElementById("pwError");

    // 비밀번호와 비밀번호 확인 값이 다를 경우
    if (pwInput.value !== pwConfirmInput.value) {
        pwError.style.color = "red";
        pwError.innerText = "비밀번호가 일치하지 않습니다.";
    } else {
        pwError.style.color = "blue";
        pwError.innerText = "비밀번호가 일치합니다.";
    }
}
// fetch 요청 수정
fetch("findPw.do", {
    method: "POST",
    headers: {
        "Content-Type": "application/x-www-form-urlencoded"
    },
    body: new URLSearchParams(new FormData(document.getElementById("findPwForm")))
})
    .then(response => response.json())
    .then(data => {
        if (data.found) {
            // 비밀번호를 찾은 경우, 페이지 이동
            window.location.href = "FindGetPw.jsp";
        } else {
            // 비밀번호를 찾지 못한 경우
            alert("비밀번호를 찾을 수 없습니다.");
        }
    })
    .catch(error => {
        console.error("Error finding password:", error);
        alert("비밀번호 찾기 중 오류가 발생했습니다.");
    });
    
// 비밀번호 유효성 검사 함수
function checkPassword() {
	let pw = document.getElementById("pw").value;
	let pwConfirm = document.getElementById("pw_confirm").value;
	let pwError = document.getElementById("pwError");
	let pwConfirmError = document.getElementById("pwConfirmError");

	// 비밀번호가 조건을 만족하는지 검사
	let regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;

	if (!regex.test(pw)) {
		pwError.innerText = "비밀번호는 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합, 8자~16자여야 합니다.";
	} else {
		pwError.innerText = "";
	}

	// 비밀번호 확인 일치 여부 검사
	if (pw !== pwConfirm) {
		pwConfirmError.innerText = "비밀번호가 일치하지 않습니다.";
	} else {
		pwConfirmError.innerText = "";
	}
}


/*
// 비밀번호 찾기 결과를 출력하는 함수
function displayFoundPw(foundPw) {
    let foundPwSpan = document.getElementById("foundPwSpan");

    if (foundPw === null) {
        foundPwSpan.innerHTML = "비밀번호를 찾을 수 없습니다.";
    } else {
        foundPwSpan.innerHTML = "찾은 비밀번호: " + foundPw;
    }
}
// fetch 요청 수정
fetch("findPw.do", {
    method: "POST",
    headers: {
        "Content-Type": "application/x-www-form-urlencoded"
    },
    body: new URLSearchParams(new FormData(document.getElementById("findPwForm")))
})
    .then(response => response.text()) // 텍스트 형식으로 응답을 파싱
    .then(data => {
        if (data !== "null") {
            displayFoundPw(data);
            
            // 비밀번호를 찾은 경우, 페이지 이동
            window.location.href = "FindGetPw.jsp";
        } else {
            displayFoundPw("비밀번호를 찾을 수 없습니다.");
        }
    })
    .catch(error => {
        console.error("Error finding password:", error);
        displayFoundPw("비밀번호 찾기 중 오류가 발생했습니다.");
    });
*/

    