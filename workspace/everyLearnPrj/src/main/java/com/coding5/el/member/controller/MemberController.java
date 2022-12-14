package com.coding5.el.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	@GetMapping("member/join")
	public String join() {
		return "member/join";
	}
	
	@GetMapping("member/login")
	public String login() {
		return "member/login";
	}
	
	
	@GetMapping("member/modify")
	public String modify() {
		return "member/modify";
	}
	
	@GetMapping("member/idFind")
	public String idFind() {
		return "member/id_find";
	}
	
	@GetMapping("member/pwFind")
	public String pwFind() {
		return "member/pw_find";
	}
	
	@GetMapping("member/successIdFind")
	public String successIdFind() {
		return "member/success_id_find";
	}
	
	@GetMapping("member/successPwdFind")
	public String successPwdFind() {
		return "member/success_pwd_find";
	}
	
	@GetMapping("member/changePwd")
	public String changePwd() {
		return "member/change_pwd";
	}
	
	@GetMapping("member/alert")
	public String alert() {
		return "member/member_alert";
	}
	
	@GetMapping("member/sidebar")
	public String sidebar() {
		return "member/member_sidebar";
	}
	
	@GetMapping("member/point")
	public String point() {
		return "member/point";
	}
	
}
