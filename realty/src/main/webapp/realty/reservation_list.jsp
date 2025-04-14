<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/reservation_list.css?v=5">
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
<!-- reservation_list -->
    <section class="sub">
        <p>모델 하우스 방문 예약 리스트</p>
        <div class="boards">모델 하우스 방문 예약한 정보를 한눈에 확인 하실 수 있습니다.</div>

        
        <div class="info_board">
          <ul>
            <li>NO</li>
            <li>아파트명</li>
            <li>방문일자</li>
            <li>방문시간</li>
            <li>인원수</li>
            <li>취소</li>
          </ul>
          <cr:if test="${empty res_list}">
          <ul style="display: block;"><li class="nodata">등록된 방문 예약이 없습니다.</li></ul>
        	</cr:if>
          <cr:forEach var="r" items="${res_list}" varStatus="status">
          <ul class="data_view">
            <li>${total - status.index}</li>
            <li style="text-align: left;">${r.pname}</li>
            <li>${r.visit_date}</li>
            <li>${r.visit_time}</li>
            <li>${r.visitors}</li>
            <li><input type="button" value="취소" class="cancel_btn" onclick="res_delete(${r.ridx})"></li>
          </ul>
          </cr:forEach>
        </div>
        
    </section>
<!-- reservation_list -->
</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script>
function res_delete(ridx) {
	console.log(ridx);
	
	fetch("./reservation_delete.do",{
	method : "POST",
	headers : {"Content-Type": "application/x-www-form-urlencoded"},
	body : "ridx="+ridx

	})
	.then(response => response.text())
	.then(result => {
		if(result == "ok"){
			alert("예약이 삭제되었습니다.");
            location.reload();
		} else {
			alert("예약 삭제에 실패하였습니다.");
		}
		
	}).catch(error => {
		alert("서버 오류");
	})

	}
</script>
<script src="./js/cms.js?v=2"></script>

</html>