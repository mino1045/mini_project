function search_email(){
	var mname = document.getElementsByName('mname')[0].value;
	var mtel = document.getElementsByName('mtel')[0].value;

	http = new XMLHttpRequest();
	http.onreadystatechange = function(){
			if(http.readyState == 4 && http.status == 200){
			console.log(this.response);

			if(this.response == "ok"){
				alert("아이디 찾기 성공");
				window.location.href = "./search_myinfo.html";

			}else{
				alert("회원정보가 없습니다");
			}
		} else{
			console.log(this.response);
		}
	}
	http.open("POST","./search_email.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded")
	http.send("mname="+mname+"&mtel="+mtel);	
}