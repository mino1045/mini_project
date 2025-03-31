package realty;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface mapper {
	//property
	List<property_dto> weekinfo(property_dto dto);
	property_dto property_dto(String pidx);

	
	//member
	int member_join(member_dto m_dto);
	member_dto email_check(String memail);
	member_dto member_login(String memail,String mpass);
	member_dto search_email(member_dto dto);
	member_dto search_pass(member_dto dto);
	int update_pass(String memail, String mpass);
	
	//cms
	int insert_cms(cms_dto dto);
	int insert_cms_property_type(@Param("cidx")int cidx,
			@Param("ptype") List<Integer> ptype );
	int insert_cms_property_sale(@Param("cidx")int cidx,
			@Param("psalsetype") List<Integer> psalsetype );
}