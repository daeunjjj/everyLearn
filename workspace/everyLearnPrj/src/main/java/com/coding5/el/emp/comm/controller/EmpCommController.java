package com.coding5.el.emp.comm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("emp-community")
@Controller
public class EmpCommController {
	
	//채용 커뮤니티 리스트
	@GetMapping("list")
	public String list() {
		return "emp-community/list";
	}
	
	//채용 커뮤니티 글쓰기
	@GetMapping("write")
	public String write() {
		return "emp-community/write";
	}
	
	
}
