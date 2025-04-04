package realty;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("realty_dao")
public class realty_dao implements mapper{
	
	@Resource(name = "template")
	public SqlSessionTemplate st;
	
	/////member_join
	@Override
	public int member_join(member_dto m_dto) {
		int result = this.st.insert("member_join",m_dto);
		return result;
	}
	

	/////member_login
	@Override
	public member_dto member_login(String memail, String mpass) {
		Map<String, String> loginfo = new HashMap<String, String>();
		loginfo.put("memail", memail);
		loginfo.put("mpass", mpass);
	
		member_dto result = this.st.selectOne("member_login",loginfo);
		return result;
	}
	
	/////email_check
	@Override
	public member_dto email_check(String memail) {
		member_dto email_used = this.st.selectOne("email_check",memail);
		return email_used;
	}

	/////search_email
	@Override
	public member_dto search_email(member_dto dto) {
		Map<String, String> getemailinfo = new HashMap<String, String>();
		getemailinfo.put("mtel", dto.getMtel());
		getemailinfo.put("mname", dto.getMname());
		
		member_dto result = this.st.selectOne("search_email",getemailinfo);
		
		return result;
	}


	@Override
	public member_dto search_pass(member_dto dto) {
		Map<String, String> getpassinfo = new HashMap<String, String>();
		getpassinfo.put("mtel", dto.getMtel());
		getpassinfo.put("memail", dto.getMemail());
		
		member_dto result = this.st.selectOne("search_pass",getpassinfo);

		return result;
	}


	@Override
	public int update_pass(String memail, String mpass) {
		Map<String, String> update_pass = new HashMap<String, String>();
		update_pass.put("memail", memail);	
		update_pass.put("mpass", mpass);	
		int result = this.st.update("update_pass",update_pass);
		
		return result;
	}


	@Override
	public int insert_cms(cms_dto dto) { //cidx 값
		return this.st.insert("insert_cms",dto);
	}
	
    
	public void insert_cms_trans(cms_dto dto,List<Integer> ptype,List<Integer> psalsetype) {
		
	int cidx = dto.getCidx();//위에서 실행된 cdix 선언
	System.out.println("cidx 값 선언" + cidx);
		if(cidx < 0) {
			System.out.println("dto.getCidx() 오류임");
			
		}else {
			insert_cms_property_sale(cidx, psalsetype);
			insert_cms_property_type(cidx, ptype);
			System.out.println("dao에 cidx값 넣기" + cidx);
		}
	}

	@Override
	public int insert_cms_property_type(int cidx, List<Integer> ptype) {
		Map<String, Object> cms_property = new HashMap<String, Object>();
		cms_property.put("cidx", cidx);
		cms_property.put("ptype", ptype);
		
		int result = this.st.insert("insert_cms_property_type",cms_property);
		return result;
	}


	@Override
	public int insert_cms_property_sale(int cidx, List<Integer> psalsetype) {
		Map<String, Object> cms_property = new HashMap<String, Object>();
		cms_property.put("cidx", cidx);
		cms_property.put("psalsetype", psalsetype);
		
		int result = this.st.insert("insert_cms_property_sale",cms_property);
		return result;
	}


	@Override
	public List<property_dto> weekinfo(property_dto dto) {
		List<property_dto> result = this.st.selectList("weekinfo",dto);
		return result;
	}


	@Override
	public property_dto property_dto(String pidx) {
		property_dto result = this.st.selectOne("week_tails",pidx);
		return result;
	}


	@Override
	public int insert_res(reservation_dto dto) {
		int result = this.st.insert("insert_res", dto);
		return result;
	}

	//md_choice_write
	@Override
	public int insert_mdc(md_choice_dto dto) {
		int result = this.st.insert("insert_mdc",dto);
		return result;
	}

	//한 페이지에 출력할 게시물의 수 
	Integer pageNum = 10;
	
	//총 게시물 수 
	@Override 
	public int mdc_board_count() {
		int count = this.st.selectOne("mdc_board_count");
		return count;
	}
	
	//게시판 리스트 출력
	@Override
	public List<md_choice_dto> mdc_board_list(Integer pageno) {
		int startPage = this.pageNum * (pageno - 1);
		Map<String, Integer> paging = new HashMap<String, Integer>();
		paging.put("startPage", startPage);
		paging.put("endPage", this.pageNum);
	
		List<md_choice_dto> result = this.st.selectList("mdc_board_list", paging);
		return result;
	}

	//검색 데이터 출력
	@Override
	public List<md_choice_dto> mdc_board_search(String search) {
		List<md_choice_dto> result = this.st.selectList("mdc_board_search",search);
		return result;
	}


	@Override
	public md_choice_dto md_board_view(int mcidx) {
		md_choice_dto result = this.st.selectOne("md_board_view",mcidx);		
		return result;
	}
	

	



}