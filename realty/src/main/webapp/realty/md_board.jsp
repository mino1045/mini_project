<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
Date date = new Date();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=<%=date%>">
<link rel="stylesheet" type="text/css" href="./css/md_board.css?v=<%=date%>">
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
          <cr:set var="ino" value="${total-userpage}"/>
          <cr:if test="${total == 0}">
          <ul><li class="nodata">등록된 게시물이 없습니다.</li></ul>
          </cr:if>
          <cr:forEach var="b" items="${boardList}" varStatus="bidx">
          <ul class="data_view">

            <li>${ino-bidx.index}</li>
            <li style="text-align: left;">
            <a href="./md_board_view.do?mcidx=${b.mcidx}">${b.mc_title}</a></li>
            <li>관리자</li>
            <li>${b.view}</li>
            <li>${b.mcdate}</li>

          </ul>
          </cr:forEach>
        </div>
        <div class="info_pageing">
          <ol>
             <cr:set var="pageidx" value="${total / 10 + (1-((total/10)%1)) % 1}"/>
      		 <cr:forEach var="no" begin="1" end="${pageidx}" step="1">
            <li onclick="pg('${no}')">${no}</li>
            </cr:forEach>

          </ol>
        </div>
        <div class="info_search">
          <input type="text" class="search_text" placeholder="검색어를 입력하세요" id="search">
          <input type="button" value="검색" class="search_btn" onclick="search()" >
        </div>
        <form action="./md_board.do" method="get" id="search_form">
        <input type="hidden" name="search">
        </form>
    </section>
    
    
    
<!-- md_board -->

</main>
<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script>
function pg(no) {
	location.href = './md_board.do?pageno='+no;
}

function search() {
	var keyword = document.getElementById("search").value;
	search_form.search.value = keyword;
	search_form.submit();
	
	
}
</script>
</html>