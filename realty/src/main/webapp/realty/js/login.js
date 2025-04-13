//form
Kakao.init('48cd2b3fa4c8dbc5ca9ce8c95ea65af4');
function kakao_login(){
	//JavaScript SDK v1	//v2 => 팝업지원하지 않음
	Kakao.Auth.login({
		//로그인 성공
		 success:function(response){
			//response
			Kakao.API.request({
				 url: '/v2/user/me',
			  success: function(response) { //성공 => API
				console.log(response);
				//카카오 로그인 정보
			  	let id = response["id"];
				let nickname = response["kakao_account"]["profile"]["nickname"];
			  	
				//로그인 정보 세팅
				frm.login_channel.value = "2";
				frm.kakao_id.value = id;
				frm.kakao_nicknm.value = nickname;
				frm.submit();
			  },
			  fail: function(error) {
				console.log("카카오 API 접속오류");		 
				console.log(error);
			  },
			})		
		}	
	});
}


function logincheck(){
	var memail = frm.memail.value;
	var mpass = frm.mpass.value;
	var login_channel = frm.login_channel.value;
	
	if(memail == ""){
		alert("아이디를 입력하세요");
	} else if (mpass == ""){
		alert("비밀번호를 입력하세요");
	} else {
	frm.submit();
	}
	
	/*var login_message = document.getElementById("login_message");
	var memail = document.getElementsByName("memail")[0].value;
	var mpass = document.getElementsByName("mpass")[0].value;
	var login_channel = document.getElementsByName("login_channel")[0].value;
	
	console.log(login_channel)
	console.log(memail)
	console.log(mpass)
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

	http.open("POST","./loginok.do", false);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded");
	http.send("memail="+memail+"&mpass="+mpass+"&login_channel="+login_channel);
	}*/
}