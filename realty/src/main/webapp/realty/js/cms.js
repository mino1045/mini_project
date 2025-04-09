function counsel(){
	if(frm.psalsetype.value == null || 
	frm.ptype.value == null
	){
		console.log(frm.psalsetype.value)
		alert("물건형태는 1개 이상 선택이 필요합니다.");
		
	}else if(frm.cmsdate.value == null){
		alert("상담일시를 선택해주세요");
	}else if(frm.cmstext.value == null||
	frm.cmstext.value == ""){
		alert("상담내용을 입력해주세요");
	}else {
	frm.submit();
	}


};