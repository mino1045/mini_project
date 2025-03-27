package realty;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface mapper {
	
	public int member_join(member_dto m_dto);
	member_dto email_check(String memail);
	member_dto member_login(String memail,String mpass);
	member_dto search_email(member_dto dto);

}