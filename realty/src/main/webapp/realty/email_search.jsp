<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/email_search.css?v=2">
</head>
<body>
<!-- top -->
<cr:import url="./top.jsp"></cr:import>

<!-- email_search.jsp -->
<main>
<section class="sub">
<div>
<ul>
<li>이메일 찾기</li>
<li>비밀번호 찾기</li>
</ul>
</div>
<div class="text1">
<div><input type="text" name="mname" placeholder="이름을 입력하세요"></div>
<div><input type="text" name="mtel" placeholder="휴대폰 번호는 - 빼고 숫자만 입력하세요" maxlength="11"></div>
</div>
<div><input type="button" value="이메일 찾기" onclick="search_email()"></div>
</section>
</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script src="./js/search.js?v=2"></script>
<script>
${msg}
</script>
</html>