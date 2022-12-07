package com.coding5.el.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("admin")
@Controller
public class AdminController {
	// 로그인
	@GetMapping("login")
	public String login() {
		return "admin/login";
	}
	
	// 대시보드
	@GetMapping("dashboard")
	public String dashboard() {
		return "admin/dashboard";
	}
	
	// 학생회원 리스트 조회
	@GetMapping("member/student/list")
	public String studentList() {
		return "admin/member/student/list";
	}
	
	// 강사회원 리스트 조회
	@GetMapping("member/teacher/list")
	public String teacherList() {
		return "admin/member/teacher/list";
	}
	
	// 기업회원 리스트 조회
	@GetMapping("member/corporate/list")
	public String corpList() {
		return "admin/member/corporate/list";
	}
	
	// 강사회원 디테일 조회
	@GetMapping("member/teacher/detail")
	public String teacherDetail() {
		return "admin/member/teacher/detail";
	}
	
	// 기업회원 디테일 조회
	@GetMapping("member/corporate/detail")
	public String corporateDetail() {
		return "admin/member/corporate/detail";
	}
	
	// 신고 (강의) 리스트 조회
	@GetMapping("report/class/list")
	public String report() {
		return "admin/report/class/list";
	}
}
