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
			System.out.println("서비스 dao 트랜잭션 통과?");
		} catch (Exception e) {
			System.out.println("트랜젝션 실패");
			throw e;
		}

	}


}
