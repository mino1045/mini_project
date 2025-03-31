package realty;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class realty_service {
	
	@Autowired
	private realty_dao dao;
	
	@Transactional
	public void insert_cms_dao(cms_dto dto,List<Integer> ptype,List<Integer> psalsetype) {
		try {
			dao.insert_cms(dto);			
			dao.insert_cms_trans(dto, ptype, psalsetype);
		} catch (Exception e) {
			throw e;
		}
	}
	
	

}
