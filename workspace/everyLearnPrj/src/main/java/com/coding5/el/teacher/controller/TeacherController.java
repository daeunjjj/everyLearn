package com.coding5.el.teacher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("teacher")
@Controller
public class TeacherController {

	@GetMapping("detail")
	public String detail() {
		return "teacher/detail";
	}
	
	@GetMapping("write")
	public String write() {
		return "teacher/enroll_write";
	}
	
}
