<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담신청</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/counsel.css?v=3">
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
<!-- 상담신청 -->
<section class="sub">
<p>상담신청</p>
<form action="./counselok.do" method="POST" id="frm">
<div>
<span class="list_title">◎ <span style="color: blue;">상담자 정보</span></span>
<ul class="sub_ul">
<li>상담자명</li>  
<li><input type="text" name="mname" value="${se_mname}" class="sel_input" readonly></li> 
<li>이메일</li>    
<li><input type="text" name="memail" value="${se_email}" class="sel_input" readonly></li> 
<li>연락처</li>    
<li><input type="text" name="mtel" value="${se_mtel}" class="sel_input" readonly></li> 
<li>임대형태</li>    
<li>
<label><input type="checkbox" name="psalsetype" value="1" class="sel_check"> 공공임대</label>
<label><input type="checkbox" name="psalsetype" value="2" class="sel_check"> 민간분양</label>
<label><input type="checkbox" name="psalsetype" value="3" class="sel_check"> 민간임대</label>
<label><input type="checkbox" name="psalsetype" value="4" class="sel_check"> 기타</label>
</li>   
<li>주거형태</li>    
<li>
<label><input type="checkbox" name="ptype" value="1" class="sel_check"> 아파트</label>
<label><input type="checkbox" name="ptype" value="2"class="sel_check"> 빌라,단독주택</label>
<label><input type="checkbox" name="ptype" value="3" class="sel_check"> 사무실.상가.빌딩</label>
</li>       
<li>상담일시</li>    
<li>
<input type="date" name="cmsdate" class="sel_input2"> * 해당 일시에 맞춰서 담당자가 연락 드립니다.   
</li>    
<li>상담내용</li>    
<li style="height: 150px !important; line-height: 150px;">
<textarea class="sel_input3" placeholder="구체적인 상담내용을 입력해 주세요" name="cmstext"></textarea>
</li>
</ul>
</div>
<div><input type="button" value="상담신청" onclick="counsel()"></div>
</form>

</section>
<!-- 상담신청 -->
</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script>

</script>
<script src="./js/cms.js?v=2"></script>
<script src="./js/login.js?v=2"></script>
</html>