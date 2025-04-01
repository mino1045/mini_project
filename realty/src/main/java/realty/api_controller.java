package realty;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*", allowedHeaders = "*") //CORS 
@RestController

public class api_controller {
	@Resource(name = "member_dto")
	private member_dto m_dto;
	
	@Resource(name = "cms_dto")
	private cms_dto c_dto;
	
	@Resource(name = "realty_dao")
	private realty_dao dao;


}
