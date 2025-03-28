package realty;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
	

}