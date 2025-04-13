function reservation(){
	var vd = document.getElementById("visit_date").value;
	var vt = document.getElementById("vt").value;
	

	var nov = document.getElementsByName("nov");;
	var novselected = [];
	var w = 0;
	while(w < nov.length){
		if(nov[w].checked){
		novselected.push(nov[w].value);
		}
;
		w++;
	}
	
	frm.visit_date.value = vd;
	frm.visit_time.value = vt;
	frm.visitors.value = novselected;
	console.log(frm.visitors.value);
	
	
	if(!frm.visit_date.value){
		alert("방문일시를 선택해주세요");
	}else if(!frm.visit_time.value){
		alert("방문시간을 선택해주세요");
	}else {
	frm.submit();
	}

}