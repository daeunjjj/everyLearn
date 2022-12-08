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
	
//	���� Ŀ�´�Ƽ (���߿� ��Ʈ�ѷ� �ű� ��!)
	
	@GetMapping("class/qna")
	public String qna() {
		return "class_comm/qna";
	}
	
	@GetMapping("class/study")
	public String study() {
		return "class_comm/study";
	}
	
	@GetMapping("class/free")
	public String free() {
		return "class_comm/free";
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
	
}
