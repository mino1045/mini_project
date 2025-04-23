//네이버로그인
function naverLoginDirect() {
    // 클라이언트 ID
    var clientId = "hMTcrqeBiDBKziWywM7w";
    // 콜백 URL
    var callbackUrl = encodeURIComponent("http://localhost:8080/realty/realty/naver_callback.jsp");
    // 상태 토큰 생성 (보안용)
    var state = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
    // 로컬 스토리지에 상태 저장
    localStorage.setItem("naver_oauth_state", state);
    
    // 네이버 로그인 URL 생성
    var naverAuthUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=" + clientId + 
                       "&redirect_uri=" + callbackUrl + "&state=" + state;
    
    // 팝업 창 열기
    var naverPopup = window.open(naverAuthUrl, "네이버 로그인", "width=700,height=500");
    
    // 팝업 차단 확인
    if (naverPopup == null || typeof(naverPopup) == 'undefined') {
        alert("팝업 차단이 설정되어 있습니다. 팝업 차단을 해제해 주세요.");
    }
}
/*window.onload = function() {
    // 네이버 로그인 객체 생성
    var naver_id_login = new naver_id_login("hMTcrqeBiDBKziWywM7w", "http://localhost:8080/realty/realty/naver_callback.jsp");
    
    // 버튼 생성 및 설정
    naver_id_login.setButton("white", 2, 40);
    naver_id_login.setDomain("http://localhost:8080");
    naver_id_login.setState(naver_id_login.getUniqState());
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();
    
    // 버튼 텍스트 변경
    var naverId = document.getElementById("naver_id_login").firstChild;
    if(naverId) {
        naverId.innerText = "네이버 로그인";
        naverId.className = "naver_btn";
    }
};*/

/*function naver_login() {
    // 네이버 로그인 객체 생성 - 올바른 ClientID와 콜백 URL 확인
    var naverLogin = new naver.LoginWithNaverId({
        clientId: "hMTcrqeBiDBKziWywM7w", 
        callbackUrl: "http://localhost:8080/realty/realty/naver_callback.jsp",
        isPopup: true,
        loginButton: {color: "green", type: 3, height: 40}
    });
    
    // 네이버 로그인 초기화
    naverLogin.init();
    }
*/



function naver_login(){
	 var naver_id_login = new naver_id_login("hMTcrqeBiDBKziWywM7w", "http://localhost:8080/realty/realty/naver_callback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8080");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
}



//카카오 로그인
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