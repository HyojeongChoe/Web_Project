// 아이디 찾기 결과를 출력하는 함수
function displayFoundId(foundId) {
    let foundIdSpan = document.getElementById("foundIdSpan");

    if (foundId === "null") {
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
    .then(response => response.text())
    .then(data => {
        if (data !== "null") {
            displayFoundId(data);
        } else {
            foundIdSpan.innerHTML = "아이디를 찾을 수 없습니다.";
        }
    })
    .catch(error => {
        console.error("Error finding ID:", error);
        foundIdSpan.innerHTML = "아이디 찾기 중 오류가 발생했습니다.";
    });

    