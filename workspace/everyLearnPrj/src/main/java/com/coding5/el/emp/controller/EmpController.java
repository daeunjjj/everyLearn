package com.coding5.el.emp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.emp.vo.ResumeVo;



@RequestMapping("emp")
@Controller
public class EmpController {
	
	// 채용 메인 페이지(화면)
	@GetMapping("main")
	public String empMain() {
		return "emp/main";
	}
	
	// 채용 이력서(화면)
	@GetMapping("resume")
	public String resume() {
		return "emp/resume";
	}
	
	// 채용 이력서
	@PostMapping("resume")
	public String resume(ResumeVo vo) {
		return "emp/resume";
	}
	
	
	
}
