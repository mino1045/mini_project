function logincheck(){
	var login_message = document.getElementById("login_message");
	var memail = document.getElementsByName("memail")[0].value;
	var mpass = document.getElementsByName("mpass")[0].value;
	login_message.textContent = "";
	
	if(memail == ""){
	login_message.textContent = "아이디를 입력하세요";	
	} else if (mpass == ""){
	login_message.textContent = "비밀번호를 입력하세요";
	} else {
	var http;
	http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		if(http.readyState==4 && http.status == 200 ){
		
		if(this.response == "ok"){
			console.log(this.response);
			alert("로그인 성공");
			console.log("페이지 이동 시작");
			window.location.href = "./index.do";
			
		} else {
			alert("아이디 및 비밀번호를 확인해주세요")	
		}
		
	}else if(http.status==404){
		console.log("경로오류");
	}else if(http.status==405){
		console.log("통신 규격 오류 발생");// get-post 불일치
	}
	}

	http.open("POST","./loginok.do", true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded");
	http.send("memail="+memail+"&mpass="+mpass);
	}
}