package realty;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class member_controller {
	
	@Resource(name = "realty_dao")
	private realty_dao dao;
	
	PrintWriter pw = null;
	
	@Autowired
	private realty_service rs;
	


	//예약리스트 삭제
	@PostMapping ("/realty/reservation_delete.do")
	public String reservation_delete(HttpSession se,@RequestParam int ridx, HttpServletResponse res) throws IOException {
		System.out.println("삭제번호" + ridx);
		
		String mtel = (String) se.getAttribute("mtel");
		int result = dao.reservation_delete(mtel, ridx);
	

		this.pw = res.getWriter();
		if(result > 0) {
			this.pw.write("ok");
		} else {
			this.pw.write("error");
		}
		return null;
	}
	
	
	
	//예약리스트
	@GetMapping ("/realty/reservation_list.do")
	public String reservation_list (Model m ,HttpSession se) {

		String mtel = (String) se.getAttribute("mtel");

		List<reservation_dto> res_list = dao.reservation_list(mtel);
		
		if(!res_list.equals("") || !res_list.equals(null)) {
			m.addAttribute("res_list",res_list);
			return null;
		} else {
			
			return null;
		}
	}
	
	//게시물 상세정보
	@GetMapping("/realty/md_board_view.do")
	public String md_board_view(@ModelAttribute(name = "dto") md_choice_dto dto, Model m) {
		
		int mcidx = dto.getMcidx();
		md_choice_dto detail = dao.md_board_view(mcidx);

;		m.addAttribute("dto", detail);
		return null;
	}
	
	
	
	//md_choice 게시판
	@GetMapping("/realty/md_board.do")
	public String md_board (Model m,
			@RequestParam(defaultValue = "",required = false)String search, 
			@RequestParam(defaultValue = "1", required = false) Integer pageno) {
		
		//총 게시물 수 
		int total = this.dao.mdc_board_count();
		
	    if (pageno < 1) {
	        pageno = 1;
	    }

		int userpage = 0;
		if(pageno == 1) {
			userpage = 0;
		} else {
			userpage = (userpage - 1) * 10;
		}
		m.addAttribute("userpage",userpage);
		
		//게시판 리스트
		List<md_choice_dto> boardList = null;
		if (search.equals("")) { //검색어가 없다면
			 boardList = dao.mdc_board_list(pageno);
		} else {
			boardList = dao.mdc_board_search(search);
		}
		m.addAttribute("boardList",boardList);
		m.addAttribute("total",total);
		m.addAttribute("search",search);
		
		
		return null;
	}

	

	//mdchoice글쓰기 링크
	@GetMapping("/realty/md_board_write.do")
	public String md_board_write()  {
		return null;
	}
	
	
	//예약확인
	@PostMapping("/realty/reservation_check.do")
	public String insert_res (@ModelAttribute(name = "dto") reservation_dto dto, Model m ,HttpSession se) {

		dto.setMname((String) se.getAttribute("mname"));
		dto.setMtel((String) se.getAttribute("mtel"));
		int result = dao.insert_res(dto);
		
		String msg = null;
		
		if(result > 0) {
			m.addAttribute("dto",dto);
			return null;
		} else {
			msg = "alert('방문예약 등록에 실패했습니다. 다시 시도해주세요')";
			m.addAttribute(msg);
		}
		return null;
	}
	
	

	
	//예약
	@PostMapping("/realty/reservation.do")
	public String reservation (@RequestParam("pidx") int pidx,@RequestParam("pname") String pname, Model m) {
		
		//예약여부
		

		m.addAttribute("pidx",pidx);
		m.addAttribute("pname",pname);
		return null;
	}
	
	///상세정보
	@GetMapping("/realty/week_tails.do")
	public String week_tails(@RequestParam("pidx") int pidx,property_dto dto, Model m,HttpSession se) {

		Boolean login = (Boolean) se.getAttribute("login");

		
		if (login == null || !login ) {
			return "realty/login";

		} else {

			int count = this.dao.reserved(pidx, (String) se.getAttribute("mtel"));
			property_dto pidx_list = dao.property_dto(pidx);
			
			System.out.println(pidx + "건물번호");
			System.out.println(count + "카운트");

			
			m.addAttribute("count",count);
			m.addAttribute("pidx_list", pidx_list);
			return null;
		}
	}
	
	///상담신청완료
	@PostMapping("/realty/counselok.do")
	public String counsel_insert (@ModelAttribute(name = "dto") cms_dto dto, Model m) {

		String msg = "";
		try {
			rs.insert_cms_dao(dto, dto.getPtype(), dto.getPsalsetype());

			System.out.println("쿼리문 성공");
			msg = "담당자가 확인 후 해당 상담일시에 맞춰서 연락 드립니다.";
			m.addAttribute("msg", msg);			
			return "realty/index";

		} catch (Exception e) {
			System.out.println("컨트롤 실패");
			msg = "alert('ecxeption 발동.')";

			return null;
		}
	}
	
	
	
	
	
	///상담신청
	@GetMapping("/realty/counsel.do")
	public String counsel(HttpSession se, Model m) {

		Boolean login = (Boolean) se.getAttribute("login");
		String msg = "";
		
		if (login == null || !login ) { //세션 없으면 로그인 화면으로
			msg = "alert('회원만 상담신청이 가능합니다');";
			return "realty/login";
		} else {

			m.addAttribute("se_email",se.getAttribute("memail")) ;
			m.addAttribute("se_mname",se.getAttribute("mname")) ;
			m.addAttribute("se_mtel",se.getAttribute("mtel")) ;
			return null;
		}
	}

	
	
	///비밀번호 변경
	@PostMapping("/realty/update_pass.do")
	public void search_mypassok(HttpSession se, HttpServletResponse res, @RequestParam("mpass") String mpass) throws Exception  {
		res.setContentType("text/html;charset=utf-8");
		String memail = (String) se.getAttribute("pw_memail");
		int result = this.dao.update_pass(memail,mpass);
		
		this.pw = res.getWriter();
		
		if (result > 0) {
			this.pw.write("ok");
		} else {
			this.pw.write("false");
		}
		se.invalidate();
		this.pw.close();
	}
	
	
	
	
	
	/////비밀번호찾기ok
	@GetMapping("/realty/search_mypass.do")
	public String search_mypass(HttpSession se, Model m)  {
		String memail = (String) se.getAttribute("pw_memail");
		if (memail != null) {
			m.addAttribute("memail",memail);

		} else {
			m.addAttribute("error","회원정보가 없습니다.");
		}
	
		return "realty/search_mypass";
	}
	
	
	
	
	//비밀번호 찾기
	@PostMapping("/realty/search_pass.do")
	public String search_pass (@ModelAttribute(name = "dto") member_dto dto, HttpServletResponse res,HttpSession pw) throws Exception {

		res.setContentType("text/html;charset=utf-8");
		this.pw = res.getWriter();
		member_dto result = this.dao.search_pass(dto);
		
		if(result != null) {
			pw.setAttribute("pw_memail", result.getMemail());
			this.pw.write("ok");
		} else {
			this.pw.write("false");
		}
		this.pw.close();
		return null;
	}
	
	

	/////이메일찾기성공
	@GetMapping("/realty/search_myinfo.do")
	public String search_myinfo(HttpSession se, Model m)  {
		String memail = (String) se.getAttribute("memail");
		if (memail != null) {
			m.addAttribute("memail",memail);
		} else {
			m.addAttribute("error","회원정보가 없습니다.");
		}
	
		return "realty/search_myinfo";
	}


	//이메일 찾기
	@PostMapping("/realty/search_email.do")
	public String search_email (@ModelAttribute(name = "dto") member_dto dto, HttpServletResponse res,HttpSession se) throws Exception {

		res.setContentType("text/html;charset=utf-8");
		this.pw = res.getWriter();

		member_dto result = this.dao.search_email(dto);
		
		if(result != null) {
			se.setAttribute("memail", result.getMemail());
			this.pw.write("ok");
		} else {
			this.pw.write("false");
		}
		this.pw.close();
		return null;
	}


	
	//로그인
	@PostMapping("/realty/loginok.do")
	public String loginok(@RequestParam("memail") String memail,@RequestParam("mpass") 
	String mpass, HttpSession se,HttpServletResponse res, member_dto dto)  {
		res.setContentType("text/html;charset=utf-8");
		try {
			this.pw = res.getWriter();
			member_dto loginfo = this.dao.member_login(memail, mpass);
			if(loginfo != null) {
				this.pw.write("ok");
				se.setAttribute("memail", loginfo.getMemail());
				se.setAttribute("mname", loginfo.getMname());
				se.setAttribute("mtel", loginfo.getMtel());
				se.setAttribute("login", true);

		
			}else {
				this.pw.write("false");
			}
		} catch (Exception e) {
			
		}
		this.pw.close();
		return null;
	}
	
	//회원가입
	@PostMapping("/realty/joinok.do")
	public String joinok(member_dto m_dto,Model m) throws Exception {
		int result = this.dao.member_join(m_dto);
		String msg = "";
		m.addAttribute(msg);
		
		return "realty/index";
	}
	
	//이메일 중복체크
	@ResponseBody
	@PostMapping("/realty/email_check.do")
	public String email_check(@RequestParam("memail") String memail) throws Exception {
		member_dto email_used = this.dao.email_check(memail);
		
		if (email_used != null) {
			return "false";
		}else {
			return "ok";
		}
	}
	/////로그아웃
	@GetMapping("/realty/logout.do")
	public String logout(HttpServletRequest req)  {
		HttpSession se = req.getSession();
		se.invalidate();
		
		return "realty/index";
	}
	
	/////로그인링크
	@GetMapping("/realty/login.do")
	public String login()  {
		return "realty/login";
	}
	
	/////회원가입링크
	@GetMapping("/realty/member_join.do")
	public String join()  {
		return "realty/member_join";
	}
	
	/////이메일찾기
	@GetMapping("/realty/email_search.do")
	public String email_search()  {
		return "realty/email_search";
	}
	
	/////비밀번호찾기
	@GetMapping("/realty/passwd_search.do")
	public String passwd_search()  {
		return "realty/passwd_search";
	}
	
	/////index링크
	@GetMapping("/realty/index.do")
	public String index(Model m)  {
			List<property_dto> property_dto =  dao.weekinfo(new property_dto());
			m.addAttribute("property_dto",property_dto);
			System.out.println(property_dto);
		return "realty/index";
	}


}

