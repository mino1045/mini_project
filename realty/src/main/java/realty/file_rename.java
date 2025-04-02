package realty;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository("file_rename")
public class file_rename {
	
	//새파일명 년월일시분(202504020000 + 4자리난수+ .확장자)
	public String rename(String file) {
		int lio = file.lastIndexOf(".");
		String fnm_ex = file.substring(lio); //확장자
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		String fnm_date = sdf.format(now); //날짜
		
		int no = (int) Math.ceil(Math.random()*1000);
		
		String file_new = fnm_date + no + fnm_ex;
		return file_new;
	}

}
