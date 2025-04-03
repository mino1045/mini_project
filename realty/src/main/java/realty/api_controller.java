package realty;

import java.io.File;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@CrossOrigin(origins = "*", allowedHeaders = "*") //CORS 
@RestController

public class api_controller {
	@Resource(name = "realty_dao")
	private realty_dao dao;
	
	@Resource(name = "file_rename")
	file_rename fnm;
	
	PrintWriter pw = null;
	String result = null;
	int callback = 0;
	
	
	@PostMapping("/realty/mdb_ok.do")
	public String mdb_ok(@ModelAttribute(name = "dto") md_choice_dto dto,
			@RequestParam("file") MultipartFile file,HttpServletRequest req) throws Exception  {
		
			String file_new = null;
			
		if (file.getSize() > 0) {
			file_new = this.fnm.rename(file.getOriginalFilename());
			String url = req.getServletContext().getRealPath("/upload/");
			FileCopyUtils.copy(file.getBytes(), new File(url + file_new)); //디렉토리에 파일 저장
			
			dto.setFile_new(file_new); //새파일명
			dto.setFile_name(file.getOriginalFilename()); //원본파일명
			dto.setFile_url("/upload/" + file_new); //웹디렉토리경로

			this.callback = this.dao.insert_mdc(dto);
			
			if(this.callback > 0) { 
				return "ok"; //파일업로드 성공
			} else {
				return "error"; //파일업로드 실패
			}
		} else {
			return "error";  //파일없음
		}
	}


}
