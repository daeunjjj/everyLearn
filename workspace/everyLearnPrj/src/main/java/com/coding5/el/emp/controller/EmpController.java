package com.coding5.el.emp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("emp")
@Controller
public class EmpController {
	
	@GetMapping("login")
	public String login() {
		return "emp/member/login";
	}
	
	@GetMapping("join")
	public String join() {
		return "emp/member/join";
	}

	@GetMapping("main")
	public String empMain() {
		return "emp/main";
	}
	
	@GetMapping("resume")
	public String resume() {
		return "emp/resume";
	}
	
	@GetMapping("mypage")
	public String mypage() {
		return "emp/mypage/mypage";
	}
	
	
}
