package com.coding5.el.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("qna")
public class QnaController {
	
	//QNA 목록
	@GetMapping("list")
	public String list() {
		return "qna/list";
	}
	
	//QNA 글쓰기
	@GetMapping("write")
	public String write() {
		return "qna/write";
	}
	
	//QNA 수정하기
	@GetMapping("edit")
	public String edit() {
		return "qna/edit";
	}
	
}
