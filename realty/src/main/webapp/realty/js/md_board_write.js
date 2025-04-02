function mdb_ok() {
    var formData = new FormData();

    // formData에 값 추가 (name 속성 이용)
    formData.append("mc_title", document.getElementsByName("mc_title")[0].value);
    formData.append("mc_text", document.getElementsByName("mc_text")[0].value);
    formData.append("file", document.getElementsByName("file")[0].files[0]);  // 파일 한 개만 전송

    // Ajax 요청 (fetch API 사용)
    fetch("./mdb_ok.do", {
        method: "POST",
        body: formData
    })
    .then(response => response.text())  // 서버 응답 처리
    .then(data => {
		if(data.trim() == "ok"){
        alert("게시물이 등록되었습니다.");
        console.log(data); // 디버깅용
        window.location.href = "/md_board.do"; 

		} else {
		alert("게시물 등록에 실패하였습니다.");

		}
    })
    .catch(error => {
        console.error("Error:", error);
        alert("썸네일 업로드가 정상적으로 이루어지지 않았습니다.");
    });
}