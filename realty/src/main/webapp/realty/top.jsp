<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!--top -->
 <!--최상단-->
 <header>
  <div class="top_banner"></div>
 </header>
  <!--최상단끝-->
 <!--메뉴-->
 <nav>
  <div class="menus">
    <ul class="menus_ul">
      <li><img src="./logo/e_click_logo.png"></li>
      <li>일반매물</li>
      <li>추천매물</li>
      <li>중계의뢰</li>
      <li>상담신청</li>
      <li>업체의뢰</li>
      <li>의뢰현황</li>
      <li class="logins">
        <cr:choose>
        <cr:when test="${not empty sessionScope.memail}">
        <a href="./logout.do"> ${sessionScope.memail}님 환영합니다. [로그아웃]</a>
        </cr:when>
        <cr:otherwise>
        <span title="로그인"><a href="./login.do" title="회원가입"><img src="./ico/login.svg"></a></span>
        <span title="회원가입"><a href="./member_join.do" title="회원가입"><img src="./ico/membership.svg"></a></span>
        </cr:otherwise>
        </cr:choose>
      </li>
    </ul>
  </div>
 </nav>
  <!--메뉴끝-->
  <!--top끝-->