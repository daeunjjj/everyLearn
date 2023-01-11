package com.coding5.el;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainPageController {

	@GetMapping("main")
	public String mainPage() {
		return "common/mainPage";
	}
	
	@GetMapping("adWindow")
	public String adWindow() {
		return "common/adWindow";
	}
	
	@GetMapping("closePopup")
	@ResponseBody
	public String closePopup(HttpServletResponse resp) {
		
		Cookie cookie = new Cookie("adCheck", "1");
		cookie.setPath("/el");
		cookie.setMaxAge(60*60*24);
		resp.addCookie(cookie);
		
		return "ok";
	}

}
