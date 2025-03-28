<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>패스워드 찾기 및 변경</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/search_myinfo.css?v=2">
</head>

<body>
<!-- top -->
<cr:import url="./top.jsp"></cr:import>
 <main>
 
<section class="sub">
<div>
<ul>
<li>회원가입 정보에 따른 패스워드 변경</li>
</ul>
</div>
<div class="text1 repass">
<div><input type="password" name="mpass" placeholder="최소 10 ~ 16자 (영문,숫자,특수 문자 조합)로 입력해주세요." class="passin" autocomplete="none" oninput="pwck()"></div>
<div><input type="password" id="mpass_check" placeholder="동일한 비밀번호를 입력하세요" class="passin" autocomplete="none" oninput="pwck()"></div>
</div>
<span id="mpass_message"></span>
<div><input type="button" value="비밀번호 변경" class="search_submit" onclick="update_pass()"></div>
</section>


</main>
 
<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script src="./js/search.js?v=3"></script>
</html>