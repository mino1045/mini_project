<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm">
날짜선택 : <input type="date" name="rdate"><br> <!--2025-04-02  -->
예매시간 : <select name="rtime">
<option value="">시간선택</option>
<option value="09">09:00</option>
<option value="11">11:00</option>
<option value="14">14:00</option>
<option value="16">16:00</option>
<option></option>
</select>
<input type="button" value="에매" onclick="datecheck()">

</form>
</body>
<script>
function datecheck() { 
var edate = frm.rdate.value; //사용자 선택
var date = new Date(); //오늘
var sdate = date.toISOString().split("1"[0]);

if(edate < sdate){
	alert("날짜 선택을 잘못 하셨습니다");
}else {
	var ss = String(date.getMinutes().padStart(2,"0"));
	var t = date.getHours() + "" + ss; //현재시간
	var ut = frm.rtime.value; //사용자가 선택한 시간
	
	if(t > ut){
		alert("현재시간 이후로 선택해주세요");
	} else {
		alert("예매하시겠습니까?");
	}
	
	conlsole.log(date.getTime()); //서버시간가져오기 
	conlsole.log(date.getHours()); //현재 시각 
}

	
	
/* 아래 방법은 핸들링하기 까다로움
//날짜핸들링
var day = new Date();
var edate = day.getFullYear() +""+ day.getMonth()+1 +""+ day.getDate(); //년월일 다 그냥 더하면 숫자라 계산이 됨 ""로 문자화

//1월이 0으로 계산되어서 +1 필요 
var sdate = frm.rdate.value.replaceAll("-",""); //2025-04-02 처럼 표시되는 날짜형식에서 -를 뺌
*/
	
}
</script>
</html>