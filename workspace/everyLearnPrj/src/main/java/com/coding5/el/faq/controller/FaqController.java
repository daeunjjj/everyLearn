package com.coding5.el.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("faq")
public class FaqController {

	//자주 묻는 질문 목록
	@GetMapping("list")
	public String list() {
		return "faq/list";
	}
	
	//자주 묻는 질문 글쓰기
	@GetMapping("write")
	public String write() {
		return "faq/write";
	}
	
	//자주 묻는 질문 글 수정하기
	@GetMapping("edit")
	public String edit() {
		return "faq/edit";
	}
}
