package com.coding5.el.class_comm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassCommController {

	
//	강의 커뮤니티 (나중에 컨트롤러 옮길 것!)
	
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
	
	@GetMapping("class/write")
	public String write() {
		return "class_comm/comm_write";
	}
	

	
}
