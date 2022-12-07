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
	
	@GetMapping("class/qna")
	public String qna() {
		return "class_comm/qna";
	}
	
	@GetMapping("class/study")
	public String study() {
		return "class_comm/study";
	}
	
}
