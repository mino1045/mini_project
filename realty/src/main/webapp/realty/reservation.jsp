<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Date date = new Date();
SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
String today = sd.format(date);

Calendar cal = Calendar.getInstance();
cal.add(Calendar.DATE, 1);
String min_date = sd.format(cal.getTime());

cal.add(Calendar.MONTH, 6);
String max_date = sd.format(cal.getTime());


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모댈 하우스 사전 방문예약</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/reservation.css?v=4">
</head>
<body>
<!-- top -->
<cr:import url="./top.jsp"></cr:import>




<main>
<!-- reservation -->
<section class="sub">
<p>모델 하우스 사전 방문예약</p>
<div>
<span class="list_title">
<span style="color: blue;">분양정보</span>
<span style="color: red;">LH센트럴힐(공공임대)</span>
</span>
<ul class="sub_ul">
<li>방문일시</li>    
<li><input type="date" class="sel_input" name="rdate" min="<%=min_date%>" max="<%=max_date%>"  ></li> 
<li>방문시간</li>    
<li>
<select class="sel_input2">
    <option value="">방문시간선택</option>
    <option value="09:00">09:00</option>
    <option value="11:00">11:00</option>
    <option value="13:00">13:00</option>
    <option value="15:00">15:00</option>
    <option value="17:00">17:00</option>
</select> * 해당 시간에 맞춰서 방문해 주셔야 합니다.
</li> 
<li>방문자명</li>    
<li><input type="text" class="sel_input" readonly></li> 
<li>방문인원</li>    
<li>
<label><input type="radio" class="sel_check" checked> 1명</label>
<label><input type="radio" class="sel_check"> 2명</label> ※ 방문인원은 최대 2명까지 입니다.
</li>   
<li>연락처</li>    
<li><input type="text" class="sel_input" readonly></li>       
</ul>
</div>
<div>
<input type="button" value="방문 예약등록" onclick="reservation()">
</div>
</section>
<!-- reservation -->
</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script>

</script>

</html>