<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/md_board.css?v=1">
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


<!-- md_board -->
    <section class="sub">
        <p>추천분양 정보 게시판</p>
        <div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
        <div class="info_board">
          <ul>
            <li>NO</li>
            <li>제목</li>
            <li>글쓴이</li>
            <li>조회수</li>
            <li>등록일</li>
          </ul>
          <ul style="display: none;"><li class="nodata">등록된 게시물이 없습니다.</li></ul>
          <ul class="data_view">
            <li>1</li>
            <li style="text-align: left;">게시물 제목출력</li>
            <li>관리자</li>
            <li>30</li>
            <li>2025-03-31</li>
          </ul>
        </div>
        <div class="info_pageing">
          <ol>
            <li>1</li>
            <li>2</li>
            <li>3</li>
          </ol>
        </div>
        <div class="info_search">
          <input type="text" class="search_text" placeholder="검색어를 입력하세요">
          <input type="button" value="검색" class="search_btn">
        </div>
    </section>
    
    
    
<!-- md_board -->

</main>
<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
</html>