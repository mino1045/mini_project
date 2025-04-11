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
	<aside class="login_pg">	
		<p>이메일로 시작하기</p>
		<input type="hidden" id="login_channel" value="1">
		<div><input type="text" name="memail" placeholder="이메일 주소"></div>
		<div><input type="password" name="mpass" placeholder="비밀번호"></div>
		<div><input type="button" value="로그인" onclick="logincheck()"></div>
		<div><input type="button" id="kakao_login" value="카카오로그인" class="kakao_btn" onclick="kakao_login()"></div>
		<span id="login_message" class="html_message"></span>
		
		<div>
			<span onclick="location.href='./member_join.do';">회원가입</span>
			<span onclick="location.href='./email_search.do';">이메일 찾기</span>
			<span onclick="location.href='./passwd_search.do';">비밀번호 찾기</span>
		</div>
	</aside>
	<p id="token-result"></p>
</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.js"></script>
<script>
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
				document.querySelector("#login_channel").value = 2;

			  
			  
			  },
			  fail: function(error) {
				console.log(error);
			  },
			})		
		}	
	});
}
</script>




<script src="./js/login.js?v=2"></script>

</html>