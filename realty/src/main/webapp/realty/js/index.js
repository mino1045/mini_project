function logout(){
	
	if(confirm("로그아웃 하시겠습니까?")){
		  window.location.href = "./logout.do";
	} else {
		return false;
	}

	
	
}