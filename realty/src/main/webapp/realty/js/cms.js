function counsel(){
	if(frm.psalsetype.value == ""){
		alert("임대형태를 1개 이상 선택해주세요");
	}else if(frm.ptype.value ==""){
		alert("주거형태를 1개 이상 선택해주세요");
	}else if(frm.cmsdate.value ==""){
		alert("상담일시를 선택해주세요");
	}else if(frm.cmstext.value == ""){
		alert("상담내용을 입력해주세요");
	}else {
	frm.submit();
	}


};