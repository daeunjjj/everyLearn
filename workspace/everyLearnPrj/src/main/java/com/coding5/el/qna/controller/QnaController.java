package com.coding5.el.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("qna")
public class QnaController {
	
	@GetMapping("list")
	public String list() {
		return "qna/list";
	}
	
	@GetMapping("write")
	public String write() {
		return "qna/write";
	}
}
