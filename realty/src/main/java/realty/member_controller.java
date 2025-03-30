package realty;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
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


@Controller
public class member_controller {
	@Resource(name = "member_dto")
	private member_dto m_dto;
	
	@Resource(name = "cms_dto")
	private cms_dto c_dto;
	
	@Resource(name = "realty_dao")
	private realty_dao dao;
	
	PrintWriter pw = null;
	

	
	@Autowired
	private realty_service rs;
	
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

	//회원가입
	@PostMapping("/realty/joinok.do")
	public String joinok(member_dto m_dto,Model m) throws Exception {
		int result = this.dao.member_join(m_dto);
		String msg = "";
		m.addAttribute(msg);
		
		return "realty/index";
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
	public String index()  {
		return "realty/index";
	}



}

