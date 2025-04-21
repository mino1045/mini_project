<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=2">
<link rel="stylesheet" type="text/css" href="./css/member_join.css?v=3">
<style>
.html_message{
	margin-left: 200px;
    color: #ff6600;
}

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

<!-- login.jsp -->
<main>
<form id="f" method="POST" action="./joinok.do">
		<p>회원가입</p>
		<input type="hidden" name="login_channel" value="1">
				
		<div id="web_join">
			<a>이메일</a> <input type="text" name="memail" oninput="email_reg()" placeholder=" 이메일 주소를 입력해주세요." autocomplete="none" style="width:400px; float:left;">
			<input type="button" id="emailcheck" value="중복체크" class="mail_btn" onclick="email_check()">
			<input type="hidden" id="email_dup" value="N"> 
		</div>
		<div id="sns_join" style="display:none;">
			<a>SNS ID</a> <input type="text" id="mid" oninput="email_reg()" autocomplete="none" float:left;" readonly="readonly" >
		</div>
		
		
		<span id="email_message" class="html_message"></span>
		

		<div id="join_pass"><a>비밀번호</a> <input type="password" name="mpass" placeholder=" 10~16자(영문,숫자,특수 문자 조합)로 입력해주세요." autocomplete="none" oninput="pwck()"></div>
		<div id="join_pass_ck"><a>비밀번호 확인</a> <input type="password" id="mpass_check"  placeholder=" 비밀번호를 다시 한 번 입력해주세요." autocomplete="none" oninput="pwck()"></div>
		<span id="mpass_message" class="html_message"></span>

		
		<div><a>이름</a> <input type="text" oninput="nmck()" name="mname" placeholder=" 이름을 입력해주세요." autocomplete="none"></div>
		<span id="name_message" class="html_message"></span>
		
		<div><a>휴대폰번호</a> <input type="text" name="mtel" oninput="telck()" placeholder=" -없이 숫자만 입력해주세요." autocomplete="none"></div>
		<span id="tel_message" class="html_message"></span>
		<div><input type="checkbox" id="check_all"> <span>전체 동의</span> </div>
		<div class="line"></div>
		
	<div class="bottom">	
		<div class="box1"><input type="checkbox" name="age_terms" value="Y"> <a class="a1">(필수) <span>만 14세 이상입니다.</span></a></div>
		<div class="box2"><input type="checkbox" name="service_terms" value="Y"> <a class="a2">(필수) <span><u>이용약관</u>에 동의</span></a></div>
		<div class="box3"><input type="checkbox" name="privacy_terms" value="Y"> <a class="a3">(필수) <span><u>개인정보 수집 및 이용</u>에 동의</span></a></div>
		<section class="text1" id="ag">   </section>
		<div class="box4"><input type="checkbox" name="marketing_terms" value="Y"> <span>(선택) 마케팅 수신에 동의</span></div>
		<section class="text2" id="ag2">   </section>
	</div>
		<div><input type="button" value="가입 하기" onclick="join()"></div>
	</form>
</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script>
let kakao_id = sessionStorage.getItem("mid");
let kakao_nick = sessionStorage.getItem("mnick");
if(kakao_id != null){
	//스타일
	document.querySelector("#emailcheck").style.display = "none";
	document.querySelector("#web_join").style.display = "none";
	document.querySelector("#join_pass").style.display = "none";
	document.querySelector("#join_pass_ck").style.display = "none"; 
	document.querySelector("#sns_join").style.display = "block";
	document.querySelector(".html_message").style.display = "none"; 

	document.querySelector("#email_dup").value="Y";
	document.querySelector("#mid").value=kakao_id;
	f.login_channel.value = "2"
	f.memail.value = kakao_id;
	f.mpass.value = kakao_id;
	document.querySelector("#mpass_check").value=kakao_id;
}


</script>
<script src="./js/join.js?v=1"></script>
</html>