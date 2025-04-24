<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/login.css?v=2">
<style>
.box {
   width: 800px;
   height: 300px;
   border: 1px solid black;
   overflow: auto;
}
</style>

</head>
<body>
<!-- top -->
<cr:import url="./top.jsp"></cr:import>

<!-- login -->
<main>
		<form id="frm" method="POST" action="./loginok.do">
		<aside class="login_pg">	
		<p>이메일로 시작하기</p>

		<input type="hidden" name="login_channel" value="1">
		<input type="hidden" name="kakao_id" value="">
		<input type="hidden" name="kakao_nicknm" value="">
		<div><input type="text" name="memail" placeholder="이메일 주소"></div>
		<div><input type="password" name="mpass" placeholder="비밀번호"></div>
		<div><input type="button" value="로그인" onclick="logincheck()"></div>
		<div><input type="button" value="카카오로그인" class="kakao_btn" onclick="kakao_login()"></div>
		<div id="naverIdLogin"></div>
		<!-- <div><input type="button" value="네이버로그인" class="naver_btn" id="naver_id_login" onclick="naver_login()"></div> -->
		<span id="login_message" class="html_message"></span>

		<div>
			<span onclick="location.href='./member_join.do';">회원가입</span>
			<span onclick="location.href='./email_search.do';">이메일 찾기</span>
			<span onclick="location.href='./passwd_search.do';">비밀번호 찾기</span>
		</div>
	</aside>
	</form>

<p id="token-result"></p>
</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script type="./js/jquery.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>

window.name='opener';
var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "hMTcrqeBiDBKziWywM7w",
		callbackUrl: "https://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port) + "/callback.html",
		isPopup: true,
		loginButton: {color: "green", type: 3, height: 60}
	}
);
/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
naverLogin.init();

/* (4-1) 임의의 링크를 설정해줄 필요가 있는 경우 */
$("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());

/* (5) 현재 로그인 상태를 확인 */
window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
			setLoginStatus();
		}
	});
});

/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
function setLoginStatus() {
	var profileImage = naverLogin.user.getProfileImage();
	var nickName = naverLogin.user.getNickName();
	var imageViewer = '';
	if (profileImage) {
		imageViewer += '<br><br><img src="' + profileImage + '" height=50 /> <p>';
	}
	$("#naverIdLogin_loginButton").html(imageViewer + nickName + '님 반갑습니다.</p>');
	$("#gnbLogin").html("Logout");
	$("#gnbLogin").attr("href", "#");
	/* (7) 로그아웃 버튼을 설정하고 동작을 정의합니다. */
	$("#gnbLogin").click(function (e) {
		e.preventDefault();
		naverLogin.logout();
		location.replace('./realty/index.do');
	});
}


</script>
<!-- 네이버 콜백 처리를 위한 스크립트 -->
<script>
// naver_callback.jsp에서 호출될 함수 (부모 창에서 처리)
function processNaverLogin(id, nickname, email) {
    // 로그인 정보 세팅
    document.getElementById('frm').login_channel.value = "3"; // 네이버 로그인 채널
    document.getElementById('frm').naver_id.value = id;
    document.getElementById('frm').naver_nickname.value = nickname;
    document.getElementById('frm').naver_email.value = email;
    document.getElementById('frm').memail.value = email; // 이메일 필드에도 설정
    
    // 폼 제출
    document.getElementById('frm').submit();
}
</script>

<!-- <script>
const naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "hMTcrqeBiDBKziWywM7w",
            callbackUrl: "http://localhost:8080/realty/realty/naver_callback.jsp",
            loginButton: {color: "#03C75A", type: 3, height: 40}
        }
    );
naverLogin.init();
naverLogin.getLoginStatus(function (status) {
  if (status) {
      const nickName=naverLogin.user.getNickName();
      const age=naverLogin.user.getAge();
      const birthday=naverLogin.user.getBirthday();
      
      naverLogin.reprompt();
      return ; 
      setLoginStatus();
      
/*       if(nickName===null||nickName===undefined ){
        alert("별명이 필요합니다. 정보제공을 동의해주세요.");
        naverLogin.reprompt();
        return ;  
     }else{
      
     } */
}
});
console.log(naverLogin);

function setLoginStatus(){

  const message_area=document.getElementById('message');
  message_area.innerHTML=`
  <h3> Login 성공 </h3>
  <div>user Nickname : ${naverLogin.user.nickname}</div>
  <div>user Age(범위) : ${naverLogin.user.age}</div>
  <div>user Birthday : ${naverLogin.user.birthday}</div>
  `;

  const button_area=document.getElementById('button_area');
  button_area.innerHTML="<button id='btn_logout'>로그아웃</button>";

  const logout=document.getElementById('btn_logout');
  logout.addEventListener('click',(e)=>{
    naverLogin.logout();
location.replace("http://localhost:8080/realty/realty/index.do");
  })
}

</script> -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.js"></script>
<script src="./js/login.js?v=1"></script>

</html>