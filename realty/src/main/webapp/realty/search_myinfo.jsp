<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>이메일 찾기</title>
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
<li>회원가입된 이메일 확인</li>
</ul>
</div>
<div class="text1">
<div>가입하신 이메일 정보 : ${memail}</div>
</div>
<div><input type="button" value="정보확인" class="search_submit" onclick="gologin()"></div>
</section>
</main>
 
<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script src="./js/search.js?v=2"></script>
</html>