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

.naver_btn {
   background-color: #03C75A;
   color: white;
   border: none;
   padding: 10px;
   cursor: pointer;
   width: 100%;
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
				   		<div><input type="button" value="네이버로그인" class="naver_btn" onclick="naverLoginDirect()"></div>
				   
				   <!-- <div id="naver_id_login"></div> -->
		
<!-- 		<div><input type="button" value="네이버로그인" class="naver_btn" id="naver_id_login" onclick="naver_login()"></div>
 -->		<span id="login_message" class="html_message"></span>

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
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.js"></script>
<script src="./js/login.js?v=4"></script>

</html>