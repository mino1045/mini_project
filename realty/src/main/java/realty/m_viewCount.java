package realty;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;

@Repository("m_viewCount")
public class m_viewCount {

	public Boolean viewCountIncrease(HttpServletRequest req, HttpServletResponse res, String board_name,
			int board_index) {
		// 조회수 처리
		Cookie[] cookies = req.getCookies();
		Boolean counted = false; // 조회수 반영

		//
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("aleardyViewed" + board_name + board_index)) {
					counted = true;
					break;
				}
			}
		}

		if (!counted) { // 카운팅이 안 됐다면
			Cookie viewCookie = new Cookie("aleardyViewed" + board_name + board_index, "true");
			viewCookie.setMaxAge(60 * 60 * 24); // 24시간 쿠키
			viewCookie.setPath("/"); // 모든 경로에서 쿠키 설정
			res.addCookie(viewCookie);
			return true;
		}
		return false;
	}

}
