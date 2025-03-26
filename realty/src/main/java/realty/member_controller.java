package realty;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class member_controller {
	@Resource(name = "member_dto")
	private member_dto m_dto;
	
	@Resource(name = "realty_dao")
	private realty_dao dao;
	
	PrintWriter pw = null;
	
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
	public String loginok(@RequestParam("memail") String memail,@RequestParam("mpass") String mpass, HttpSession se,HttpServletResponse res)  {
		res.setContentType("text/html;charset=utf-8");
		try {
			this.pw = res.getWriter();
			member_dto loginfo = this.dao.member_login(memail, mpass);
			if(loginfo != null) {
				this.pw.write("ok");
				se.setAttribute("memail", loginfo.getMemail());
				se.setAttribute("mname", loginfo.getMname());
		
			}else {
				this.pw.write("false");
			}
		} catch (Exception e) {
			
		}
	
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
	
	/////index링크
	@GetMapping("/realty/index.do")
	public String index()  {
		return "realty/index";
	}

}

