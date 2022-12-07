package com.coding5.el.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("lecture")
@Controller
public class LectureController {
	
	@GetMapping("main")
	public String main() {
		return "lecture/main";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "lecture/lec_detail";
	}
	
	@GetMapping("detail/review")
	public String review() {
		return "lecture/lec_review";
	}
}
