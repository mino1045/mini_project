//비빌변호 변경 

//////////비밀번호 재설정 유효성
function pwck(){
	var mpass = document.getElementsByName("mpass")[0].value;
	var mpasscheck = document.getElementById("mpass_check").value;
	var mpass_message = document.getElementById("mpass_message");
	
	var pass_reg = 	/^(?=.*[a-zA-Z])(?=.*[!@#$%^\*\+=\-\.])(?=.*[0-9]).{10,16}$/;

	mpass_message.textContent = "";
	
	if(!mpass){
		mpass_message.textContent = "비밀번호를 입력해주세요";
		return false;
	} else if(!pass_reg.test(mpass)) { //
		mpass_message.textContent = "조건에 맞는 비밀번호를 입력해주세요";
		return false;
	} else if(mpass != mpasscheck) { //
	mpass_message.textContent = "동일한 비밀번호를 입력해주세요";
	return false;
	
	} else {
		return true;
	}
}


function update_pass(){
	if(pwck()){
	var mpass = document.getElementsByName('mpass')[0].value;

	http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		
			if(http.readyState == 4 && http.status == 200){

				if(this.response == "ok"){
					alert("비밀번호가 재설정되었습니다.");
					window.location.href = "./login.do";
	
				}else{
					console.log("this.response == error");
					alert("회원정보가 없습니다");
				}
			} 
	}
	http.open("POST","./update_pass.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded")
	http.send("mpass="+mpass);	
	}
}








//비밀번호찾기
function search_pass(){
	var memail = document.getElementsByName('memail')[0].value;
	var mtel = document.getElementsByName('mtel')[0].value;

	http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		
        if (http.readyState == 4) {
            if (http.status == 200) {
                console.log("http.readyState == 4 && http.status == 200");
                if (this.responseText.trim() === "ok") {  // response를 trim()하여 공백 제거 후 비교
                    console.log("this.response == ok");
                    window.location.href = "./search_mypass.do";
                } else {
                    console.log("this.response == error");
                    alert("회원정보가 없습니다");
                }
            } else {
                console.log("서버에서 정상적인 응답을 받지 못함 (상태 코드: " + http.status + ")");
                alert("서버 응답 오류: " + http.status);
            }
        }
   
	}
	http.open("POST","./search_pass.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded")
	http.send("memail="+memail+"&mtel="+mtel);	
}


//이메일찾기
function search_email(){
	var mname = document.getElementsByName('memail')[0].value;
	var mtel = document.getElementsByName('mtel')[0].value;

	http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		
			if(http.readyState == 4 && http.status == 200){

				if(this.response == "ok"){
					console.log("this.response == ok");
					window.location.href = "./search_myinfo.do";
	
				}else{
					console.log("this.response == error");
					alert("회원정보가 없습니다");
				}
			} else{
				console.log("통신오류");
			} 
	}
	http.open("POST","./search_email.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded")
	http.send("mname="+mname+"&mtel="+mtel);	
}

////로그인 이동
function gologin(){
	window.location.href = "./login.do";
}