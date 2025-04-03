<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/md_board_view.css?v=1">
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
<main>


<!-- md_board_view -->
    <section class="sub">
        <p>추천분양 정보 게시판</p>
        <div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
        <div class="info_board">
          <ul>
            <li>제&nbsp;&nbsp;&nbsp;목</li>
            <li>제목이 출력되는 곳</li>
            <li>글쓴이</li>
            <li>글쓴이가 출력되는 곳</li>
            <li>등록일</li>
            <li>2025-03-31</li>
            <li>조회수</li>
            <li>200</li>
            <li class="litext">내&nbsp;&nbsp;&nbsp;용</li>
            <li class="litext">
                <div class="textarea">
                    내용이 출력 되는 곳
                </div>
            </li>
          </ul>
        </div>
        <div class="board_btn">
            <input type="button" value="목&nbsp;&nbsp;&nbsp;록" class="btns">
        </div>
    </section>
<!-- md_board view-->



</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script>

</script>
<script src="./js/cms.js?v=2"></script>
<script src="./js/login.js?v=2"></script>
</html>