<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금주 분양 매물 정보</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/week_tails.css?v=1">
</head>
<cr:if test="${not empty msg}">
        <script type="text/javascript">
        console.log("${msg}")
            alert("${msg}");
        </script>
</cr:if>
</head>
<body>
<!-- top -->
<cr:import url="./top.jsp"></cr:import>




<main>
<!-- week_tails -->
	<div class="weektails">
		<p>분양정보</p>
		<div id="weektails">
			<p>${pidx_list.pname}</p>
            <ul>
                <li>종류</li>
                <li>${pidx_list.ptype} | ${pidx_list.psalsetype} </li>
                <li>주소</li>
				<li>${pidx_list.paddress}</li>
                <li>규모</li>
				<li>총 ${pidx_list.punit}세대 | 총 ${pidx_list.pblocks}개동</li>
                <li>시기</li>
				<li>${pidx_list.psaledate} | ${pidx_list.pmoveindate}</li>
                <li>난방구조</li>
				<li>${pidx_list.pheating}</li>
                <li>건설사</li>
				<li>${pidx_list.pbuilder}</li>
                <li>사진정보</li>
				<li><img src="./room/${pidx_list.pmig}"></li>
            </ul>
		</div>
			<%-- <cr:if test="${login}"></cr:if> --%>
		<cr:choose>
		<cr:when test="${count == 0}">
        <div><button class="btn_css" onclick="reservation()">방문예약</button></div>
        <form action="./reservation.do" method="POST" id="frm">
        <input type="hidden" name="pidx" value="${pidx_list.pidx}">
        <input type="hidden" name="pname" value="${pidx_list.pname}">
       	</form>
       	</cr:when>
  		<cr:when test="${not empty count}">
	    <div><button class="btn_close">방문예약완료</button></div>
	    </cr:when>
		</cr:choose>
	</div>
<!-- week_tails -->
</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script>
function reservation() {
	frm.submit()
	
}
</script>

</html>