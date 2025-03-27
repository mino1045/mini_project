//비밀번호찾기
function search_pass(){
	var memail = document.getElementsByName('mname')[0].value;
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
	http.open("POST","./search_pass.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded")
	http.send("memail="+memail+"&mtel="+mtel);	
}


//이메일찾기
function search_email(){
	var mname = document.getElementsByName('mname')[0].value;
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