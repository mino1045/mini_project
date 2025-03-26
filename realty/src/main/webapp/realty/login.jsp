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
		<div><input type="text" name="memail" placeholder="이메일 주소"></div>
		<div><input type="password" name="mpass" placeholder="비밀번호"></div>
		<div><input type="button" value="로그인" onclick="logincheck()"></div>
		<span id="login_message" class="html_message"></span>
		<div>
			<span>이메일 찾기</span>
			<span>비밀번호 찾기</span>
		</div>
	</aside>
</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script src="./js/login.js?v=2"></script>
</html>