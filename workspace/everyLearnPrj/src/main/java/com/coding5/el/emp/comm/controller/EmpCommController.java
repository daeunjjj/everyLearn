package com.coding5.el.emp.comm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.emp.comm.service.EmpCommService;

@RequestMapping("emp-comm")
@Controller
public class EmpCommController {
	
	@Autowired EmpCommService empCommService;
	
	//채용 커뮤니티 리스트
	@GetMapping("list")
	public String list() {
		return "emp-comm/list";
	}
	
	//채용 커뮤니티 글쓰기
	@GetMapping("write")
	public String write() {
		return "emp-comm/write";
	}
	
	//채용 커뮤니티 글쓰기
	@GetMapping("edit")
	public String edit() {
		return "emp-comm/edit";
	}

	//채용 커뮤니티 상세조회
	@GetMapping("detail")
	public String detail() {
		return "emp-comm/detail";
	}
	
	
}
