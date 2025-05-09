package realty;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface mapper {
	//reservation
	int reserved(int pidx,String mtel); //예약여부
	int reservation_delete(String mtel,int ridx); //예약리스트 삭제
	List<reservation_dto> reservation_list(String mtel); //예약리스트 출력
	
	//md_choice
	List<md_choice_dto> md_choice(int limit); //메인용
	int insert_mdc(md_choice_dto dto); //게시판 글쓰기
	List<md_choice_dto> mdc_board_list(Integer pageno); //게시판리스트
	List<md_choice_dto> mdc_board_search(String search);  //검색 데이터
	int mdc_board_count(); //게시물 수
	md_choice_dto md_board_view(int mcidx);//게시물 상세보기
	int view_count(int mcidx);
	
	 //게시판 검색
	
	//property
	List<property_dto> weekinfo(property_dto dto);
	property_dto property_dto(int pidx);
	int insert_res(reservation_dto dto);

	
	//member
	int member_join(member_dto m_dto);
	member_dto email_check(String memail);
	member_dto member_login(String memail,String mpass,String login_channel);
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